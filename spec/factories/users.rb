FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 5)}
    email                 {Faker::Internet.free_email}
    password              {'kkk666'}
    password_confirmation {password}
    last_name             {'例'}
    first_name            {'例'}
    last_name_kana        {'テスト'}
    first_name_kana       {'テスト'}
    birthday              {'1990-03-15'}
  end
end