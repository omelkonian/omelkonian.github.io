@window.next = ->
  console.log('NEXT')
  $('#carousel').Carousel3d('next')
@window.prev = ->
  console.log('PREV')
  $('#carousel').Carousel3d('prev')

addProject = (project) ->
  d3.json "data/projects/#{project}.json", (json) ->
    github_link = """
      <a href="#{json.github}" target='_blank'>
        <i class='fa fa-github'></i>
      </a>
    """ if json.github?
    doc_link = """
      <a href="#{json.documentation}" target='_blank'>
        <i class='fa fa-book'></i>
      </a>
    """ if json.documentation?
    bitbucket_link = """
        <a href="#{json.bitbucket}" target='_blank'>
          <i class='fa fa-bitbucket'></i>
        </a>
    """ if json.bitbucket?

    $('[data-carousel-3d]').Carousel3d 'appendChild',
    """
    <div class='item'>
      <div class='col-md-6 image'>
        <img src='images/projects/#{project}.png'>
      </div>
      <div class='col-md-6 info'>
        #{if github_link? then github_link else ""}
        #{if bitbucket_link? then bitbucket_link else ""}
        #{if doc_link? then doc_link else ""}
        <h4>#{json.name}</h4>
        <h5>#{json.domain}</h5>
        <p>#{json.description}</p>
        <h6>#{json.keywords.join(' ')}</h6>
        #{if wip? then "<h7>IN PROGRESS</h7>" else ""}
      </div>
    </div>
    """

addProject(project) for project in [
  'impero', 'lambda', 'ai', 'music',
  'convolution', 'compgeo', 'interstellar',
  'minijava', 'ocr', 'snap', 'airplane',
  'prolog', 'syspro'
]
