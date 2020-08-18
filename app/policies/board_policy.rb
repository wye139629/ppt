class BoardPolicy < ApplicationPolicy
  def index?
    true    
  end

  def show
    true
  end
  
  def create?
    if plan_a_user
      user.boards.count < 2
    elsif plan_b_user || admin
      true
    else
      false
    end
    
  end

  private
  def plan_a_user
    user && user.role == 'plan_a'
  end
  
  def plan_b_user
    user &&　user.role == 'plan_b'
  end

  def admin
    user && user.role == 'admin'
  end
  
  
  

  
end