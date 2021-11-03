class OrdersController < ApplicationController


  def index
    @delivery_record = DeliveryRecord.new
  end

  def create
    @delivery_record = DeliveryRecord.new(derivery_record_params)
  end

  private


  def derivery_record_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :address, :building, :telephone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

end
