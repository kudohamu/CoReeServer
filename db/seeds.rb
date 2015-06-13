# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'rqrcode'
require 'rqrcode_png'
require 'chunky_png'
require 'securerandom'

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

## いちきくんユーザ用のseedデータ

user = User.create!(
  name: "ichiki",
  uid: 555743372,
  provider: "twitter"
)

# ジャケット
Cloth.create!(
  name: "グレーのカーディガン",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/ジャケット/カーディガン/6845743B_18_D_500.jpg")),
  color1: "グレー系",
  color2: "なし",
  design: "無地",
  amount: rand(500) + 100,
  small_category_id: 2004
)
Cloth.create!(
  name: "青のカーディガン",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/ジャケット/カーディガン/6845743B_34_D_500.jpg")),
  color1: "ブルー系",
  color2: "なし",
  design: "無地",
  amount: rand(500) + 100,
  small_category_id: 2004
)
Cloth.create!(
  name: "かわいいダッフル",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/ジャケット/ダッフル/3748241_171_D_500.jpg")),
  color1: "ベージュ系",
  color2: "なし",
  design: "無地",
  amount: rand(500) + 100,
  small_category_id: 2012
)
Cloth.create!(
  name: "縞々セーター",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/ジャケット/セーター/7220754B_20_D_500.jpg")),
  color1: "ホワイト系",
  color2: "グレー系",
  design: "ボーダー",
  amount: rand(500) + 100,
  small_category_id: 2001
)
Cloth.create!(
  name: "モダンなピー",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/ジャケット/ピー/5636913B_16_D_500.jpg")),
  color1: "ブラック系",
  color2: "なし",
  design: "無地",
  amount: rand(500) + 100,
  small_category_id: 2013
)

#トップス
Cloth.create!(
  name: "無難なTシャツ",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/トップス/Tシャツ/6838406B_1_D_500.jpg")),
  color1: "ホワイト系",
  color2: "なし",
  design: "無地",
  amount: rand(500) + 100,
  small_category_id: 1001
)
Cloth.create!(
  name: "情報系シャツ",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/トップス/シャツ/4841529B_34_D_500.jpg")),
  color1: "ブルー系",
  color2: "ホワイト系",
  design: "チェック",
  amount: rand(500) + 100,
  small_category_id: 1002
)
Cloth.create!(
  name: "休日スウェット",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/トップス/スウェット/7695405B_18_D_500.jpg")),
  color1: "グレー系",
  color2: "ホワイト系",
  design: "無地",
  amount: rand(500) + 100,
  small_category_id: 1004
)
Cloth.create!(
  name: "チャラいタンク",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/トップス/タンクトップ/6865173_18_D_500.jpg")),
  color1: "グリーン系",
  color2: "ホワイト系",
  design: "迷彩",
  amount: rand(500) + 100,
  small_category_id: 1005
)
Cloth.create!(
  name: "暖色ポロ",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/トップス/ポロシャツ/7179943B_10_D_500.jpg")),
  color1: "グリーン系",
  color2: "ホワイト系",
  design: "無地",
  amount: rand(500) + 100,
  small_category_id: 1006
)

#パンツ
Cloth.create!(
  name: "さり気ないカーゴ",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/パンツ/カーゴ/3452980_13_D_500.jpg")),
  color1: "レッド系",
  color2: "ホワイト系",
  design: "ドット",
  amount: rand(500) + 100,
  small_category_id: 3003
)
Cloth.create!(
  name: "みじけぇスラックス",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/パンツ/スラックス/4868124_156_D_500.jpg")),
  color1: "グレー系",
  color2: "ホワイト系",
  design: "ボーダー",
  amount: rand(500) + 100,
  small_category_id: 3003
)
Cloth.create!(
  name: "爽やかチノ",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/パンツ/チノ/6856785_20_D_500.jpg")),
  color1: "ホワイト系",
  color2: "なし",
  design: "無地",
  amount: rand(500) + 100,
  small_category_id: 3004
)
Cloth.create!(
  name: "マジで普通なデニム",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/パンツ/デニム/5782669B_33_D_500.jpg")),
  color1: "ブルー系",
  color2: "なし",
  design: "無地",
  amount: rand(500) + 100,
  small_category_id: 3001
)
Cloth.create!(
  name: "千鳥格子なデニム",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/パンツ/デニム/7116889_14_D_500.jpg")),
  color1: "ブラック系",
  color2: "ホワイト系",
  design: "チェック",
  amount: rand(500) + 100,
  small_category_id: 3001
)

#シューズ
Cloth.create!(
  name: "おしゃれにコンビニサンダル",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/シューズ/サンダル/7246485_144_D_500.jpg")),
  color1: "ブラック系",
  color2: "ホワイト系",
  design: "無地",
  amount: rand(500) + 100,
  small_category_id: 6002
)
Cloth.create!(
  name: "シティーボーイスニーカー",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/シューズ/スニーカー/7437922_8_D_500.jpg")),
  color1: "ブラック系",
  color2: "ホワイト系",
  design: "無地",
  amount: rand(500) + 100,
  small_category_id: 6001
)
Cloth.create!(
  name: "ほっそいブーツ",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/シューズ/ブーツ/5823159B_8_D_500.jpg")),
  color1: "ブラック系",
  color2: "なし",
  design: "無地",
  amount: rand(500) + 100,
  small_category_id: 6003
)
Cloth.create!(
  name: "シンプルな革靴",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/シューズ/革靴/4573714_16_D_500.jpg")),
  color1: "ブラック系",
  color2: "なし",
  design: "無地",
  amount: rand(500) + 100,
  small_category_id: 6005
)
Cloth.create!(
  name: "シックなスニーカー",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/シューズ/スニーカー/6625962_2_D_500.jpg")),
  color1: "グレー系",
  color2: "ホワイト系",
  design: "無地",
  amount: rand(500) + 100,
  small_category_id: 6001
)

#帽子
Cloth.create!(
  name: "おひさまキャップ",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/帽子/キャップ/7519849_16_D_500.jpg")),
  color1: "ブルー系",
  color2: "イエロー系",
  design: "無地",
  amount: rand(500) + 100,
  small_category_id: 7001
)
Cloth.create!(
  name: "もふもふばいざー",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/帽子/サンバイザー/7389129_8_D_500.jpg")),
  color1: "ブラック系",
  color2: "ホワイト系",
  design: "無地",
  amount: rand(500) + 100,
  small_category_id: 7005
)
Cloth.create!(
  name: "そこら辺にいるニット",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/帽子/ニット/5097741_32_D_500.jpg")),
  color1: "イエロー系",
  color2: "なし",
  design: "無地",
  amount: rand(500) + 100,
  small_category_id: 7003
)
Cloth.create!(
  name: "めっちゃ目立つハット",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/帽子/ハット/7652253_55_D_500.jpg")),
  color1: "ブルー系",
  color2: "ホワイト系",
  design: "無地",
  amount: rand(500) + 100,
  small_category_id: 7002
)
Cloth.create!(
  name: "中佐ベレー",
  icon: File.open(File.join(Rails.root, "app/assets/images/clothes/帽子/ベレー帽/6790159_65_D_500.jpg")),
  color1: "グリーン系",
  color2: "ブラック系",
  design: "迷彩",
  amount: rand(500) + 100,
  small_category_id: 7004
)

Cloth.all.each do |cloth|
  qr = RQRCode::QRCode.new("/api/cloths/#{cloth.id}", :size => 3, :level => :h)
  image = qr.as_png

  file_path = File.join(ApplicationController.get_cloth_qr_dir, "#{SecureRandom.uuid}.png")
  FileUtils.mkdir_p(ApplicationController.get_cloth_qr_dir) unless FileTest.exist?(ApplicationController.get_cloth_qr_dir)
  image.resize(200, 200).save(file_path)
  cloth.qr = File.open(file_path)
  cloth.save!
end

Cloth.all.each do |cloth|
  UsersCloth.create!(
    user: user,
    cloth: cloth,
    buy: true
  )
end
