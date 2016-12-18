generateBubble = (interest) ->
generateBubble = (interest) ->
  svg = d3.select("svg##{interest}")
  diameter = +svg.attr("width")
  g = svg.append("g")
         .attr("transform", "translate(2,2)")
  format = d3.format(",d")

  pack = d3.pack()
           .size([diameter - 4, diameter - 4])

  d3.json "data/interests/#{interest}.json", (root) ->
    root = d3.hierarchy(root)
             .sum((d) -> d.size)
             .sort((a, b) -> b.value - a.value)

    node = g.selectAll(".node")
            .data(pack(root).descendants())
            .enter().append("g")
            .attr("class", (d) -> if d.children then "node" else "leaf node")
            .attr("transform", (d) -> "translate(" + d.x + "," + d.y + ")")

    node.append("title")
        .text((d) -> d.data.name + "\n" + format(d.value))

    node.append("circle")
        .attr("r", (d) -> d.r)

    node.filter((d) -> !d.children)
        .append("text")
        .attr("dy", "0.3em")
        .text((d) -> d.data.name.substring(0, d.r / 3))

generateBubble(interest) for interest in ['theory', 'pl', 'ai', 'parallel']
