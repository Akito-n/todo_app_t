FactoryBot.define do
  factory :task do
    title {"編集テストtitle"}
    description {"編集説明"}
    user_id { 1 }
  end

  factory :order_task, class: Task do
    description {"説明"}
    user_id { 1 }

    trait :create2011_01_01 do
      title {"タイトル1"}
      created_at {"2011-01-01 00:00:00"}
      priority { 0 }
    end

    trait :create2012_01_01 do
      title {"タイトル2"}
      created_at {"2012-01-01 00:00:00"}
      priority { 1 }
    end

    trait :created2013_01_01 do
      title {"タイトル3"}
      created_at {"2013-01-01 00:00:00"}
      priority { 2 }
    end
  end

  factory :sort_term_task, class: Task do
    description {'説明'}
    created_at {'2011-01-01 00:00:00'}
    user_id { 1 }

    trait :term01 do
      title {'１月'}
      term {'2019-01-01'}
    end
    trait :term02 do
      title {'２月'}
      term {'2019-02-01'}
      status {2}
    end
    trait :term03 do
      title {'３月'}
      term {'2019-03-01'}
      status {1}
    end
    trait :term04 do
      title {'4月'}
      term {'2019-04-01'}
    end
    trait :term05 do
      title {'５月'}
      term {'2019-05-01'}
    end
  end
end
