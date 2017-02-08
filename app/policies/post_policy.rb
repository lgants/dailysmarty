class PostPolicy < ApplicationPolicy
  # overrides the update? method originally declared in the ApplicationPolicy since it simply returns false  (side note: this means that it will block every update action that it's added to throughout the application)
  def update?
    user_who_can_access_post
  end

  def edit?
    user_who_can_access_post
  end

  def user_who_can_access_post
    record.user_id == user.id
  end
end
