json.array!(@users) do |user|
  json.extract! user, :id, :username, :key
  json.url user_url(user, format: :json)
end
