class Board < ApplicationRecord
  acts_as_paranoid

  # default_scope{ normal }

  has_many :posts # , dependent: :destroy
  validates :title, presence: true

  
  has_many :board_masters
  has_many :users, through: :board_masters
  

  has_many :favorite_boards
  has_many :my_users, through: :favorite_boards, source: :user
 
  def favorited_by?(u)
    my_users.include?(u)
  end
  # default_scope {where(deleted_at: nil)}
  # scope(:available, -> {where(deleted_at: nil)})

  # def self.available
  #   where(deleted_at: nil)
  # end

  # def destroy
  #   update(deleted_at Time.now)
  # end

  include AASM
  aasm(column: 'state') do
    state :normal, initial: true
    state :hidden, :locked
  

    event :hide do
      transitions from: [:normal, :locked], to: :hidden
    end
    event :show do
      transitions from: :hidden, to: :locked
    end
    
    event :lock do
      transitions from: [:normal, :hidden], to: :locked

      # after_transaction do
      #   puts 'locked!'
      # end
    end

    event :unlock do
    transitions from: :locked , to: :normal
    end

  end
end
