// Generated by CoffeeScript 1.9.3
(function() {
  var projectEntry;

  projectEntry = function(json) {
    var bitbucket_link, doc_link, github_link, soundcloud_link;
    if (json.github != null) {
      github_link = "<a href=\"" + json.github + "\" target='_blank'>\n  <i class='fa fa-github'></i>\n</a>";
    }
    if (json.bitbucket != null) {
      bitbucket_link = "<a href=\"" + json.bitbucket + "\" target='_blank'>\n  <i class='fa fa-bitbucket'></i>\n</a>";
    }
    if (json.documentation != null) {
      doc_link = "<a href=\"" + json.documentation + "\" target='_blank'>\n  <i class='fa fa-book'></i>\n</a>";
    }
    if (json.soundcloud != null) {
      soundcloud_link = "<a href=\"" + json.soundcloud + "\" target='_blank'>\n  <i class='fa fa-soundcloud'></i>\n</a>";
    }
    return "<li class='item' class='slide'>\n  <div class='col-xs-6 image'>\n    <img src='images/projects/" + json.image + "'>\n  </div>\n  <div class='col-xs-6 info'>\n    " + (github_link != null ? github_link : "") + "\n    " + (bitbucket_link != null ? bitbucket_link : "") + "\n    " + (doc_link != null ? doc_link : "") + "\n    " + (soundcloud_link != null ? soundcloud_link : "") + "\n    <h4>" + json.name + "</h4>\n    <h5>" + json.domain + "</h5>\n    <p>" + json.description + "</p>\n    <h6>" + (json.keywords.join(' ')) + "</h6>\n    " + (json.wip != null ? "<h7>IN PROGRESS</h7>" : "") + "\n  </div>\n</li>";
  };

  d3.json("data/projects.json", function(projects) {
    var project;
    $('#carousel ul').append((function() {
      var i, len, results;
      results = [];
      for (i = 0, len = projects.length; i < len; i++) {
        project = projects[i];
        results.push(projectEntry(project));
      }
      return results;
    })());
    return $('#carousel').flipster({
      style: 'carousel',
      start: 0,
      spacing: -0.4,
      buttons: true,
      loop: true,
      scrollwheel: false
    });
  });

}).call(this);
