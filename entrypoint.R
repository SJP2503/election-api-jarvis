library(plumber)
pr <- plumber::plumb("plumber_api_results.R")
pr$run(host = "0.0.0.0", port = as.numeric(Sys.getenv("PORT", 8000)))
