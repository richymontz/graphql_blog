require 'rails_helper'

RSpec.describe 'Mutation Register' do
  context 'When is resquested with correct params' do
    let(:account) { FactoryBot.build(:account, :as_individual) }
    let(:query_response) { execute(account) }

    it 'creates an account' do
      expect(query_response.dig("data", "register", "email")).to be_present
      expect(query_response.dig("data", "register", "token")).to be_present
    end
  end

  context 'When wrong praams' do
    let(:account) { FactoryBot.build(:account, :blank_password) }
    let(:query_response) { execute(account) }

    it 'gets register error' do
      expect(query_response.dig("errors")).to be_present
    end
  end
  
  def execute(account)
    GraphqlBlogSchema.execute(query_register, variables: { 
      accountRole: account.account_role,
      firstName: account.first_name,
      lastName: account.last_name,
      zipcode: account.zipcode,
      address: account.address,
      email: account.email, 
      password: account.password,
      dateOfBirth: '24-10-1966' 
    }) 
  end

  def query_register
    <<-GQL
          mutation Register(
            $accountRole: AccountRole!,
            $firstName: String!,
            $lastName:  String!,
            $zipcode:  String!,
            $address:  String!,
            $email: String!,
            $password: String!,
            $dateOfBirth: String
          ){
            register(
              input: {
                accountRole: $accountRole,
                firstName: $firstName,
                lastName: $lastName,
                zipcode: $zipcode,
                address: $address,
                email: $email,
                password: $password,
                dateOfBirth: $dateOfBirth
              }
            ){
              email
              token
            }
          }
        
      GQL
  end
end