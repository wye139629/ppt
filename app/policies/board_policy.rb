class BoardPolicy < ApplicationPolicy
  def index?
    true    
  end

  def show
    true
  end
  
  def create?
    plan_a_user || plan_b_user || admin
  end

  private
  def plan_a_user
    user.role == 'plan_a'
  end
  
  def plan_b_user
    user.role == 'plan_b'
  end

  def admin
    user.role == 'admin'
  end
  
  
  

  
end