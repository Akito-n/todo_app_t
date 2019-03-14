FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'サンプル一号' }
    email { 'sample@samp.com' }
    password { 'password' }
  end

  factory :new_user, class: User do
    id { 2 }
    name {'新人'}
    email {'new-user@samp.com'}
    password {' password '}
  end
end
