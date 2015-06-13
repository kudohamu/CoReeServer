class Cloth < ActiveRecord::Base
  belongs_to :small_category

  has_many :users_cloths
  has_many :users, through: :users_cloths

  mount_uploader :icon, ClothIconUploader
  mount_uploader :qr, ClothQrUploader

  def self.get_colors
    colors = [
      "ホワイト系",
      "ブラック系",
      "グレー系",
      "ブラウン系",
      "ベージュ系",
      "グリーン系",
      "ブルー系",
      "パープル系",
      "イエロー系",
      "ピンク系",
      "レッド系",
      "オレンジ系",
      "シルバー系",
      "ゴールド系"
    ]
  end

  def self.get_designs
    designs = [
      "無地",
      "ストライプ",
      "ボーダー",
      "迷彩",
      "ドット",
      "チェック"
    ]
  end
end
