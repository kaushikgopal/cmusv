require "spec_helper"

describe "Sponsored projects" do
  
	it "should not render for students" do
    login_with_oauth(FactoryGirl.create(:student_sam))
    visit sponsored_projects_path
    page.should have_content("You don't have permission to read sponsored project.")
  end

  context "for faculty and admin" do
	  before do
	  	login_with_oauth(FactoryGirl.create(:admin_andy))
	  end

	  it "should render the sponsored projects listing page" do
	    visit sponsored_projects_path
	    page.should have_content("Allocations")
	    page.should have_link("This month's efforts")

	    page.should have_selector('h1', :content => "Sponsored Projects")
	    page.should have_link("New project")
	    page.should have_selector('h1', :content => "Sponsors")
	    page.should have_link("New sponsor")
	  end    
	  it "should render the new sponsored project page" do
	    visit new_sponsored_project_path
	    page.should have_selector('h1', :content => "New Sponsored Project")
	    page.should have_selector("input#sponsored_project_name")
	  end
    



    it "adds a new sponsor and displays the results" do
      visit sponsored_projects_path
      expect{
	      click_link 'New sponsor'
        page.should have_selector('h1', :content => "New Sponsor")
	      fill_in 'sponsored_project_sponsor_name', with: "Andrew Carnegie"
	      click_button "sponsored_project_sponsor_submit"
      }.to change(SponsoredProjectSponsor,:count).by(1)
      page.should have_content "Sponsor was successfully created."
      page.should have_content "Andrew Carnegie"
    end
    
    it "adds a new project and displays the results" do
      # create the sponsor first
      visit new_sponsored_project_sponsor_path
      fill_in 'sponsored_project_sponsor_name', with: "Andrew Carnegie"
      click_button "sponsored_project_sponsor_submit"

      visit sponsored_projects_path
      expect{
        click_link 'New project'
	      page.should have_selector('h1', :content => "New Project")
        select 'Andrew Carnegie', :from => "sponsored_project[sponsor_id]"
        fill_in 'sponsored_project_name', with: "Test Project 1234abcd"
        click_button "sponsored_project_submit"
      }.to change(SponsoredProject,:count).by(1)
      page.should have_content "Project was successfully created."
      page.should have_content "Test Project 1234abcd"
    end


  end

end