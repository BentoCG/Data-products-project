library(shiny)



shinyServer( function(input, output){
    
   t = reactive({x = as.character(predict(modFit, createRow(c(input$LongestShell, input$Diameter, 
                                               input$Height, input$WholeWeight, input$Rings))))
                                                 
    
   
   
   if( x == "M"){
       z = "it's a boy!"}
   else if( x == "F"){
       z = "it's a girl!"}
   else{
       z = "it is still an imature."}
   })
   output$gender = renderText({t()})
})    
