class ClothsController < ApplicationController
  require 'rqrcode'
  require 'rqrcode_png'
  require 'chunky_png'
  require 'securerandom'

  def new
    @cloth = Cloth.new
  end

  def create
    @cloth = Cloth.new(params.require(:cloth).permit(:icon, :name, :color1, :color2, :design))
    @cloth.small_category = SmallCategory.find_by_name(params[:cloth][:small_category])

    if (@cloth.save)
      qr = RQRCode::QRCode.new("/api/cloths/show/#{@cloth.id}", :size => 3, :level => :h)
      image = qr.as_png

      file_path = File.join(ApplicationController.get_cloth_qr_dir, "#{SecureRandom.uuid}.png")
      image.resize(200, 200).save(file_path)
      @cloth.qr = File.open(file_path)
      if (@cloth.save)
         puts "success"
         redirect_to @cloth, notice: "服を追加しました。"
      else
        puts "failed"
        redirect "/cloths/new", alert: "服の作成に失敗しました。"
      end
    else
      puts "failed"
      redirect "/cloths/new", alert: "服の作成に失敗しました。"
    end
  end

  def show
    @cloth = Cloth.find(params[:id])

    @qr = RQRCode::QRCode.new("#{@cloth.id}", :size => 4, :level => :h )
  end
end
