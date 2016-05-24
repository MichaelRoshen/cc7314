json.array!(@rooms) do |room|
  json.extract! room, :id, :house_num, :room_type_id, :building_id, :room_in_date, :area
  json.url room_url(room, format: :json)
end
