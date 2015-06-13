json.cloths do
  json.array! @cloths do |cloth|
    json.cloth do
      json.id cloth.id
      json.big_category_id (cloth.small_category_id / 1000).to_i
      json.icon cloth.icon.url
    end
  end
end
