# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :login, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
