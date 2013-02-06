require "spec_helper"

describe SearchController do

    before do
      @search_results = nil
    end

    describe "GET search" do
      it "should render deafult page" do
        post :index, :query => "something"
        assigns(:docs).should == [@search_results]
      end
    end

    context "Global Search" do
        xit "is able to call the search method" do
          post :index, :new_query => "something"
          SearchController.should_receive(:index)
        end
        xit "filters out junk variables in searchquery" do
          SearchController::should_receive(:search).with("something123")
          get :index, :query => "something*$()}123"
        end
        xit "is able to call the search method" do
          SearchController::should_receive(:search).with("something")
          get :index, :query => "something"
        end
    end
end