![sparkbox-wraith](http://i.imgur.com/IyY0wP4.jpg)

sparkbox-wraith is a tool that glues together a few excellent services to provide notifications when builds have significat visual differences. 
sparkbox-wraith wouldn't be possible without:

  - [BBC-News Wraith](https://github.com/BBC-News/wraith) project
  - [Slack](http://slackhq.com)
  - [CircleCI](http://circleci.com)
  - [Divshot](https://divshot.com/).

## Set up

There's quite a bit of setup to get sparkbox-wraith ready to go.

1. Create a [Slack bot](https://api.slack.com/bot-users)
2. Add that bot token to `config.json`. Use `config-sample.json` as a template.
3. Add the channel name to `config.json`.
4. "Invite" the bot to the channel. Typing `@INSERT_BOT_NAME_HERE` in the channel will send an invite.
5. Create a new divshot app to host the wraith diff web page, with `divshot init`.
6. Fill out the url of the divshot app in `config.json`
7. Create a divshot token and add it to CircleCI to allow Circle to push to divshot after running wraith.
