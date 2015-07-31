var shelljs = require('shelljs'),
    Slack = require('slack-client'),
    config = require('./config.json'),
    autoReconnect = true,
    autoMark = true;

var slack = new Slack(config.slackToken, autoReconnect, autoMark);

slack.on("open", function() {
  var channel = slack.getChannelByName(config.slackChannel);

  if (shelljs.exec('bundle exec wraith capture wraith.yaml').code !== 0) {
    channel.send('<!channel> there are significant visual changes, please review - ' + config.divshotURL);
    setTimeout(function(){shelljs.exit(0);}, 1000);
  }
});

slack.login();
