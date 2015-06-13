json.msg @result
if (@result == "success")
  json.cloth do
    json.id @cloth.id
    json.name @cloth.name
    json.icon @cloth.icon.url
    json.small_category_id  @cloth.small_category_id
    json.color1 @cloth.color1
    json.color2 @cloth.color2
    json.design @cloth.design
    json.amount @cloth.amount
  end
end
