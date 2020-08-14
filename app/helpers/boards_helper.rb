module BoardsHelper
  def display_bm(b)
    if b.users.count === 0
      '徵求中'
    else  
      b.users.map{|user| user.account}.join('/')
    end
  end
end
