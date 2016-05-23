json.array!(@estates) do |estate|
  json.extract! estate, :id, :name, :area, :postions, :price
  json.url estate_url(estate, format: :json)
end
