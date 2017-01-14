// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require cable
//= require semantic-ui
//= require_tree .


jQuery(document).on('turbolinks:load', function() {

  $('#historybutton').click(function(event){
    $('.ui.right.sidebar').sidebar('toggle');
  });

  $('.search').search({
        type: 'category',
        minCharacters: 2,
        apiSettings: {
          onResponse: function(chatterResponse) {
            var
              response = {
                results: {}
              };
            //translate response
            $.each(chatterResponse, function(resultIndex, item){
              $.each(item, function(index,item){
                if(index >= 7){
                  return false;
                }
                //create new category
                if(response.results[resultIndex] === undefined){
                  response.results[resultIndex] = {
                    name: resultIndex.toUpperCase(),
                    results: []
                  };
                }
                //add result to category
                response.results[resultIndex].results.push({
                  title: item.name,
                  description: item.desc,
                });
              });
            });
            return response;
          },
          url: window.location.origin + '/autocomplete.json?query={query}'
        },
        debug: true,
        verbose: true
      });


  $(".start-conversation").click(function(){
    console.log(this);
  })

})
