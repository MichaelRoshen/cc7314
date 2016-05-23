json.array!(@charges) do |charge|
  json.extract! charge, :id, :name, :charge_type_id, :price, :room_id, :user_id
  json.url charge_url(charge, format: :json)
end
