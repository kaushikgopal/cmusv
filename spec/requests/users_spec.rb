require "spec_helper"

describe "Users" do

  before do
   @user = FactoryGirl.create(:student_sam)
   login_with_oauth @user
  end


 it 'renders the show page' do
   visit('/people/StudentSam')
   page.should have_content("Student Sam")
end

 it 'renders the edit page' do
   visit('/people/StudentSam/edit')   
   page.should have_content("Student")
   page.should have_selector("input#user_linked_in")
end



end
