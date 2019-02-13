FactoryBot.define do
  factory :task do
    title {"編集テストtitle"}
    description {"編集説明"}
  end

  factory :order_task do
    title {"タイトル"}
    description {"説明"}

    trait :create2011_01_01 do
      created_ad {"2011-01-01 00:00:00"}
    end

    trait :create2012_01_01 do
      created_at {"2012-01-01 00:00:00"}
    end

    trait :created2013_01_01 do
      created_at {"2013-01-01 00:00:00"}
    end
  end


end
