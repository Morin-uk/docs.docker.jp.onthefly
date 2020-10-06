%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker documentation search results
keywords: Search, Docker, documentation, manual, guide, reference, api
noratings: true
notoc: true
notags: true
title: "Docs search"
skip_read_time: true
---
@y
---
description: Docker documentation search results
keywords: Search, Docker, documentation, manual, guide, reference, api
noratings: true
notoc: true
notags: true
title: "Docs 検索"
skip_read_time: true
---
@z

@x
<style type='text/css'>
#my-cse1 { all: initial !important; all: default !important; }
#my-cse1 table, #my-cse1 table tr, #my-cse1 table tr th, #my-cse1 table tr td, .gs-bidi-start-align { border: 0px !important; padding: 0px !important; line-height: initial !important; margin: 0px !important; }
.gs-snippet { margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important; color: #999}
.gs-webResult .gs-result .gs-no-results-result { padding: 10px !important; }
.gs-per-result-labels { display: none !important; }
.gsc-url-top, .gsc-thumbnail-inside, .gs-spelling { padding: 0px !important; }
.gcsc-branding { padding-right: 0px !important; }
.gsc-tabHeader.gsc-tabhActive, .gsc-tabsArea { border-color: #CCC !important; }
.gcs-input, #gsc-i-id1 { padding: 5px 5px 5px 5px !important; }
#gscb_a, .gscb_a { padding: 3px 0px 0px 0px !important;}
.gsc-control-cse, .gsc-control-cse-en { padding: 0px !important; }
.gsc-result-info { padding-bottom: 0px !important; }
.gsc-adBlock { display: none; }
</style>
@y
<style type='text/css'>
#my-cse1 { all: initial !important; all: default !important; }
#my-cse1 table, #my-cse1 table tr, #my-cse1 table tr th, #my-cse1 table tr td, .gs-bidi-start-align { border: 0px !important; padding: 0px !important; line-height: initial !important; margin: 0px !important; }
.gs-snippet { margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important; color: #999}
.gs-webResult .gs-result .gs-no-results-result { padding: 10px !important; }
.gs-per-result-labels { display: none !important; }
.gsc-url-top, .gsc-thumbnail-inside, .gs-spelling { padding: 0px !important; }
.gcsc-branding { padding-right: 0px !important; }
.gsc-tabHeader.gsc-tabhActive, .gsc-tabsArea { border-color: #CCC !important; }
.gcs-input, #gsc-i-id1 { padding: 5px 5px 5px 5px !important; }
#gscb_a, .gscb_a { padding: 3px 0px 0px 0px !important;}
.gsc-control-cse, .gsc-control-cse-en { padding: 0px !important; }
.gsc-result-info { padding-bottom: 0px !important; }
.gsc-adBlock { display: none; }
</style>
@z

@x
<div id="glossaryMatch"></div>
@y
<div id="glossaryMatch"></div>
@z

@x
<div id="my-cse1">
<script>
  (function() {
    var cx = '005610573923180467403:iwlnuvjqpv4';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
</script>
@y
<div id="my-cse1">
<script>
  (function() {
    var cx = 'dcbb7d4804f37ddab';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
</script>
@z

@x
<gcse:searchresults-only></gcse:searchresults-only>
</div>
@y
<gcse:searchresults-only></gcse:searchresults-only>
</div>
@z

@x
<script defer>
setTimeout(function(){
  $(document).ready(function() {
    let searchTerm = decodeURI(queryString().q);
    if(searchTerm != 'undefined' && searchTerm != "") {
      $("#st-search-input").val(searchTerm);
      $("#st-search-input").focus();
      // Update heading with term user searched for
      let currHeading = $("h1").text();
      $("h1").text(currHeading + " results for: " + searchTerm);
    }
  });
}, 1);
</script>
@y
<script defer>
setTimeout(function(){
  $(document).ready(function() {
    let searchTerm = decodeURI(queryString().q);
    if(searchTerm != 'undefined' && searchTerm != "") {
      $("#st-search-input").val(searchTerm);
      $("#st-search-input").focus();
      // Update heading with term user searched for
      let currHeading = $("h1").text();
      $("h1").text(currHeading + " 検索結果: " + searchTerm);
    }
  });
}, 1);
</script>
@z
