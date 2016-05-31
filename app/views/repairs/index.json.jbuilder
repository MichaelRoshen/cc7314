json.array!(@repairs) do |repair|
  json.extract! repair, :id, :phone, :address, :send_date, :repair_date, :repairman, :summary, :note
  json.url repair_url(repair, format: :json)
end
