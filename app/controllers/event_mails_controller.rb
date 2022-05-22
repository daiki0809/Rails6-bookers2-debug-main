class EventMailsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
  end

  def create
    EventMailer.with(group_id: params[:group_id], title: params[:title], content: params[:content]).event_email.deliver_now
    redirect_to group_event_email_result_path(title: params[:title], content: params[:content])
  end

  def result
    @title = params[:title]
    @content = params[:content]
  end
end
