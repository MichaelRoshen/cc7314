json.array!(@complaints) do |complaint|
  json.extract! complaint, :id, :content, :state, :user_id
  json.url complaint_url(complaint, format: :json)
end
