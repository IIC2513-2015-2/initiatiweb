json.array!(@ngos) do |ngo|
  json.extract! ngo, :id, :name, :logo, :email, :description, :webpage
  json.url ngo_url(ngo, format: :json)
end
