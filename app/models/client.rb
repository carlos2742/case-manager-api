class Client < ApplicationRecord
  include GraphQL::Interface
  validates :email, :phone_number, presence: true
end
