
$(document).on('turbolinks:load', function(){
  var movies = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '/accounts/autocomplete?query=%QUERY',
      wildcard: '%QUERY'
    }
  });
  $('#movies_search').typeahead(null, {
    source: movies
  });
})