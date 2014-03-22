require 'spec_helper'

describe ChaptersController do

	xit "redirects to the chapter show page upon save" do 
		post :create, topic: FactoryGirl.attributes_for(:topic) 
		response.should redirect_to chapter_url
	end

end