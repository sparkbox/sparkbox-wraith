FROM ruby:2.1.9

ENV APP_HOME /wraith

# Create app dir and move to $APP
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Install Gems
COPY Gemfile* $APP_HOME/
RUN bundle install

COPY . $APP_HOME

ENTRYPOINT ["ruby", "wraithify.rb", "check"]

# ruby wraithify.rb check 
#   --slack_channel=sbotting
#   --heroku_app_name=gap-future-pr-1501 
#   --s3-key-id=AKIAJAIDQ3RHKHZQL6TA
#   --s3_secret_key=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
#   --slack_token=xoxb-4659486352-AjDkWhfaQguhowbxdAMjiQdD
