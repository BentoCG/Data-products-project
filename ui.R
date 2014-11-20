shinyUI(
    pageWithSidebar(
       headerPanel("Find out the sex of your abalone!"),
       sidebarPanel(
       sliderInput('LongestShell', 'Longest shell (mm)', mean(abalone$LongestShell), min = min(abalone$LongestShell),
                    max = max(abalone$LongestShell), step = 0.01),
       sliderInput('Diameter','Diameter (mm)',  mean(abalone$Diameter), min = min(abalone$Diameter), max = 
                    max(abalone$Diameter), step = 0.01),
       sliderInput('Height', 'Height (mm)', mean(abalone$Height), min = min(abalone$Height), 
                    max = max(abalone$Height), step = 0.01),
       sliderInput('WholeWeight', 'Whole weight(grams)', mean(abalone$WholeWeight), min = min(abalone$WholeWeight), 
                    max = max(abalone$WholeWeight), step = 0.01),
       sliderInput('Rings', 'Number of age rings', 10, min = 1, max = 29, step = 1),
       helpText("Note: Abalone infants cannot be sexed, thus there will be males, females and infants.
                The sex is predicted using a boosting method.Predictions are barely superior
                than guessing at random (~55% accuracy, sd = 0.015)."),
       actionButton("goButton", "You don't really need to press this")
    ),
    
    mainPanel(
        img(src="abalone_measure.jpg", height = 400, width = 400),
        h3('Congratulations,'),
        h3(textOutput("gender"))
    )
))
