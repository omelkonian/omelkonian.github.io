// Generated by CoffeeScript 1.12.1
(function() {
  var generateBubble, i, interest, len, ref;

  generateBubble = function(interest) {};

  generateBubble = function(interest) {
    var diameter, format, g, pack, svg;
    svg = d3.select("svg#" + interest);
    diameter = +svg.attr("width");
    g = svg.append("g").attr("transform", "translate(2,2)");
    format = d3.format(",d");
    pack = d3.pack().size([diameter - 4, diameter - 4]);
    return d3.json("data/interests/" + interest + ".json", function(root) {
      var node;
      root = d3.hierarchy(root).sum(function(d) {
        return d.size;
      }).sort(function(a, b) {
        return b.value - a.value;
      });
      node = g.selectAll(".node").data(pack(root).descendants()).enter().append("g").attr("class", function(d) {
        if (d.children) {
          return "node";
        } else {
          return "leaf node";
        }
      }).attr("transform", function(d) {
        return "translate(" + d.x + "," + d.y + ")";
      });
      node.append("title").text(function(d) {
        return d.data.name + "\n" + format(d.value);
      });
      node.append("circle").attr("r", function(d) {
        return d.r;
      });
      return node.filter(function(d) {
        return !d.children;
      }).append("text").attr("dy", "0.3em").text(function(d) {
        return d.data.name.substring(0, d.r / 3);
      });
    });
  };

  ref = ['theory', 'pl', 'ai', 'parallel'];
  for (i = 0, len = ref.length; i < len; i++) {
    interest = ref[i];
    generateBubble(interest);
  }

}).call(this);
