FactoryBot.define do
  factory :appointment, class: Appointment do
    association :patient, factory: :user_patient
    association :doctor, factory: :user_doctor
  end
end