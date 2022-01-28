# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StaticPagesController do
  describe 'GET #home' do
    subject { get :home }

    it 'renders the home template' do
      expect(subject).to render_template(:home)
    end

    it 'does not render a different template' do
      expect(subject).to_not render_template('static_pages/admin_home')
    end
  end

  describe 'GET #admin_home' do
    subject { get :admin_home }

    it 'renders the home template' do
      expect(subject).to render_template(:admin_home)
    end

    it 'does not render a different template' do
      expect(subject).to_not render_template('static_pages/home')
    end
  end
end
