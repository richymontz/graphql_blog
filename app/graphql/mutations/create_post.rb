module Mutations
  class CreatePost < BaseMutation
    argument :title, String, required: true
    argument :content, String, required: true
    argument :account_id, Integer, required: true

    type Types::PostType

    def resolve(**attributes)
      post = Post.create!(attributes)
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
