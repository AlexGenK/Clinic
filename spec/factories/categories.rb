FactoryBot.define do
  factory :doc_category, class: Category do
    name { 'Therapist' }
  end

  factory :invalid_category, class: Category do
    name { '' }
  end
end
