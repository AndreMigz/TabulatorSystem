class Admin::MembersController < AdminController
    before_action :authenticate_user!, :allow_admin

    def index
      @members = User.where(admin_id: current_user.id)
    end

    def create
      @member = User.new(member_params)

      if @member.save
        redirect_to admin_members_path, notice: "Member Added"
      else
        redirect_to admin_members_path, error: "Failed to add member."
      end
    end

    private

    def member_params
      params.require(:user).permit(:admin_id, :email, :password, :password_confirmation)
    end

    def allow_admin
      redirect_to root_path unless current_user.admin?
    end
end
