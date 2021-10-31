class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]

  def index
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

    def move_to_signed_in
      unless user_signed_in?
        redirect_to  user_session_path
      end
    end

end
