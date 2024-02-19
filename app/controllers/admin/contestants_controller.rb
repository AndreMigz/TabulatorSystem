class Admin::ContestantsController < AdminController
  before_action :set_contestant, only: [:update, :destroy]

  def index
    @contestants = Contestant.where(user_id: current_user.id)
  end

  def create
    member = Contestant.new(contestant_params)
    if member.save
      redirect_to admin_contestants_path, notice: "Contestant Added"
    else
      redirect_to admin_contestants_path, error: "Failed to add contestant."
    end
  end

  def update
    if @contestant.update(contestant_params)
      redirect_to admin_contestants_path, notice: "Contestant Updated Successfully"
    else
      redirect_to admin_contestants_path, notice: "Failed to update contestant"
    end
  end

  def destroy
    redirect_to admin_contestants_path, notice: "Member Deleted Successfully" if @contestant.destroy
  end


  private

  def contestant_params
    params.require(:contestant).permit(:id, :first_name, :middle_name, :last_name, :age, :address, :user_id)
  end

  def set_contestant
    @contestant = Contestant.find_by(id: params[:id])

    redirect_to admin_contestants_path, error: "Contestant not found" unless @contestant
  end
end
