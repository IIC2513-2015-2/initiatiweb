json.array!(@initiatives) do |initiative|
  json.extract! initiative, :id, :title, :description, :image, :active, :hashtag, :ngo_id
  json.url initiative_url(initiative, format: :json)
end
