var chalk = require('chalk')
var ProgressBar = require('progress');

var progressBar, delay

var progress = function progress(message, options) {
  options = options === true ? {
    done: true
  } : options

  var formattedMsg = '  ' +
    (options.done ? chalk.green('✓') : options.fail ? chalk.red('☓') : chalk.yellow('»')) +
    ' ' + message
  progressBar.tick({
    message: chalk[options.done ? 'green' : options.fail ? 'red' : 'gray'](formattedMsg),
  });

  return new Promise(resolve => setTimeout(() => {
    if (options.done || options.fail) console.log();
    resolve();
  }, delay));
}

progress.doing = function doing(message) {
  return progress(message, {})
}

progress.done = function done(message) {
  return progress(message, {
    done: true
  })
}

progress.fail = function fail(message) {
  return progress(message, {
    fail: true
  })
}

progress.configure = function configure(options) {
  options = options || {}
  progressBar = new ProgressBar(':message', {
    total: options.total || Infinity,
  });

  delay = options.delay || 10
}

progress.configure()

module.exports = progress