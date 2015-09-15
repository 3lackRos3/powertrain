json.array!(@engines) do |engine|
  json.extract! engine, :id, :title, :subtitle, :price, :stock_status, :availability, :product_code, :image_urls, :description
  json.url engine_url(engine, format: :json)
end
