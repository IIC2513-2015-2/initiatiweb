class InitiativesController < ApplicationController
  def index
    @ngo = Ngo.find(params[:ngo_id])
    @initiatives = @ngo.initiatives
  end

  def show
    @ngo = Ngo.find(params[:ngo_id])
    @initiative = @ngo.initiatives.find(params[:id])
    @signs_count = @initiative.signs.count
    @user_sign = @initiative.signs.of_user(current_user.id) if current_user
    @initiative_sign = InitiativeSign.new unless @user_sign
  end
end
