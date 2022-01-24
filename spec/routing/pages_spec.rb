require 'rails_helper'

RSpec.describe 'Pages', type: :routing do 
  describe 'GET /' do
    it 'routes / to the /index action' do      
      expect(get '/').to route_to('pages#home')
    end
  end
end