class UserMailer < ActionMailer::Base
  default from: "infobytes.tutorials@gmail.com"

  def new_tutorial_email(tutorial, community)
  	@tutorial = tutorial
    @tutorial_name = @tutorial.title
    @tutorial_id = @tutorial.id
    @community_name = community.name
    @subject_line = 'New Tutorial Added in Community ' + community.name.capitalize
    @users = community.users.collect { |user| user.email }
    
    mail(to: @users, subject: @subject_line)
  end

end
