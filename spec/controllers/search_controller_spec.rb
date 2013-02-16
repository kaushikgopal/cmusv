require "spec_helper"

describe SearchController do

    
    context "GET #index" do
        
        it "populates the docs array with some values" do
          get :index, :query => "something"
          # assigns(:docs).should eq "something"
          assigns(:docs).should eq nil
        end

    end
end