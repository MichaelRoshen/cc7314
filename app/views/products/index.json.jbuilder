json.array!(@products) do |product|
  json.extract! product, :id, :name, :count, :price, :total_price, :product_type_id, :note
  json.url product_url(product, format: :json)
end
