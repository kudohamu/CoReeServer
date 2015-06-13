class Api::ClothesController < ApplicationController
  before_filter :login_check

  def hoge
    cloth = Cloth.create(
      name: "ほげ"
    )

    @result = if(cloth) then "success" else "failed" end

    render formats: [:json], handlers: [:jbuilder]
  end
end
