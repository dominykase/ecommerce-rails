# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:login) { |n| "login#{n}" }
    password { BCrypt::Password.create('labas1234!') }
  end
end
