class ApplicationController < ActionController::Base
  include Pundit
  # By default Pundit simply raises an exception when a user attempts to access a page they're not authorized to view
  # Need to rescue the Pundit::NotAuthorizedError exception and tell the application how to handle it instead
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception

  before_action :get_subdomain

  # overrides the default current_user method provided by devise, since ApplicationController is called after Devise gem loads; the current_user method below will override the gem method
  # calling super first tells Rails to simply use the Devise version of current_user
  # if no user is logged in (i.e. if current_user is nil the pipes), || tell the method to instead return an OpenStruct object that has one attribute: full_name and it's set to "Guest"
  # this is much better behavior for the application to have, now we won't have to worry about our current_user calls returning nil and causing errors. Side note: this is a good pattern to follow for many other classes as well
  def current_user
    super || OpenStruct.new(full_name: 'Guest')
  end

  private
    def user_not_authorized
      flash[:alert] = "You are not authorized to access this page."
      redirect_to(request.referrer || root_path)
    end

    def get_subdomain
      puts "The Subdomain is:"
      puts request.subdomain
      raise
    end
end
