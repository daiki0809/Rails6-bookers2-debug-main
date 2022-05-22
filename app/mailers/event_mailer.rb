class EventMailer < ApplicationMailer
  def event_email
    @content = params[:content]
    group_users = Group.find(params[:group_id]).group_users
    to_list = []
    group_users.each do |group_user|
      to_list.push(group_user.user.email)
    end

    mail(to: to_list, subject: params[:title])
  end
end
