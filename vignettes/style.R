options(rstudio.markdownToHTML =
  function(inputFile, outputFile) {
    require(markdown)
    markdownToHTML(inputFile, outputFile, stylesheet=file.path(getwd(), "css/style.css"))
  }
)