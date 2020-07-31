class Board < ApplicationRecord
  acts_as_paranoid
  has_many :posts # , dependent: :destroy
  validates :title, presence: true
  
  # default_scope {where(deleted_at: nil)}
  # scope(:available, -> {where(deleted_at: nil)})

  # def self.available
  #   where(deleted_at: nil)
  # end

  # def destroy
  #   update(deleted_at Time.now)
  # end
end
