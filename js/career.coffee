mkString = (element, obj) ->
  if obj.constructor.name == 'Array'
    for s in obj
      append element, s
      element.append 'br'
  else
      append element, obj

append = (element, string) ->
  # console.log "Extracting " + string
  [newString, link] = extractLink string
  # console.log "Link: " + link
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
  for obj in data
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
      head = panel.append 'div'
      head.attr class: 'tl-heading'
      h = head.append 'h4'
      mkString h , obj['$title']

      # Info list
      list = panel.append 'ul'
      list.attr class: 'tl-body'
      # Body
      for key, value of obj
        if key in ['$title', '$inverted', '$slides']
          continue
        info = list.append 'li'
        if key == '$time'
          info.append 'i'
              .attr class: 'glyphicon glyphicon-time'
          info.append 'br'
          info.append 'span'
              .text obj['$time']
        else if key == '$place'
          info.append 'i'
              .attr class: 'glyphicon glyphicon-map-marker'
          info.append 'br'
          mkString info, obj['$place']
        else if key == '$venue'
          info.append 'i'
              .attr class: 'glyphicon glyphicon-home'
          info.append 'br'
          mkString info, obj['$venue']
        else if key == '$video'
          info.append 'video'
              .text  'Your browser does not support the <video> tag.'
              .attr 'src', obj['$video']
              .attr 'controls', ""
        else if key == '$youtube'
          info.append 'iframe'
              .attr 'src', obj['$youtube']
              .attr 'allowfullscreen', ""
              .attr 'frameborder', "0"
              .attr 'allow', "autoplay; encrypted-media; picture-in-picture; web-share"
        else
          info.append 'span'
              .attr class: 'emph'
              .text key
          info.append 'br'
          mkString info, obj[key]
          if obj['$slides']? and key == 'Title'
            aref = info.append 'a'
            aref.attr href: "#{obj.$slides}"
            aref.attr target: '_blank'
            aref.append 'i'
                .attr class: 'fa fa-book'
        info.append 'br'