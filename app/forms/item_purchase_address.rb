class ItemPurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :item_purchase_id, :area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is sure to enter 7 digits including hyphens.' }
    validates :area_id, numericality: { other_than: 0 }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is sure to enter numerical values' }
    validates :token
  end
  def save
    item_purchase = ItemPurchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, item_purchase_id: item_purchase.id, area_id: area_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end
