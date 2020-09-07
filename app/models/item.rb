class Item < ApplicationRecord
  belongs_to_active_hash :genre
  has_one :item_purchase


  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_charges_id
    validates :area_id
    validates :shiiing_days_id
    validates :price
  end
end
