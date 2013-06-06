require_relative '../../app/services/peer_evaluation_email.rb'
require_relative '../../app/mailers/generic_mailer.rb'

describe PeerEvaluationEmail do

	context "send email" do
	  it "should respond to send_email" do
	  	PeerEvaluationEmail.should respond_to(:send_email)
	  end

	  xit "should deliver email with options" do
	    options =
	    GenericMailer.should_receieve(:email).with(options)
	  end

	end

	context "send peer evaluation email" do
		it "should respond to send_peer_evaluation_email" do
		  PeerEvaluationEmail.should respond_to(:send_peer_evaluation_email)
		end
	end

	context "please do peer evaluation email" do
		it "should respond to please_do_peer_evaluation_email" do
		  PeerEvaluationEmail.should respond_to(:please_do_peer_evaluation_email)
		end
	end



end