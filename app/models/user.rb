class User < ApplicationRecord
  validates :account, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  has_many :board_masters
  has_many :boards, through: :board_masters

  has_many :posts
  has_many :comments
  
  has_many :favorite_boards
  has_many :my_boards ,through: :favorite_boards, source: :board

  before_create :encrypt_password



  def toggle_favorite(b)
    if my_boards.exists?(b.id)
      my_boards.destroy(b)
    else
      my_boards << b
    end
  end
  


  def self.login(options)
    if options[:account] && options[:password]
      find_by(account: options[:account], password: Digest::SHA1.hexdigest('x' + options[:password] + 'y'))
    end
  end


  private
  def encrypt_password
    self.password = bigbang(self.password)
  end

  def bigbang(string)
    string = 'x' + string + 'y'
    Digest::SHA1.hexdigest(string)
  end

  
end
