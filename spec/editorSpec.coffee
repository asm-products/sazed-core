Sazed  = require 'sazed-core/sazed'
EpicEditor = require 'EpicEditor/src/editor'

describe 'Sazed editor', ()->
  sazed = null

  beforeEach ()->
    contentDiv = document.getElementById('content')
    if contentDiv
      contentDiv.innerHTML = "<div id='content'></div>"
    else
      document.write "<div id='content'></div>"
    sazed = new Sazed repo:'jekyll/jekyll', container: 'content'

  it 'should create an editor', ()->
    expect(sazed.editor).toBeDefined()

  it 'should be an EpicEditor', ()->
    expect(sazed.editor).toEqual(jasmine.any(EpicEditor));