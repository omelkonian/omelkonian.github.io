# Get a table entry for a specific publication
publicationEntry = (json) ->
  """
  <dt> #{json.venueAbr} </dt>
  <dd>
    <span class="paperTitle"> #{json.title} </span>
    <a href="data/publications/#{paper}.pdf" target='_blank'> <i class='fa fa-book'></i> </a>
    <br> <span class="paperAuthors"> #{json.authors} </span>
    <br> <span class="paperVenue"> #{json.venue} </span>
  </dd>
  """

# Add all publications (in chronological order)
Promise.all(
  d3.json "data/publications/#{paper}.json" for paper in [
    "formal-bitml"
  , "formal-utxo"
  , "music-grammars"
  , "pattrans"
  , "formalz"
  , "rhea"
  , "d3"
  ]
).then (jsons) ->
  $('#publicationsTable').append(publicationEntry json for json in jsons)

