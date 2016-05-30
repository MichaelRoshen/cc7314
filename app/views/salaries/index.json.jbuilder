json.array!(@salaries) do |salary|
  json.extract! salary, :id, :user_id, :price, :bonus, :grant_date
  json.url salary_url(salary, format: :json)
end
