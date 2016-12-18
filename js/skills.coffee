removeXLabel = (chart) ->
  chart.svg()
       .append('text')
       .attr('class', 'x-axis-label')
       .attr('text-anchor', 'middle')
       .text('')

generateChart = (skill) ->
  d3.csv "data/#{skill}.csv", (data) ->
    ndx = crossfilter(data)
    name = ndx.dimension((d) -> d.Name)
    grades = name.group()
                 .reduceSum((d) -> d.Grade)

    chart = dc
      .rowChart("##{skill}")
      # Size
      .width(500)
      .height(40 * ndx.size())
      # Order
      # Axis
      .x(d3.scale.ordinal())
      .elasticX(true)
      # Appearance
      .transitionDuration(2000)
      .colorAccessor((d) -> d.value * .1)
      .colors(["#ff0000"
             , "#ff4400"
             , "#ff8800"
             , "#ffaa00"
             , "#eeff00"
             , "#aaff00"
             , "#88ff22"
             , "#44ff22"
             , "#00ff22"])
      # Data
      .dimension(name)
      .group(grades)

    chart.xAxis().tickValues([])
    chart.render()
    removeXLabel(chart)

generateChart(skill) for skill in ['languages', 'frameworks', 'typesetting', 'webdev']
