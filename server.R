library(shiny)
library(rmarkdown)


shinyServer(function(input, output) {
  
  
  output$downloadReport <- downloadHandler(
    
    filename = "claim_report.pdf",
    
    content = function(file) {
      
      src <- normalizePath('claim.Rmd')
      
      # temporarily switch to the temp dir, in case you do not have write
      # permission to the current working directory
      
      owd <- setwd(tempdir())
      on.exit(setwd(owd))
      file.copy(src, 'claim.Rmd', overwrite = TRUE)
      
      #modelStats <- testedModels() %>% arrange(-Accuracy)
      
      
      out <- render('claim.Rmd', 
                    pdf_document(),
                    
      params = list(companyname = input$companyname,
                    address = input$address,
                    postcode = input$postcode,
                    city = input$city,
                    country = input$country,
                    bookingref = input$bookingref,
                    flightnr = input$flightnr))
      
      file.rename(out, file)
    }
    
  ) 
  

})