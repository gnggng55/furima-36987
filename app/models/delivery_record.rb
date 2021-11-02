class DriveryRecord
  include ActiveModel::Model
  attr_accessor :price, :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :telephone_number, :record

  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
    validates :user_id, :item_id,:telephone_number, :city
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  end


  def save
    record = Record.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, telephone_number: telephone_number, record_id: record_id)
  end
end