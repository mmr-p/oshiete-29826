FactoryBot.define do
  factory :restaurant do
    name                  { 'さつき' }
    description           { '賑やかで宴会向きの雰囲気です！お値段も手頃でもつ鍋が美味しいお店です！' }
    genre_id              { '2' }
    ambiance_id           { '2' }
    price_id              { '2' }
    tel                   { '0861234567' }
    address               { '岡山市北区青江1-2-3' }
    opening_hour          { '10:00 - 22:00' }
    closed                { '木曜日' }
    association           :user
  end
end
