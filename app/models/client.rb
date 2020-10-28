class Client < ApplicationRecord
  include GraphQL::Interface
  validates :email, :phone_number, presence: true

  has_many :cases

  scope :find_by_name, ->(name){where("LOWER(first_name) LIKE ? OR LOWER(last_name) LIKE ?", "%#{name.downcase}%", "%#{name.downcase}%")}
end
