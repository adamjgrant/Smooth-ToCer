window.smoothtocer = ($toc_container, $content) ->
  k$ = new Object()
  k$.$$ = (el) -> document.querySelectorAll el
  k$.$ = (el) -> k$.$$(el)[0]
  k$.slugify = (str) ->
    `str.toLowerCase().replace(/ /g,'-').replace(/[^\w-]+/g,'')`

  if $toc_container
    $toc = document.createElement 'ul'
    $link = document.createElement('li')
    $link.innerHTML = '<a></a>'

    # Assuming proper html, start with h1.
    $headingLevel = 1

    # The node we're currently appending to. Always a ul.
    $targetNode = $toc

    for heading in $content.querySelectorAll('h1, h2, h3, h4, h5, h6')
      # Ignore headings that declare themselves as exempt from the TOC
      if not heading.classList.contains 'toc-exempt'
        # For extra unique names.
        # heading.id = "#{k$.slugify heading.innerHTML}-#{_k}"
        
        heading.id = k$.slugify heading.innerHTML

        # If this is a lower level.
        $thisHeadingLevel = parseInt(heading.tagName.substr(1, 2))

        if $thisHeadingLevel > $headingLevel
          # Append a new submenu and make that the targetNode.
          $newSubmenu = document.createElement 'ul'
          $targetNode.children[$targetNode.children.length - 1].appendChild $newSubmenu 
          $targetNode = $newSubmenu
          $headingLevel = $thisHeadingLevel

        # If this is a higher level
        if $thisHeadingLevel < $headingLevel
          $stepsUp = $headingLevel - $thisHeadingLevel

          while $stepsUp > 0
            $targetNode = $targetNode.parentNode.parentNode
            $stepsUp--

          $headingLevel = $thisHeadingLevel

        # Make a new li and append it to the target ul node.
        $menuItem = $link.cloneNode true
        $menuItem.querySelector('a').href = "##{heading.id}"
        $menuItem.querySelector('a').innerHTML = heading.innerHTML
        $targetNode.appendChild $menuItem

    $toc_container.appendChild $toc

  else
    console.error 'Did not find a Table of Contents container. Found: ' + $toc_container
