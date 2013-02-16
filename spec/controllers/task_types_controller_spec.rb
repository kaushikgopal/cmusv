require 'spec_helper'

describe TaskTypesController do
  render_views

	describe "GET index" do
	  it "should render the index view" do
	  	get :index
	  	response.should render_template :index
	  end
	end

 describe "GET show" do
   it "should render the show view" do
     get :show
     response.should render_template :show
   end
 end

end