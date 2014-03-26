class UserMailer < ActionMailer::Base
  default from: "infobytes.tutorials@gmail.com"

  def new_tutorial_email(tutorial, community)
    @tutorial_name = tutorial.name
    @community_name = community.name
    @users = community.users.collect do { |user| user.email }
    mail(to: @users, subject: 'New Tutorial in Community #{@community_name}')
  end

end
