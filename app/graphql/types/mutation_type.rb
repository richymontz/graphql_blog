module Types
  class MutationType < Types::BaseObject
    #Posts
    field :delete_post, Types::PostType, mutation: Mutations::DeletePost
    field :update_post, Types::PostType, mutation: Mutations::UpdatePost
    field :create_post, Types::PostType, null: false, mutation: Mutations::CreatePost

    # Authentication
    field :login, Types::AccountType, null: false, mutation: Mutations::LoginMutation
    field :register, Types::AccountType, null: false, mutation: Mutations::RegisterMutation
  end
end
