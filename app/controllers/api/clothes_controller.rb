class Api::ClothesController < ApplicationController
  before_filter :login_check

  def new
    if (params[:method] == "QR")
      cloth = Cloth.find(params[:cloth_id])
      @result = "error"
      if (!cloth.present?)
        @result = "invalid_id"
      else
        if (UsersCloth.where(user: @current_user, cloth: cloth).exists?)
          @result = "already_had"
        else
          UsersCloth.create!(user: @current_user, cloth: cloth)
          @result = cloth.id
        end
      end
    else
      cloth = Cloth.create!(
        name: params[:cloth][:name],
        icon: params[:cloth][:icon],
        small_category_id: params[:cloth][:small_category_id],
        color1: params[:cloth][:color1],
        color2: params[:cloth][:color2],
        design: params[:cloth][:design],
        amount: 0
      )

      UsersCloth.create!(user: @current_user, cloth: cloth)
      @result = cloth.id
    end

    render formats: [:json], handlers: [:jbuilder]
  end

  def show
    @cloth = Cloth.find(params[:id])
    if (!@cloth.present?)
      @result = "invalid_id"
    else
      @result = "success"
    end

    render formats: [:json], handlers: [:jbuilder]
  end

  def recommendation
    #トップスから1つ
    @tops = @current_user.cloths.where(small_category_id: [1000..1007]).sample
    #ジャケットから1つ
    @jacket = @current_user.cloths.where(small_category_id: [2000..2014]).sample
    #パンツから1つ
    @pants = @current_user.cloths.where(small_category_id: [3000..3007]).sample
    #シューズから1つ
    @shoes = @current_user.cloths.where(small_category_id: [6000..6006]).sample
    #キャップから1つ
    @cap = @current_user.cloths.where(small_category_id: [7000..7006]).sample

    @cloths = [@tops, @jacket, @pants, @shoes, @cap]
    render formats: [:json], handlers: [:jbuilder]
  end
end
