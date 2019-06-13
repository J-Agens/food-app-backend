class OrderBoardChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "order_board_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    # raise "huh?"
  end
end
