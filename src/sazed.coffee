class Sazed
  _translatePath: (path)->
    path ?= document.location.pathname
    path = path.replace(/\.html/, '.md') # Rename .html to .md
    path = path.concat 'index.md' if path.match(/\/$/)
    path

  constructor: (@options = {})->
    @options['parser'] = @options['parser'] ? require('marked')
    throw "No repo provided" unless @options['repo']?
    throw 'No container given' unless @options['container']?

    @container = document.getElementById(@options['container']) if typeof @options['container'] is 'String'

  edit:(file_path)->

module.exports = Sazed