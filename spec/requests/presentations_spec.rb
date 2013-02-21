require "spec_helper"

describe "Presentations" do

  before do
    @user = FactoryGirl.create(:student_sam)
    login_with_oauth @user
  end

  it "should render the Listing presentations page" do
  	visit presentations_path
    page.should have_selector('h1', :content => "Listing presentations")
    page.should have_link("My presentations")
    page.should have_link("Today's presentations")
  end

  it "should render Today's presentation page" do
    visit today_presentations_path
    page.should have_selector('h1', :content => "Today's presentations")
    page.should have_link("My presentations")
    page.should have_link("All presentations")
  end

  it "should render My presentations page" do
  	visit("/people/#{@user.twiki_name}/my_presentations")
  	page.should have_selector('h1', :content => "My Presentations")
    page.should have_link("Today's presentations")
    page.should have_link("All presentations")
  end
end