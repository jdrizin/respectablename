title: timelapse
description: some information about time-lapse photography
author: Josh Drizin
date: 2013/07/26
---
<script type="text/javascript" src="/js/jquery-2.0.3.min.js" > </script>
<script type="text/javascript" src="/js/github-files.js" > </script>
<link rel="stylesheet" href="/js/hilight.css">
<script src="/js/highlight.pack.js"></script>

## Control script

Because the two Canon 350Ds I used identified to the computer identically, I had to work around this limitation using something I could configure. I ended up using ownername to identify the cameras.

<p><script>
jQuery(document).ready(function ($) {
  $.getGithubFile("jdrizin", "timelapse-utilities", "b9041eab964fa984c38f26dd435fdaf84cf22645", function(contents) {
    $("#camera").html(hljs.highlight("python", contents).value)
  })
})
</script></p>

<div class="code">
<pre id="camera"></pre>
</div>