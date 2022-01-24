require 'rails_helper'

RSpec.describe 'Pages', type: :request do 
  describe 'GET /' do
    it 'return success http status' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end
end