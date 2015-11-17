class InitiativeSummarySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :url

  def url
    api_initiative_path(object)
  end
end
