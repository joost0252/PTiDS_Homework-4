runSimulation <- function() {
  appDir <- system.file("shiny-examples", "area", package = "Bacteriagroupf")
  if (appDir == "") {
    stop(
      "Could not find example directory. Try re-installing Bacteriagroupf.",
      call. = FALSE
    )
  }
  shiny::runApp(appDir, display.mode = "normal")
}
