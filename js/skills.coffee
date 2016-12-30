removeXLabel = (chart) ->
  chart.svg()
       .append('text')
       .attr('class', 'x-axis-label')
       .attr('text-anchor', 'middle')
       .text('')

generateChart = (section, skill) ->
  d3.csv "data/#{section}/#{skill}.csv", (data) ->
    ndx = crossfilter(data)
    name = ndx.dimension((d) -> d.Name)
    grades = name.group()
                 .reduceSum((d) -> d.Grade)

    chart = dc
      .rowChart("##{skill}")
      # Size
      .width(500)
      .height((data.length+1) * 50)
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
    # $("##{skill} rect").attr 'height', 40
    chart.render()
    removeXLabel(chart)

generateChart("skills", skill) for skill in ['languages', 'frameworks', 'typesetting', 'webdev']
generateChart("grades", grade) for grade in ['year-1', 'year-2', 'year-3', 'year-4', 'year-5', 'year-6']
