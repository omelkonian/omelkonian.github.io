# Get a table entry for a specific publication
publicationEntry = (json) ->
  """
  <dt> #{json.venueAbr} </dt>
  <dd>
    <span class="paperTitle"> #{json.title} </span>
    <a href="data/publications/#{json.id}.pdf" target='_blank'> <i class='fa fa-book'></i> </a>
    <br> <span class="paperAuthors"> #{json.authors} </span>
    <br> <span class="paperVenue"> #{json.venue} </span>
  </dd>
  """

# Add all publications
d3.json "data/publications.json", (pubs) ->
  $('#publicationsTable').append(publicationEntry pub for pub in pubs)


