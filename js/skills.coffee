removeXLabel = (chart) ->
  chart.svg()
       .append('text')
       .attr('class', 'x-axis-label')
       .attr('text-anchor', 'middle')
       .text('')

generateChart = (section, skill, renderTitle) ->
  d3.csv "data/#{section}/#{skill}.csv", (data) ->
    ndx = crossfilter(data)
    name = ndx.dimension((d) -> d.Name)
    grades = name.group()
                 .reduceSum((d) -> d.Grade)

    chart = dc
      .rowChart("##{skill}")
      # Size
      .width(500)
      .height((data.length+1) * 40)
      # Axis
      .x(d3.scale.ordinal())
      .elasticX(true)
      # Titles
      .title(renderTitle || (p) -> p.value)
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

renderSkillTitle = (p) ->
  switch (p.value)
    when 1 then 'Beginner'
    when 2 then 'Beginner'
    when 3 then 'Beginner'
    when 4 then 'Beginner'
    when 5 then 'Intermediate'
    when 6 then 'Intermediate'
    when 7 then 'Intermediate'
    when 8 then 'Advanced'
    when 9 then 'Advanced'
    when 10 then 'Advanced'
    else ''

generateChart("skills", skill, renderSkillTitle) for skill in [ 'languages'
                                                              , 'frameworks'
                                                              , 'typesetting'
                                                              , 'webdev'
                                                              , 'build-deployment']
generateChart("grades", grade) for grade in [ 'year-1'
                                            , 'year-2'
                                            , 'year-3'
                                            , 'year-4'
                                            , 'year-5'
                                            , 'year-6'
                                            , 'msc-1' ]
