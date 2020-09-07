class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :area
  belongs_to_active_hash :shipping_day

  has_one :item_purchase


  with_options presence: true do
    validates :name
    validates :description
    validates :genre_id, numericality: { other_than: 1 } 
    validates :genre_id, numericality: { other_than: 1 }
    validates :shipping_charges_id, numericality: { other_than: 1 }
    validates :area_id, numericality: { other_than: 1 }
    validates :shiiing_days_id, numericality: { other_than: 1 }
    validates :price
    
  end
end
