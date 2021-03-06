// Generated by CoffeeScript 1.9.3
(function() {
  var reportEntry;

  reportEntry = function(json) {
    return "<dt> " + json.year + " </dt>\n<dd>\n  <span class=\"paperTitle\"> " + json.title + " </span>\n  <a href=\"data/reports/" + json.id + ".pdf\" target='_blank'> <i class='fa fa-book'></i> </a>\n  <br> <span class=\"paperAuthors\"> " + json.authors + " </span>\n</dd>";
  };

  d3.json("data/reports.json", function(reps) {
    var rep;
    return $('#reportsTable').append((function() {
      var i, len, results;
      results = [];
      for (i = 0, len = reps.length; i < len; i++) {
        rep = reps[i];
        results.push(reportEntry(rep));
      }
      return results;
    })());
  });

}).call(this);
