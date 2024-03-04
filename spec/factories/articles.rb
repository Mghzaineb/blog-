FactoryBot.define do
  factory :model do
    first_name { "sarra" }
    last_name { "sghaier" }
    username{"sarra"}
    email { "sarra@gmail.com" }
    password { "password123" }
    password_confirmation { "password123" }
  end
end
FactoryBot.define do
    factory :article do
      title { "nouveau article" }
      body { "c'est un nouveau article" }
      status { "public" }
    end
  end