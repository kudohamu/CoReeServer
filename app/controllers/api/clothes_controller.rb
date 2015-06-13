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
  end

  def hoge
    cloth = Cloth.create(
      name: "ほげ"
    )

    @result = if(cloth) then "success" else "failed" end

    render formats: [:json], handlers: [:jbuilder]
  end
end
