class InitiativeSignsController < ApplicationController
  def create
    initiative = Initiative.find(params[:initiative_id])
    initiative_sign = InitiativeSign.create(initiative_sign_params.merge(user_id: current_user.id, initiative_id: params[:initiative_id]))
    redirect_to ngo_initiative_path(initiative.ngo, initiative)
  end

  private
  def initiative_sign_params
    params.require(:initiative_sign).permit(:message)
  end
end
