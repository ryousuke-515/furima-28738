FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    first_name { 'ホゲ' }
    last_name { 'てすと' }
    first_name_kana { 'ホゲ' }
    last_name_kana { 'テスト' }
    birth_date { '1999-05-15' }
  end
end
