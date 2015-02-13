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
      sazed = new Sazed({repo: 'nemo/nemo'})
    .toThrow 'No container given'

  it 'should store the options', ()->
    options = {repo: 'nemo/nemo', container: 'content'}
    sazed = new Sazed(options)
    expect(sazed.options).toEqual(options)

  it 'should load its dependencies', ()->
    sazed = new Sazed({repo: 'nemo/nemo', container: 'content'})
    expect(sazed.options.parser).toBeDefined()

  it '_parseRepo should work', ()->
    sazed = new Sazed({repo: 'nemo/nemo', container: 'content'})
    result = sazed._parseRepo('nemo/nemo#master')
    expect(result[0]).toEqual('nemo/nemo')
    expect(result[1]).toEqual('master')

  it 'should read branch name from repo name', ()->
    sazed = new Sazed repo: 'nemo/nemo#master', container: 'content'
    expect(sazed.options.repo).toEqual('nemo/nemo')
    expect(sazed.options.branch).toEqual('master')