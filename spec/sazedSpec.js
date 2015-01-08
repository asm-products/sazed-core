// Generated by CoffeeScript 1.6.3
(function() {
  var Sazed;

  Sazed = require('sazed-core/sazed');

  describe('Sazed options parser', function() {
    beforeEach(function() {
      var contentDiv;
      contentDiv = document.getElementById('content');
      contentDiv && contentDiv.remove();
      return document.write("<div id='content'></div>");
    });
    it('should validate options', function() {
      expect(function() {
        var sazed;
        return sazed = new Sazed();
      }).toThrow('No repo provided');
      return expect(function() {
        var sazed;
        return sazed = new Sazed({
          repo: 1
        });
      }).toThrow('No container given');
    });
    it('should store the options', function() {
      var options, sazed;
      options = {
        repo: 1,
        container: 'content'
      };
      sazed = new Sazed(options);
      return expect(sazed.options).toEqual(options);
    });
    return it('should load its dependencies', function() {
      var sazed;
      sazed = new Sazed({
        repo: 1,
        container: 'content'
      });
      return expect(sazed.options.parser).toBeDefined();
    });
  });

  describe('Sazed url translater', function() {
    var final, original, sazed;
    sazed = original = final = null;
    beforeEach(function() {
      return sazed = new Sazed({
        repo: 1,
        container: 'content'
      });
    });
    it('should change ending html to md', function() {
      original = '/blog/hello/index.html';
      return final = '/blog/hello/index.md';
    });
    it('should append index.md for directory paths', function() {
      original = '/blog/';
      return final = '/blog/index.md';
    });
    it('should work for root path', function() {
      original = '/';
      return final = '/index.md';
    });
    return afterEach(function() {
      var translated;
      translated = sazed._translatePath(original);
      return expect(translated).toEqual(final);
    });
  });

}).call(this);
