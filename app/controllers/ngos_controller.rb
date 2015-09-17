class NgosController < ApplicationController
  def index
    @ngos = Ngo.all
  end

  def show
    @ngo = Ngo.find(params[:id])
    @last_initiatives = @ngo.last_initiatives
  end
end
