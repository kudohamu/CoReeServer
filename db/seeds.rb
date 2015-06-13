# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


big_category = %W(トップス ジャケット パンツ スカート ワンピース シューズ 帽子)
small_category = { 
  1001 => "Tシャツ", 
  1002 => "シャツ",
  1003 => "ポロシャツ",
  1004 => "スウェット",
  1005 => "タンクトップ",
  1006 => "キャミソール",

  2001 => "セーター",
  2002 => "ベスト",
  2003 => "パーカー",
  2004 => "カーディガン",
  2005 => "テーラード",
  2006 => "デニム",
  2007 => "ライダース",
  2008 => "ブルゾン",
  2009 => "ミリタリー",
  2010 => "ダウンベスト",
  2011 => "ダウンジャケット",
  2012 => "ダッフル",
  2013 => "P",

  3001 => "デニム",
  3002 => "パンツ",
  3003 => "カーゴ",
  3004 => "チノ",
  3005 => "スラックス",
  3006 => "スキニー",

  4001 => "スカート",
  4002 => "デニムスカート",

  5001 => "ワンピース",
  5002 => "シャツワンピース",
  5003 => "チュニック",
  5004 => "ドレス",

  6001 => "スニーカー",
  6002 => "サンダル",
  6003 => "ブーツ",
  6004 => "パンプス",
  6005 => "革靴",

  7001 => "キャップ",
  7002 => "ハット",
  7003 => "ニット",
  7004 => "ベレー帽",
  7005 => "サンバイザー"
}

big_category.each.with_index(1) do |category, id|
  BigCategory.create!(
    id: id,
    name: category
  )
end

small_category.each do |key, value|
  SmallCategory.create!(
    id: key,
    name: value,
    big_category_id: (key / 1000).to_i
  )
end
