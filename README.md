#sazed-core

This is the core JS that powers Sazed. Include sazed in your Jekyll projects to get access to the API.

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