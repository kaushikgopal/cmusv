require_relative '../../app/services/peer_evaluation_email.rb'

describe PeerEvaluationEmail do

	context "send email" do
	  it "should respond to send_email" do
	  	PeerEvaluationEmail.should respond_to(:send_email)
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