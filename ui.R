library(shiny)
library(ggplot2)


shinyUI(fluidPage(
  
  theme = "w3.css",
  
  titlePanel("Flight Compensation"),

         sidebarLayout(
           
           sidebarPanel(
             
             helpText("This applications is a tool to analyse all the securities
                      currently included in the S&P 500 index. In addition to
                      the share price and volume, Bollinger Bands and Moving Averages
                      are calculated."),
           
             h3("Flight Company Information"),
             textInput("companyname", "Name", ""),
             textInput("address", "Address", ""),
             textInput("postcode", "Postal Code", ""),
             textInput("city", "City", ""),
             textInput("country", "Country", ""),
             
             h3("Booking Information"),
             textInput("bookingref", "Booking Refence", ""),
             textInput("flightnr", "Flight Number", ""),
             
             downloadButton('downloadReport')
             
             ),
           
           mainPanel(
             
             plotOutput("plot1", height = "700px")
          
              )
            )
          )
        )
