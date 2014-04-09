class CommentPolicy < ApplicationPolicy

  def create?
   user.present? && (record.user == user || user.role?(:admin) || user.role?(:member))
   end
  

def destroy?
  user.present? && (record.user == user || user.role(:admin) || user.role?(:member))
 end
end

