module Mutations
  class RegisterMutation < BaseMutation
    argument :account_role, Types::AccountRoleType, required: true
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :zipcode, String, required: true
    argument :address, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :date_of_birth, String, required: false
    argument :company_number, String, required: false

    def resolve(**kwards)
      account = Account.new(kwards)

      if account.save
        account.token = account.to_sgid(expires_in: 12.hours, for: 'graphql')
        account
      else
        raise GraphQL::ExecutionError.new(account.errors.full_messages)
      end
    end
  end
end