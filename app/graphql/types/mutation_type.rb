module Types
  class MutationType < Types::BaseObject
    field :login, Types::AccountType, null: false, mutation: Mutations::LoginMutation
    field :register, Types::AccountType, null: false, mutation: Mutations::RegisterMutation
  end
end
