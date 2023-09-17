module Mutations
  class UpdatePost < BaseMutation
    argument :id, Integer, required: true
    argument :title, String, required: false
    argument :content, String, required: false
    argument :account_id, Integer, required: false

    type Types::PostType

    def resolve(id:, **attributes)
      post = Post.find_by!(id: id)
      post.update!(attributes)
      post
    rescue ActiveRecord::RecordNotFound => e
      GraphQL::ExecutionError.new("Couldn't find Post")
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end 
  end
end
