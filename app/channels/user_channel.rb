class UserChannel < ApplicationCable::Channel
  def subscribed
    stream_from "user/#{params[:user_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
