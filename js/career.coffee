mkString = (element, obj) ->
  if obj.constructor.name == 'Array'
    for s in obj
      append element, s
      element.append 'br'
  else
      append element, obj

append = (element, string) ->
  console.log "Extracting " + string
  [newString, link] = extractLink string
  console.log "Link: " + link
  element.append 'span'
         .text newString
  if link?
    element.append 'sup'
           .append 'a'
           .attr 'href', link
           .attr 'target', '_blank'
              .append 'i'
              .attr class: 'fas fa-external-link-alt'
              .style 'color', '#779900'

extractLink = (string) ->
  pattern = /(.*)@(.+)@/
  matches = string.match(pattern)
  if matches
    matches[1..2]
  else
    [string, null]

timeline = d3.select('#career ul.timeline')
d3.json "data/career.json", (data) ->
  careerData = data.reverse()
  for obj in careerData
    if obj.milestone?
      # Milestone
      timeline.append 'li'
              .attr class: 'tldate'
              .text obj.milestone
    else
      li = timeline.append 'li'
      li.attr class: 'timeline-inverted' if '$inverted' of obj

      # Circular timestamp
      li.append 'div'
        .attr class: 'tl-circ'

      panel = li.append 'div'
      if '$inverted' of obj
        panel.attr class: 'timeline-panel wow fadeInRight animated'
      else
        panel.attr class: 'timeline-panel wow fadeInLeft animated'
      panel.attr 'data-wow-delay', '2s'

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
        if key in ['$title', '$inverted']
          continue
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
        else if key == '$video'
          info.append 'video'
              .text  'Your browser does not support the <video> tag.'
              .attr 'src', obj['$video']
              .attr 'controls', ""
          info.append 'br'
        else if key not in ['$title', '$inverted']
          info.append 'span'
              .attr class: 'emph'
              .text key
          info.append 'br'
          mkString info, obj[key]
          info.append 'br'
