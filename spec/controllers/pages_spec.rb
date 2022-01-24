require 'rails_helper'

RSpec.describe PagesController do
  describe "GET #pageshome" do 
    subject { get :home }

    it "renders the home template" do      
      expect(subject).to render_template(:home)
      expect(subject).to render_template('home')
      expect(subject).to render_template('pages/home')
    end

    it "does not render a different template" do
      expect(subject).to_not render_template('pages/index')
    end
  end
end