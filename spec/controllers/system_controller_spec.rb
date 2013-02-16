require 'spec_helper'

describe SystemController do

  context "any user" do
    before do
      login(FactoryGirl.create(:student_sam))
    end

    describe "GET index" do
      before do
        get :index
      end

      it "should only setup normal rails information" do
#        response.status.should be(200)
      end
      it "should render the index view" do
        response.should render_template :index
      end
    end

  end
end