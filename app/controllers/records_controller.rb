class RecordsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @delivery_record = Delivery_record.new
  end

  def create
    @delivery_record = Delivery_record.new(record_params)
    if @delivery_record.valid?
      @delivery_record.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def donation_params
    params.require(:delivery_record).permit.(:postal_cord, :prefecture_id, :city, :address, :building, :telephone_number,:record)merge(user_id: current_user.id)
  end

  def address_params
    params.permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(donation_id: @donation.id)
  end
end
end
