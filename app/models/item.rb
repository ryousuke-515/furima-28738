class Item < ApplicationRecord
  belongs_to_active_hash :genre
  has_one :item_purchase
end
