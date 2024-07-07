var progress = require('./print-progress')

function doNext(i, until, prev) {
  progress[i === prev ? 'done' : Math.random() > .5 ? 'doing' : 'fail']('Doing step ' + i + '...')
    .then(() => {
      if (i !== until || prev !== i) {
        doNext(prev == i ? i + 1 : i, until, i)
      }
    })
}

progress.configure({
  delay: 100
})
doNext(1, 10)