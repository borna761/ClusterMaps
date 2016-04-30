json.array!(@activities) do |activity|
  json.extract! activity, :location, :activity_type_id, :startDate, :hostedBy, :participants, :comments
  json.url activity_url(activity, format: :json)
end
