# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pages', type: :routing do
  describe 'GET /' do
    it 'routes / to the /index action' do
      expect(get('/')).to route_to('static_pages#home')
    end
  end

  describe 'GET /admin' do
    it 'routes /admin to the /statick_home action' do
      expect(get('/admin')).to route_to('static_pages#admin_home')
    end
  end
end
