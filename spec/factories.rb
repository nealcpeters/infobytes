FactoryGirl.define do
	factory :topic do
       title "Movies"
    end
end

FactoryGirl.define do
	factory :user do
		first_name "Han"
		last_name "Solo"
		user_name "rebel_scum"
		email "han@alliance.com"
		password "password"
		password_confirmation "password"
	end
end


# it { should allow_value('http://foo.com', 'http://bar.com/baz').for(:website_url) }
#   it { should_not allow_value('asdfjkl').for(:website_url) }