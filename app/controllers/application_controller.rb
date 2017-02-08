class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # overrides the default current_user method provided by devise, since the ApplicationController is called after the Devise gem loads our new method will override the gem method
  # By calling super first, this means that we're telling Rails to simply use the Devise version of current_user
  # If no user is logged in, in other words if current_user is nil the pipes || tell the method to instead return an OpenStruct object that has one attribute: full_name and it's set to "Guest"
  # This is much better behavior for the application to have, now we won't have to worry about our current_user calls returning nil and causing errors. Side note: this is a good pattern to follow for many other classes as well
  def current_user
    super || OpenStruct.new(full_name: 'Guest')
  end
end
