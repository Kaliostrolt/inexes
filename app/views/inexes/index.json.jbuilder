json.array!(@inexes) do |inex|
  json.extract! inex, :id, :user_id, :category_id, :name, :cost
  json.url inex_url(inex, format: :json)
end
