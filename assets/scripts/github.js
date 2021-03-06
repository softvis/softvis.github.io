var github = (function() {
  function render(target, repos) {
    var i = 0, fragment = '', t = $(target)[0];

    for(i = 0; i < repos.length; i++) {
      fragment += '<h3 class="with-info"><a href="'+repos[i].html_url+'">'+repos[i].name+'</a></h3>' + 
                  '<p class="info">' + repos[i].language + ', updated ' + moment(repos[i].pushed_at).fromNow() +
                  '<p>'+(repos[i].description||'');
    }
    t.innerHTML = fragment;
  }
  return {
    showRepos: function(options) {
      $.ajax({
        url: "https://api.github.com/users/"+options.user+"/repos?callback=?", 
        dataType: 'jsonp',
        error: function (err) { $(options.target + ' p.loading').addClass('error').text("Error loading feed"); }, 
        success: function(data) {
          var repos = [];
          if (!data || !data.data) { 
            return; 
          }
          for (var i = 0; i < data.data.length; i++) {
            if (options.skip_forks && data.data[i].fork) { continue; }
            repos.push(data.data[i]);
          }
          repos.sort(function(a, b) {
            var aDate = new Date(a.pushed_at).valueOf(),
                bDate = new Date(b.pushed_at).valueOf();
            return bDate - aDate;
          });

          if (options.count) { 
            repos.splice(options.count); 
          }
          render(options.target, repos);
        }
      });
    }
  };
})();
