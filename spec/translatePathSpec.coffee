Sazed  = require 'sazed-core/sazed'

describe 'Sazed url translater', ()->

  sazed = original = final = null

  beforeEach ()->
    sazed = new Sazed({repo:'nemo/nemo', container: 'content'})

  it 'should change ending html to md', ()->
    original = '/blog/hello/world.html'
    final = 'blog/hello/world.md'

  it 'should append index.md for directory paths', ()->
    original = '/blog/'
    final = 'blog/index.md'

  it 'should work for root path', ()->
    original = '/'
    final = 'index.md'

  # This is internally called (not via edit button?)
  it 'should work for non html/md files', ()->
    original = '/_config.yml'
    final = '_config.yml'

  afterEach ()->
    translated = sazed._translatePath(original)
    expect(translated).toEqual(final)