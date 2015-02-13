#sazed-core [![Build Status](https://travis-ci.org/asm-products/sazed-core.svg?branch=master)](https://travis-ci.org/asm-products/sazed-core)

This is the core JS that powers Sazed. Include sazed in your Jekyll projects to get access to the API.

To understand what sazed is, see the readme of the [helper repo](https://github.com/asm-products/sazed#readme)

#API

    var sazed = new Sazed(options);

options is a hash that can contain the following keys:

- container: The container div that will contain the editor and the page html. Note that sazed will clear this div on load, and only an editor will remain.
- repo: Repo identifier on GitHub (something like `captn3m0/sazed`)
- onsave: handler to be called after Sazed saves the content. Can be used to refresh the page or show any errors that return.
- parser: A parser method which Sazed will pass to EpicEditor. If none is passed, Marked is used as the default parser.

## Methods

    sazed.edit(file_path)

Loads the editor. Here `file_path` is an optional argument, which Sazed will try to infer from the current URL in the browser. `file_path` is something like `content/licence.md`.

#Hacking

- Testing framework used is Jasmine.
- Karma is used as the testrunner.
- JSPM is used as the package manager for browser based dependencies
- System dependencies are handled via npm (such as phantom and coffee)
- All code is written in coffeescript
- Travis is used for testing builds

##Setup Steps

    npm install
    jspm endpoint config github
    jspm install
    # Run the following 2 commands in separate tabs
    coffee -cbw spec/
    coffee -cbw src/
    karma start

I will be fixing the coffee thing, which is a minor pain point for now.

I follow [Readme Driven Development](http://tom.preston-werner.com/2010/08/23/readme-driven-development.html), so you might see features and API mentioned in docs and README that doesn't exist right now.