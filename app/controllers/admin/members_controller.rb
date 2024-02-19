class Admin::MembersController < AdminController
    before_action :authenticate_user!, :allow_admin
    before_action :set_member, only: [:update, :destroy]

    def index
      @members = User.where(admin_id: current_user.id)
    end

    def create
      member = User.new(member_params)

      if member.save
        redirect_to admin_members_path, notice: "Member Added"
      else
        redirect_to admin_members_path, error: "Failed to add member."
      end
    end

    def update
      if @member.update(member_params)
        redirect_to admin_members_path, notice: "Member Updated Successfully"
      else
        redirect_to admin_members_path, error: "Failed to update member."
      end
    end

    def destroy
      redirect_to admin_members_path, notice: "Member Deleted Successfully" if @member.destroy
    end

    private

    def member_params
      params.require(:user).permit(:id, :admin_id, :email, :password, :password_confirmation)
    end

    def set_member
      @member = User.find_by(id: params[:id])

      redirect_to admin_members_path, error: "Member not found." unless @member
    end

    def allow_admin
      redirect_to root_path unless current_user.admin?
    end
end
