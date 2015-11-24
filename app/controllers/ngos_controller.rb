class NgosController < ApplicationController
  def index
    @ngos = Ngo.all
  end

  def show
    @ngo = Ngo.find(params[:id])
    @last_initiatives = @ngo.last_initiatives
    @open_data_category = @ngo.open_data_category
    @related_resources = OpenDocumentService.new.get_documents_for(@open_data_category, 10) if @open_data_category.present?
  end
end
