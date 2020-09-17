FactoryBot.define do
  factory :item_purchase_address do
    token {'tokentokentokentoken'}
    post_code { '123-4567' }
    item_purchase_id {'2'}
    area_id { '2' }
    city { '平塚市' }
    address { '平塚市田村1-1-1' }
    building_name {'平塚ハイツ'}
    phone_number { '09012345678' }
    item_id {'3'}
    user_id {'3'}
  end
end

