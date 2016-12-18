mkString = (element, obj) ->
  if obj.constructor.name == 'Array'
    for s in obj
      element.append 'span'
             .text s
      element.append 'br'
  else
    element.append 'span'
           .text obj


timeline = d3.select('#career ul.timeline')
d3.json "data/career.json", (data) ->
  for obj in data
    if 'milestone' of obj
      # Milestone
      timeline.append 'li'
              .attr class: 'tldate'
              .text obj.milestone
    else
      li = timeline.append 'li'
      li.attr(class: 'timeline-inverted') if '$inverted' of obj

      # Circular timestamp
      li.append 'div'
        .attr class: 'tl-circ'

      panel = li.append 'div'
      panel.attr class: 'timeline-panel'
      console.log(panel)

      # Title
      panel.append 'div'
           .attr class: 'tl-heading'
              .append 'h4'
              .text obj['$title']

      # Info list
      list = panel.append 'ul'
      list.attr class: 'tl-body'
      # Body
      for key, value of obj
        info = list.append 'li'
        if key == '$time'
          info.append 'i'
              .attr class: 'glyphicon glyphicon-time'
          info.append 'br'
          info.append 'span'
              .text obj['$time']
          info.append 'br'
        else if key == '$place'
          info.append 'i'
              .attr class: 'glyphicon glyphicon-map-marker'
          info.append 'br'
          mkString info, obj['$place']
          info.append 'br'
        else if key == '$venue'
          info.append 'i'
              .attr class: 'glyphicon glyphicon-home'
          info.append 'br'
          mkString info, obj['$venue']
          info.append 'br'
        else if key not in ['$title', '$inverted']
          info.append 'span'
              .attr class: 'emph'
              .text key
          info.append 'br'
          mkString info, obj[key]
          info.append 'br'
        else
          console.log 'skip'







