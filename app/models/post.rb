class Post < ApplicationRecord
  belongs_to :board
  validates :title, presence: true
  validates :serial, uniqueness: true

  before_create :create_serial

  private
  def create_serial
    self.serial = serial_generator(10)
  end
  def serial_generator
    [*'A'..'Z',*'a'..'z',*0..9].sample(10).join
  end
end
