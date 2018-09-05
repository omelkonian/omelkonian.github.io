handleCollapse = (ident) ->
  $('#' + ident + 'Button').click ->
    if $(this).hasClass('fa-angle-down')
      $(this).removeClass('fa-angle-down')
      $(this).addClass('fa-angle-up')
      $('#' + ident + 'Collapse').collapse('show')
    else
      $(this).removeClass('fa-angle-up')
      $(this).addClass('fa-angle-down')
      $('#' + ident + 'Collapse').collapse('hide')

handleCollapse(ident) for ident in ['grades', 'grades2', 'skills']
