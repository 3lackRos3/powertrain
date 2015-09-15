json.array!(@runs) do |run|
  json.extract! run, :id, :date
  json.url run_url(run, format: :json)
end
