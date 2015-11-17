class NgoSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :url

  has_many :initiatives, serializer: InitiativeSummarySerializer, include: :attributes

  def url
    api_ngo_path(object)
  end

  def initiatives
    object.initiatives.last(3)
  end
end
