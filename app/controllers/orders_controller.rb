class OrdersController < ApplicationController
  before_action :set_item

  def index
    @delivery_record = DeliveryRecord.new
    @item = Item.find(params[:item_id])
  end

  def create
    @delivery_record = DeliveryRecord.new(derivery_record_params)
    if @delivery_record.valid?
      @delivery_record.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def derivery_record_params
    params.require(:delivery_record).permit(:postal_code, :prefecture_id, :city, :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end
