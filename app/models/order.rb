class Order < ApplicationRecord
  belongs_to :order
  belongs_to :delivery
  belongs_to :item
  belongs_to :user
end
