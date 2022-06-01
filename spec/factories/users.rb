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

  factory :user_admin, class: User do
    username      { 'Chee-Chee' }
    phone         { '+380502223322' }
    email         { Faker::Internet.unique.email }
    password      { '123456' }
    user_role     { false }
    admin_role    { true }
    doctor_role   { false }
  end
end