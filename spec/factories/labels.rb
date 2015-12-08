include RandomData

FactoryGirl.define do
  factory :label do
    sequence(:name){ RandomData.random_name }
  end
end
