class ContestantsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @contestants = Contestant.all
  end
end
