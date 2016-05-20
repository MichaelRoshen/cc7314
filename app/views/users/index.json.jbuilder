json.array!(@users) do |user|
  json.extract! user, :id, :name, :age, :role
  json.url user_url(user, format: :json)
end
