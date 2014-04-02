class CommentsPolicy < ApplicationPolicy

  def create?
    user.present? && (record.user == user) || user.role?(:admin) || user.role(:moderator) || user.role(:member))
  end
end