var shelljs = require('shelljs'),
    Slack = require('slack-client'),
    config = require('./config.json'),
    autoReconnect = true,
    autoMark = true;

if (shelljs.exec('bundle exec wraith capture wraith/wraith.yaml').code !== 0) {
  var slack = new Slack(config.slackToken, autoReconnect, autoMark);

  slack.on("open", function() {
    var channel = slack.getChannelGroupOrDMByID(config.slackChannel);
    channel.send('<!channel> There are significant visual changes, please review - ' + config.divshotURL);
    shelljs.exit(0);
  });

  slack.login();
}
