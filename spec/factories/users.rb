FactoryBot.define do
  factory :user do
    name                  { '山田太郎' }
    name_kana             { 'ヤマダタロウ' }
    employee_id           { '11111' }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
  end
end
