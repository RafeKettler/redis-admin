$('.expand').click (e) ->
  e.preventDefault()
  $(e.target).next('.to-expand').slideToggle()