require 'spec_helper'

describe TaskTypesController do
		it "should render the index view" do
	  	login(FactoryGirl.create(:student_sam))
			get :index
			response.should render_template :index
		end
 end
