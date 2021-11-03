class Order < ApplicationRecord
  belongs_to :order
  belongs_to :delivery
end
