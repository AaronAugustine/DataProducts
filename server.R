library(shiny)


# Define server logic required to summarize and view the selected
# dataset
shinyServer(function(input, output) {
  

  output$summary <- renderPrint({
    library(chron)
    dist<-26.2
    start<-times(input$time)
    time_string<-paste(input$hours,input$minutes,input$seconds,sep=":")
    total_time<-times(time_string)
    rate<-as.numeric(total_time/dist)
    clock_time<-start
    time<-times(0)
    cat(paste("Race Start Time", start),"\n") 
    cat(paste("Race End Time  ", start+total_time),"\n")
    cat(paste("Running Time   ", total_time),"\n")
    cat(paste("Pace           ", times(rate)),"\n")
    cat(paste("MPH            ",format(as.numeric(dist/total_time/24),
                                       digits = 5)),"\n")

    for (i in 1:26){
      clock_time<-clock_time+rate 
      time<-time+rate
      results<-paste("Mile",format(i,digits = 2),clock_time,time)
      cat(results,"\n")
    }
  })
})