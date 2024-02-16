class Admin::MembersController < AdminController
    before_action :authenticate_user!, :allow_admin

    def index
      @members = User.where(admin_id: current_user.id)
    end

    private

    def allow_admin
      redirect_to root_path unless current_user.admin?
    end
end
