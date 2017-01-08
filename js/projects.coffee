@window.next = ->
  $('#carousel').Carousel3d('next')
@window.prev = ->
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
      <div class='col-xs-6 image'>
        <img src='images/projects/#{project}.#{json.extension}'>
      </div>
      <div class='col-xs-6 info'>
        #{if github_link? then github_link else ""}
        #{if bitbucket_link? then bitbucket_link else ""}
        #{if doc_link? then doc_link else ""}
        <h4>#{json.name}</h4>
        <h5>#{json.domain}</h5>
        <p>#{json.description}</p>
        <h6>#{json.keywords.join(' ')}</h6>
        #{if json.wip? then "<h7>IN PROGRESS</h7>" else ""}
      </div>
    </div>
    """

addProject(project) for project in [
  'rhea'
, 'mws'
, 'racketlog'
, 'lambda'
, 'minijava'
, 'portfolio'
, 'snap'
, 'ocr'
, 'interstellar'
, 'functional-ga'
, 'convolution'
, 'compgeo'
, 'impero'
, 'ai'
, 'prolog'
, 'airplane'
, 'nintendo-crypto'
, 'music'
, 'syspro'
, 'household'
]
