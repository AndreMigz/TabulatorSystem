class AdminController < ApplicationController
    layout 'admin/application'
     before_action :authenticate_user!, :allow_admin

    def index; end

  private
    def allow_admin
      redirect_to root_path unless current_user.admin?
    end
end
