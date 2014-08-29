json.array!(@notifications) do |notification|
  json.extract! notification, :id, :username, :message, :beaconid, :between_start, :between_end
  json.url notification_url(notification, format: :json)
end
