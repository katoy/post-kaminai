json.array!(@names) do |name|
  json.extract! name, :id, :name, :tel, :address
  json.url name_url(name, format: :json)
end
