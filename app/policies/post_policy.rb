class PostPolicy < ApplicationPolicy

  def index?
    true
  end

   def update?
    user.present? && (record.user == user || user.role?(:admin) || user.role?(:member))
   end
  end
  
 

  def destroy?
    user.present? && (record.user == user || user.role?(:admin) || user.role?(:moderator))
  end
 






