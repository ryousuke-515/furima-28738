class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to :item_purchase


  with_options presence: true do
    validates :post_code
    validates :area_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :phone_number
  end
end
