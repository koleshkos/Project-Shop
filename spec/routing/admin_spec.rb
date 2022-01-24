require 'rails_helper'

RSpec.describe 'Admin', type: :routing do 
  describe 'GET /admin' do
    it 'routes /admin to the /index action' do      
      expect(get '/admin').to route_to('admin#index')
    end
  end
end