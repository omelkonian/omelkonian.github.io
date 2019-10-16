# Get a table entry for a specific report
reportEntry = (json) ->
  """
  <dt> #{json.year} </dt>
  <dd>
    <span class="paperTitle"> #{json.title} </span>
    <a href="data/reports/#{json.id}.pdf" target='_blank'> <i class='fa fa-book'></i> </a>
    <br> <span class="paperAuthors"> #{json.authors} </span>
  </dd>
  """

# Add all reports
d3.json "data/reports.json", (reps) ->
  $('#reportsTable').append(reportEntry rep for rep in reps)


