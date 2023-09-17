module Mutations
  class DeletePost < BaseMutation
    argument :id, Integer, required: true

    def resolve(id:)
      post = Post.find_by!(id: id)
      post.delete
      post
    rescue ActiveRecord::RecordNotFound => e
      GraphQL::ExecutionError.new("Couldn't find Post")
    end
  end
end
