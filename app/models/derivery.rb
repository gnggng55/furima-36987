class Derivery < ApplicationRecord
  belongs_to :record
  has_one :order
end
