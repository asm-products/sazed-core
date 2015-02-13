Octokat = require 'octokat'

class Backend

  constructor: (repo, @options = {})->
    throw "No repo provided" unless repo?

    [user, repo] = repo.split('/')

    # TODO: If we are provided auth, use it here
    # @repo = new Octokat(username, password)
    @repo = new Octokat()
      .repos(user, repo)

  read: (path, cb)->
    @repo.contents(path).read().then(cb)

  service: ()->
    @repo || null

module.exports = Backend