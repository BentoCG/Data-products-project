library(shiny)



shinyServer( function(input, output){
    
   t = reactive({x = as.character(predict(modFit, createRow(c(input$LongestShell, input$Diameter, 
                                               input$Height, input$WholeWeight, input$Rings))))
                                                 
    
   
   
   if( x == "M"){
       z = "it's probably a boy!"}
   else if( x == "F"){
       z = "it's probably a girl!"}
   else{
       z = "it's probably still an imature."}
   })
   output$gender = renderText({t()})
})    


