class User < ApplicationRecord
  include GraphQL::Interface

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable, :recoverable, :rememberable, :validatable,
         :database_authenticatable, :token_authenticatable

  enum roles: [ :developer, :admin, :collaborator]
end
