# frozen_string_literal: true

module Types
  class AccountType < Types::BaseObject
    field :id, ID, null: false
    field :account_role, Types::AccountRoleType, null: false
    field :first_name, String
    field :last_name, String
    field :email, String
    field :token, String
    field :password_diggest, String
    field :address, String
    field :zipcode, String
    field :date_of_birth, GraphQL::Types::ISO8601Date
    field :company_number, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
