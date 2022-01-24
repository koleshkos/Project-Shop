require 'rails_helper'

RSpec.describe AdminController do
  describe "GET admin#index" do 
    subject { get :index }

    it "renders the index template" do      
      expect(subject).to render_template(:index)
      expect(subject).to render_template('index')
      expect(subject).to render_template('admin/index')
    end

    it "does not render a different template" do
      expect(subject).to_not render_template('admin/show')
    end
  end
end