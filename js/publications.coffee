addPublication = (paper) ->
  d3.json "data/publications/#{paper}.json", (json) ->
    $('#publicationsTable').append(
      """
      <dt> #{json.venueAbr} </dt>
      <dd>
        <span class="paperTitle"> #{json.title} </span>
        <a href="data/publications/#{paper}.pdf" target='_blank'> <i class='fa fa-book'></i> </a>
        <br> <span class="paperAuthors"> #{json.authors} </span>
        <br> <span class="paperVenue"> #{json.venue} </span>
      </dd>
      """
    )

addPublication(pub) for pub in ["formal-bitml", "formal-utxo", "music-grammars", "pattrans", "formalz", "rhea", "d3"]
