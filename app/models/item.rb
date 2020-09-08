class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :area
  belongs_to_active_hash :shipping_day
  has_one_attached :image

  has_one :item_purchase




  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 } 
    validates :condition_id, numericality: { other_than: 1 }
    validates :shipping_charges_id, numericality: { other_than: 1 }
    validates :area_id, numericality: { other_than: 0 }
    validates :shipping_days_id, numericality: { other_than: 1 }
    validates :price, numericality: { greater_than: 300, less_than: 9_999_999 },format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width nimber."}
    
  end
end
