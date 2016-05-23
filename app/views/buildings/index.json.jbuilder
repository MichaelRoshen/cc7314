json.array!(@buildings) do |building|
  json.extract! building, :id, :num, :name, :face, :floor_num, :building_type_id, :estate_id
  json.url building_url(building, format: :json)
end
