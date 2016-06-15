require "thor"
require_relative "./plugins/slack-wraith"
require_relative "./uploader"

class Wraithify < Thor
  desc "check", "check site with wraith"
  options :slack_channel => :string,
          :heroku_app_name => :string,
          :s3_key_id => :string,
          :s3_secret_key => :string,
          :slack_token => :string

  def check
    puts 'Starting Wraith...'
    wraith_result = system 'bundle exec wraith capture ~/projects/gap-future/wraith.yaml'
    unless wraith_result
      Uploader.upload(options[:s3_key_id], options[:s3_secret_key])

      SlackWraith.send_msg options[:slack_token], options[:slack_channel], options[:heroku_app_name]
    end
  end
end

Wraithify.start(ARGV)



# Questions
# - Docker?
#   - What does starting a new check look like?
# - Still using S3?
# - Where is wraith.yaml coming from?
