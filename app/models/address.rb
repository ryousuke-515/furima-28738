class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to :item_purchase


  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is sure to enter 7 digits including hyphens.' }
    validates :area_id, numericality: { other_than: 0 }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is sure to enter numerical values' }
  end
end

# with_options presence: true do
#   validates :password, format: { with: /\A[a-z0-9]+\z/i, message: 'is invalid. Input half-width characters.' }
#   validates :nickname
#   validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
#   validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
#   validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
#   validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
#   validates :birth_date
# end