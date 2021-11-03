class DeliveryRecord
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :telephone_number, :tokun

  with_options presence: true do
    validates :user_id, :item_id,:telephone_number, :city
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: {other_than: 1}
  end


  def save
    record = Record.create(item_id: item_id, user_id: user_id)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, telephone_number: telephone_number, record_id: record.id)
  end
end