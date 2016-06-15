require "slack-ruby-client"

class SlackWraith

  def self.send_msg(token, channel, app_name)
    puts "Sending to slack"

    Slack.configure do |config|
      config.token = token
    end
    @client = Slack::Web::Client.new

    wraithURL = "test"

    @client.chat_postMessage(
      channel: channel,
      text: "<!channel> - There are significant visual changes from http://#{app_name}.herokuapp.com, please review - #{wraithURL}",
      as_user: true
    )
  end
end
