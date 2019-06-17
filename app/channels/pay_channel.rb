class PayChannel < ApplicationCable::Channel
  def subscribed
    stream_from "pay_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
