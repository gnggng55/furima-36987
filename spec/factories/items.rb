FactoryBot.define do
  factory :item do
    item_name         {'テストサンプル'}
    explanation       {'テストサンプルです'}
    category_id       {2}
    status_id         {2}
    delivery_load_id  {2}
    delivery_area_id  {2}
    delivery_day_id   {2}
    price             {400}
    association :user
  end
end
