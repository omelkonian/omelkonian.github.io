// Generated by CoffeeScript 1.9.3
(function() {
  var publicationEntry;

  publicationEntry = function(json) {
    return "<dt> " + json.venueAbr + " </dt>\n<dd>\n  <span class=\"paperTitle\"> " + json.title + " </span>\n  <a href=\"data/publications/" + json.id + ".pdf\" target='_blank'> <i class='fa fa-book'></i> </a>\n  <br> <span class=\"paperAuthors\"> " + json.authors + " </span>\n  <br> <span class=\"paperVenue\"> " + json.venue + " </span>\n</dd>";
  };

  d3.json("data/publications.json", function(pubs) {
    var pub;
    return $('#publicationsTable').append((function() {
      var i, len, results;
      results = [];
      for (i = 0, len = pubs.length; i < len; i++) {
        pub = pubs[i];
        results.push(publicationEntry(pub));
      }
      return results;
    })());
  });

}).call(this);
