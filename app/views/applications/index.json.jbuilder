json.array!(@applications) do |application|
  json.extract! application, :id, :make, :model, :year, :cyl, :size, :drv, :vin, :options, :engine_id
  json.url application_url(application, format: :json)
end
