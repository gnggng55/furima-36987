FactoryBot.define do
  factory :delivery_record do
    postal_code      { '123-4567' }
    prefecture_id    { Faker::Number.between(from: 1, to: 47) }
    city             { '六本木' }
    address          { '1-1-1' }
    building         { 'ビル' }
    telephone_number { '00000000000'}
    token            { 'tok_abcdefghijk00000000000000000' }
    user_id          { 1 }
    item_id          { 1 }
  end
end