module Admin
  class ApplicationController < Administrate::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = AdminUser.all.paginate(10, params[:page])
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   AdminUser.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information
    before_filter :authenticate_admin

    def authenticate_admin
      unless current_user.try(:type) == 'AdminUser'
        flash[:alert] = "You are not authorized to access this page."
        redirect_to(root_path)
      end
    end

  end
end
