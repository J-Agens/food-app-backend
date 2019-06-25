class TablesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "tables_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
