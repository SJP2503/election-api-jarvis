library(plumber)
library(jsonlite)

# Load results from local RDS file
results <- readRDS("gma_results.rds")  # Make sure this file exists in same folder

# Create API
pr <- pr()
pr$handle("GET", "/results", function(req, res, city, race = "mayor_vice") {
  key <- tolower(city)
  if (!key %in% names(results)) {
    res$status <- 404
    return(list(error = paste("No results for city:", city)))
  }

  list(
    city = city,
    race = race,
    content = substr(results[[key]], 1, 2000)
  )
})

