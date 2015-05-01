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
3. Get the Slack channel ID by using curl or postman to request `https://slack.com/api/channels.list?token=TOKEN`. See [the api basics](https://api.slack.com/web#basics) for information on the API and how to generate a new token.
4. Add the channel ID to `config.json`.
5. Create a new divshot app to host the wraith diff web page.
6. Fill out the app name in the `wraith/divshot.json` file.
7. Fill out the url of the divshot app in `config.json`
8. Create a divshot token and add it to CirclCI to allow Circle to push to divshot after running wraith.
