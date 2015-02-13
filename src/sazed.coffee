EpicEditor = require 'EpicEditor/src/editor'

class Sazed
  _translatePath: (path)->
    path ?= document.location.pathname
    # Append index.md if the path ends in a slash
    path = path.concat 'index.md' if path.match(/\/$/)
    # Remove the starting slash
    path = path.slice(1)
    # Rename .html to .md
    path = path.replace(/\.html/, '.md')
    # Return
    path

  _parseRepo: (repo)->
    if repo.indexOf('#') == -1
      [repo, 'master']
    else
      repo.split('#')

  constructor: (@options = {})->
    @options['parser'] = @options['parser'] ? require('marked')
    throw "No repo provided" unless @options['repo']?
    throw 'No container given' unless @options['container']?

    [@options['repo'], @options['branch']] = @_parseRepo(@options['repo'])

    @options['container'] = document.getElementById(@options['container']) if typeof @options['container'] is 'String'

    localStorageKey = 'sazed' + document.location.path # something like sazed/blog/2014/12/hello-world.html
    
    @editor = new EpicEditor
      container: @options['container']
      parser: @options['parser'],
      # TODO: Figure out how to use the System path translater
      # basePath: System.translate 'EpicEditor/epiceditor'
      basePath: '/js/lib/github/OscarGodson/EpicEditor@0.2.3/epiceditor',
      localStorageName: localStorageKey,
      file:
        autosave: false,
      theme:
        editor: '/themes/editor/epic-light.css',
      autogrow: true

  edit:(file_path)->

module.exports = Sazed