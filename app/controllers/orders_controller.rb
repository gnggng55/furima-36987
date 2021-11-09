class OrdersController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, only: :index


  def index
    @delivery_record = DeliveryRecord.new
  end

  def create
    @delivery_record = DeliveryRecord.new(derivery_record_params)
    if @delivery_record.valid?
      pay_item
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
    params.require(:delivery_record).permit(:postal_code, :prefecture_id, :city, :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user.id || @item.record.present?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: derivery_record_params[:token],
      currency: 'jpy'
    )
  end
end
