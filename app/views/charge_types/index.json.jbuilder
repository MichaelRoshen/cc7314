json.array!(@charge_types) do |charge_type|
  json.extract! charge_type, :id, :name
  json.url charge_type_url(charge_type, format: :json)
end
