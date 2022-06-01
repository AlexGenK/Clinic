FactoryBot.define do
  factory :user_doctor, class: Doctor do
    username      { 'Doctor Dolittle' }
    phone         { '+380503332233' }
    email         { Faker::Internet.unique.email }
    password      { '123456' }
    user_role     { false }
    admin_role    { false }
    doctor_role   { true }
  end
end