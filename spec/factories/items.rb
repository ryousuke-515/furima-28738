FactoryBot.define do
  factory :item do
    # active_storage_blobs {Faker::Lorem.sentence}
    user_id {'1'}
    name {'hoge'}
    description {'すごいです'}
    category_id {'2'}
    condition_id {'2'}
    shipping_charges_id {'2'}
    area_id {'2'}
    shipping_days_id {'2'}
    price {'2000'}

  end
end
