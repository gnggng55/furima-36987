class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: :edit

  def index
    @items = Item.all.order("created_at DESC")
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

  def show
  end

  def edit
    if @item.user == current_user
      render "edit"
    else
      redirect_to root_path
    end
  end

  def update
      if @item.update(item_params)
        redirect_to item_path
      else
        render :edit
      end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

    def item_params
      params.require(:item).permit(:item_name, :explanation, :category_id, :status_id, 
        :delivery_load_id, :delivery_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
    end

    def move_to_index
      redirect_to root_path if current_user.id != @item.user.id || @item.record.present?
    end

    def set_item
      @item = Item.find(params[:id])
    end
end
