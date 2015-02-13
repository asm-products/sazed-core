Octokat = require 'octokat'
Backend = require 'sazed-core/backend'

describe 'Sazed backend', ()->

  api = null

  beforeEach ()->
    api = new Backend 'asm-products/sazed', branch: 'gh-pages'

  it 'should instantiate a github instance', ()->
    expect(api.service()).not.toBe(null)

  it 'should be able to fetch document contents', (done)->
    api.read 'about.md', (document)->
      expect(document).not.toBe(undefined)
      done()