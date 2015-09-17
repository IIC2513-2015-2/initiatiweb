class InitiativesController < ApplicationController
  def index
    @ngo = Ngo.find(params[:ngo_id])
    @initiatives = @ngo.initiatives
  end

  def show
    @ngo = Ngo.find(params[:ngo_id])
    @initiative = @ngo.initiatives.find(params[:id])
  end
end
