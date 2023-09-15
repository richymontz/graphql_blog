require 'rails_helper'

RSpec.describe 'Mutation Login' do
  context 'When is resquested with correct data' do
    let(:account) { FactoryBot.create(:account) }
    let(:query_response) do 
      GraphqlBlogSchema.execute(query_login, variables: { 
        email: account.email, 
        password: account.password 
      }) 
    end

    it 'Authenticates an account' do
      expect(query_response.dig("data", "login", "token")).to be_present
    end
  end

  context 'When wrong email or pasword is given' do
    let(:query_response) do 
      GraphqlBlogSchema.execute(query_login, variables: {
         email: "wrong@example.com", 
         password: "foo bar" 
      }) 
    end
   
    it 'returns login error' do
      expect(query_response["data"]).to be_nil  
      expect(query_response["errors"]).to be_present
    end
  end
  
  def query_login
    <<-GQL
          mutation Login($email: String! $password: String! ){
            login(
              input: {
                email: $email
                password: $password
              }
            ){
              token
            }
          }
        
      GQL
  end
end