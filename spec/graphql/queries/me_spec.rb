require 'rails_helper'

RSpec.describe 'Query Me' do
  context 'when account is athenticated' do
    let(:account) { FactoryBot.create(:account) }
    let(:query_response) do
      GraphqlBlogSchema.execute(query, context: { current_account: account })
    end

    it 'returns account info' do
     expect(query_response.dig("data", "me", "id")).to eq(account.id.to_s)
     expect(query_response.dig("data", "me", "email")).to eq(account.email)
    end
  end


  def query
    <<-GQL
      query Me{
        me{
          id
          email
        }
      }
    GQL
  end
end