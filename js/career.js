// Generated by CoffeeScript 1.9.3
(function() {
  var append, extractLink, mkString, timeline;

  mkString = function(element, obj) {
    var i, len, results, s;
    if (obj.constructor.name === 'Array') {
      results = [];
      for (i = 0, len = obj.length; i < len; i++) {
        s = obj[i];
        append(element, s);
        results.push(element.append('br'));
      }
      return results;
    } else {
      return append(element, obj);
    }
  };

  append = function(element, string) {
    var link, newString, ref;
    ref = extractLink(string), newString = ref[0], link = ref[1];
    element.append('span').text(newString);
    if (link != null) {
      return element.append('sup').append('a').attr('href', link).attr('target', '_blank').append('i').attr({
        "class": 'fas fa-external-link-alt'
      }).style('color', '#779900');
    }
  };

  extractLink = function(string) {
    var matches, pattern;
    pattern = /(.*)@(.+)@/;
    matches = string.match(pattern);
    if (matches) {
      return matches.slice(1, 3);
    } else {
      return [string, null];
    }
  };

  timeline = d3.select('#career ul.timeline');

  d3.json("data/career.json", function(data) {
    var aref, h, head, i, info, key, len, li, list, obj, panel, results, value;
    results = [];
    for (i = 0, len = data.length; i < len; i++) {
      obj = data[i];
      if (obj.milestone != null) {
        results.push(timeline.append('li').attr({
          "class": 'tldate'
        }).text(obj.milestone));
      } else {
        li = timeline.append('li');
        if ('$inverted' in obj) {
          li.attr({
            "class": 'timeline-inverted'
          });
        }
        li.append('div').attr({
          "class": 'tl-circ'
        });
        panel = li.append('div');
        if ('$inverted' in obj) {
          panel.attr({
            "class": 'timeline-panel wow fadeInRight animated'
          });
        } else {
          panel.attr({
            "class": 'timeline-panel wow fadeInLeft animated'
          });
        }
        panel.attr('data-wow-delay', '2s');
        head = panel.append('div');
        head.attr({
          "class": 'tl-heading'
        });
        h = head.append('h4');
        mkString(h, obj['$title']);
        list = panel.append('ul');
        list.attr({
          "class": 'tl-body'
        });
        results.push((function() {
          var results1;
          results1 = [];
          for (key in obj) {
            value = obj[key];
            if (key === '$title' || key === '$inverted' || key === '$slides') {
              continue;
            }
            info = list.append('li');
            if (key === '$time') {
              info.append('i').attr({
                "class": 'glyphicon glyphicon-time'
              });
              info.append('br');
              info.append('span').text(obj['$time']);
            } else if (key === '$place') {
              info.append('i').attr({
                "class": 'glyphicon glyphicon-map-marker'
              });
              info.append('br');
              mkString(info, obj['$place']);
            } else if (key === '$venue') {
              info.append('i').attr({
                "class": 'glyphicon glyphicon-home'
              });
              info.append('br');
              mkString(info, obj['$venue']);
            } else if (key === '$video') {
              info.append('video').text('Your browser does not support the <video> tag.').attr('src', obj['$video']).attr('controls', "");
            } else if (key === '$youtube') {
              info.append('iframe').attr('src', obj['$youtube']).attr('allowfullscreen', "").attr('frameborder', "0").attr('allow', "autoplay; encrypted-media; picture-in-picture; web-share");
            } else {
              info.append('span').attr({
                "class": 'emph'
              }).text(key);
              info.append('br');
              mkString(info, obj[key]);
              if ((obj['$slides'] != null) && key === 'Title') {
                aref = info.append('a');
                aref.attr({
                  href: "" + obj.$slides
                });
                aref.attr({
                  target: '_blank'
                });
                aref.append('i').attr({
                  "class": 'fa fa-book'
                });
              }
            }
            results1.push(info.append('br'));
          }
          return results1;
        })());
      }
    }
    return results;
  });

}).call(this);
