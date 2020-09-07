class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  has_one :item_purchase


  with_options presence: true do
    validates :name
    validates :description
    validates :genre_id, numericality: { other_than: 1 } 
    validates :condition_id
    validates :shipping_charges_id
    validates :area_id
    validates :shiiing_days_id
    validates :price
    
  end
end
