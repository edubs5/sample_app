FactoryGirl.define do
  factory :user do
    name  "Jon Doe"
    email "j@d.com"
    password "foobar"
    password_confirmation "foobar"
  end
end