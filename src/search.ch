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
#my-cse1 table, #my-cse1 table tr, #my-cse1 table tr th, #my-cse1 table tr td, .gs-bidi-start-align { border: 0 !important; padding: 0 !important; line-height: initial !important; margin: 0 !important; }
.gs-snippet { margin-top: 0 !important; margin-bottom: 0 !important; padding: 0 !important; color: #999}
.gs-webResult .gs-result .gs-no-results-result { padding: 10px !important; }
.gs-per-result-labels { display: none !important; }
.gsc-url-top, .gsc-thumbnail-inside, .gs-spelling { padding: 0 !important; }
.gcsc-branding { padding-right: 0 !important; }
.gsc-tabHeader.gsc-tabhActive, .gsc-tabsArea { border-color: #CCC !important; }
.gcs-input, #gsc-i-id1 { padding: 5px 5px 5px 5px !important; }
#gscb_a, .gscb_a { padding: 3px 0 0 0 !important;}
.gsc-control-cse, .gsc-control-cse-en { padding: 0 !important; }
.gsc-result-info { padding-bottom: 0 !important; }
.gsc-adBlock { display: none; }
</style>
@y
<style type='text/css'>
#my-cse1 { all: initial !important; all: default !important; }
#my-cse1 table, #my-cse1 table tr, #my-cse1 table tr th, #my-cse1 table tr td, .gs-bidi-start-align { border: 0 !important; padding: 0 !important; line-height: initial !important; margin: 0 !important; }
.gs-snippet { margin-top: 0 !important; margin-bottom: 0 !important; padding: 0 !important; color: #999}
.gs-webResult .gs-result .gs-no-results-result { padding: 10px !important; }
.gs-per-result-labels { display: none !important; }
.gsc-url-top, .gsc-thumbnail-inside, .gs-spelling { padding: 0 !important; }
.gcsc-branding { padding-right: 0 !important; }
.gsc-tabHeader.gsc-tabhActive, .gsc-tabsArea { border-color: #CCC !important; }
.gcs-input, #gsc-i-id1 { padding: 5px 5px 5px 5px !important; }
#gscb_a, .gscb_a { padding: 3px 0 0 0 !important;}
.gsc-control-cse, .gsc-control-cse-en { padding: 0 !important; }
.gsc-result-info { padding-bottom: 0 !important; }
.gsc-adBlock { display: none; }
</style>
@z

@x
<div id="my-cse1">
<script>
  (function() {
    const cx = '005610573923180467403:iwlnuvjqpv4';
    let gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
    let s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
</script>
@y
<div id="my-cse1">
<script>
  (function() {
    const cx = 'dcbb7d4804f37ddab';
    let gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
    let s = document.getElementsByTagName('script')[0];
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
  (function() {
    let query = new URLSearchParams(window.location.search);
    if (query.has("q")) {
      let h = document.querySelector("h1");
      if (h) {
         h.textContent += " results for: " + query.get("q");
      }
      let s = document.querySelector("#st-search-input");
      if (s && s instanceof HTMLInputElement) {
        s.value = query.get("q");
      }
    }
  })();
</script>
@y
<script defer>
  (function() {
    let query = new URLSearchParams(window.location.search);
    if (query.has("q")) {
      let h = document.querySelector("h1");
      if (h) {
         h.textContent += " 検索結果: " + query.get("q");
      }
      let s = document.querySelector("#st-search-input");
      if (s && s instanceof HTMLInputElement) {
        s.value = query.get("q");
      }
    }
  })();
</script>
@z
