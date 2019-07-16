@window.next = ->
  $('#carousel').Carousel3d('next')
@window.prev = ->
  $('#carousel').Carousel3d('prev')

# Get a carousel entry for a specific project
projectEntry = (json) ->
  # Left icons
  github_link = """
    <a href="#{json.github}" target='_blank'>
      <i class='fa fa-github'></i>
    </a>
  """ if json.github?
  bitbucket_link = """
      <a href="#{json.bitbucket}" target='_blank'>
        <i class='fa fa-bitbucket'></i>
      </a>
  """ if json.bitbucket?

  # Right icons
  doc_link = """
    <a href="#{json.documentation}" target='_blank'>
      <i class='fa fa-book'></i>
    </a>
  """ if json.documentation?
  soundcloud_link = """
    <a href="#{json.soundcloud}" target='_blank'>
      <i class='fa fa-soundcloud'></i>
    </a>
  """ if json.soundcloud?

  """
  <div class='item'>
    <div class='col-xs-6 image'>
      <img src='images/projects/#{json.image}'>
    </div>
    <div class='col-xs-6 info'>
      #{if github_link? then github_link else ""}
      #{if bitbucket_link? then bitbucket_link else ""}
      #{if doc_link? then doc_link else ""}
      #{if soundcloud_link? then soundcloud_link else ""}
      <h4>#{json.name}</h4>
      <h5>#{json.domain}</h5>
      <p>#{json.description}</p>
      <h6>#{json.keywords.join(' ')}</h6>
      #{if json.wip? then "<h7>IN PROGRESS</h7>" else ""}
    </div>
  </div>
  """

# Add all projects
d3.json "data/projects.json", (projects) ->
  $('[data-carousel-3d]').append(projectEntry project for project in projects)
