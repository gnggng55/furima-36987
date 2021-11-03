class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :record
  has_one :order
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_load
  belongs_to :delivery_area
  belongs_to :delivery_day
  belongs_to :prefecture

  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_load_id, numericality: { other_than: 1 }
  validates :delivery_area_id, numericality: { other_than: 1 }
  validates :delivery_day_id, numericality: { other_than: 1 }
  validates :item_name, :explanation, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999},
  format: { with: /\A[0-9]+\z/ }
end
