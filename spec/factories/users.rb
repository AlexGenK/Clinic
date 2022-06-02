FactoryBot.define do
  factory :user_doctor, class: Doctor do
    username      { Faker::Name.unique.name }
    phone         { '+380503332233' }
    email         { Faker::Internet.unique.email }
    password      { Faker::Internet.password }
    user_role     { false }
    admin_role    { false }
    doctor_role   { true }
  end

  factory :user_admin, class: User do
    username      { Faker::Name.unique.name }
    phone         { '+380502223322' }
    email         { Faker::Internet.unique.email }
    password      { Faker::Internet.password }
    user_role     { false }
    admin_role    { true }
    doctor_role   { false }
  end

  factory :user_patient, class: User do
    username      { Faker::Name.unique.name }
    phone         { '+380673334455' }
    email         { Faker::Internet.unique.email }
    password      { Faker::Internet.password }
    user_role     { true }
    admin_role    { false }
    doctor_role   { false }
  end
end