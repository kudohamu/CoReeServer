class ClothsController < ApplicationController
  def new
    @cloth = Cloth.new
  end
end
