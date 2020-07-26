FactoryBot.define do
  factory :side_job do
    user { nil }
    main_job { nil }
    pulled_skill { 'MyText' }
    returned_skill { 'MyText' }
  end
end
