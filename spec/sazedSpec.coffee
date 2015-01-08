Sazed  = require 'sazed-core/sazed'

describe 'Sazed options parser', ()->

  beforeEach ()->
    contentDiv = document.getElementById('content')
    if contentDiv
      contentDiv.innerHTML = "<div id='content'></div>"
    else
      document.write "<div id='content'></div>"

  it 'should validate options', ()->
    expect ()->
      sazed = new Sazed()
    .toThrow 'No repo provided'

    expect ()->
      sazed = new Sazed({repo:1})
    .toThrow 'No container given'

  it 'should store the options', ()->
    options = {repo:1, container: 'content'}
    sazed = new Sazed(options)
    expect(sazed.options).toEqual(options)

  it 'should load its dependencies', ()->
    sazed = new Sazed({repo:1, container: 'content'})
    expect(sazed.options.parser).toBeDefined()