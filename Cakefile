{exec}  = require 'child_process'
util    = require 'util'

anyError = false
errorText = ""

# Generates a callback function for child_process.exec. If a function is passed
# as a parameter, it will be called when the child process finishes.
execCallback = (next) ->
  (err, stdout, stderr) ->
    if err
      anyError = true
      errorText += stderr
    if next? then next()

# Runs a single command with the default callback.
run = (cmd, next) -> exec cmd, execCallback next

invoke_then = (target, next) ->
  util.log "Invoking #{target}"
  run "cake #{target}", next

task 'all', 'full build', (options) ->
  invoke 'build:dom'

task 'build:node', '', (options) ->
  util.log "Building astro-riot.js"
  run "mkdir -p gen"
  run "coffee -o gen src/*.coffee"
  run "mkdir -p gen/ar"
  run "coffee -o gen/ar src/ar/*.coffee"

task 'build:dom', 'rebuild a browser-friendly hcf.js file', (options) ->
  util.log "Building game.js"
  invoke_then "build:node", () ->
    run "doubledot-browserify -o ar.js gen/demo.js"

task 'clean', 'cleans up the workspace', (options) ->
  util.log "Cleaning"
  run "rm -rf lib/"
  run "rm -f  ar.js"

process.on "exit", () ->
  if anyError
    console.log errorText
    util.log "Build Failed"
  else
    util.log "Build Succeeded"

