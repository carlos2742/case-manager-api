class User < ApplicationRecord
  include GraphQL::Interface

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :token_authenticatable

  enum roles: [ :developer, :admin, :collaborator]
  enum titles: [ :attorney, :paralegal, :staff]

  has_many :cases
end
