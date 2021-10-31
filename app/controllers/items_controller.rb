class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new
      end
  end


  private

    def item_params
      params.require(:item).permit(:item_name, :explanation, :category_id, :status_id, 
        :delivery_load_id, :delivery_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
    end
end
