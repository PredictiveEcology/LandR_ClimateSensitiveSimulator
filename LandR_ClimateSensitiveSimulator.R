## Parent module: it has no events, parameters, inputs or outputs of its own.
## Listing it in `setupProject(modules = )` fetches and runs its child modules.
defineModule(sim, list(
  name = "LandR_ClimateSensitiveSimulator",
  description = paste("A climate-sensitive forest landscape simulator: LandR Biomass vegetation dynamics",
                      "with the fireSense fire models, driven by annual climate. Every child module uses",
                      "publicly available data. Listing this parent in `setupProject(modules = )`",
                      "fetches and runs all of them."),
  keywords = c("LandR", "fireSense", "climate", "forest landscape simulation", "parent module"),
  authors = c(
    person("Eliot", "McIntire", email = "eliot.mcintire@nrcan-rncan.gc.ca", role = c("aut", "cre"))
  ),
  childModules = c(
    "PredictiveEcology/canClimateData@modsForFireSense",
    "PredictiveEcology/climateYear@modsForFireSense",
    "PredictiveEcology/fireSense@development",
    "PredictiveEcology/localEcozones@development",
    "PredictiveEcology/Biomass_borealDataPrep@development",
    "PredictiveEcology/Biomass_regeneration@development",
    "PredictiveEcology/Biomass_core@modsForFireSense"
  ),
  version = list(LandR_ClimateSensitiveSimulator = "0.0.0.9000"),
  timeframe = as.POSIXlt(c(NA, NA)),
  timeunit = "year",
  citation = list("citation.bib"),
  documentation = list("NEWS.md", "README.md")
  ## a parent module has no reqdPkgs, parameters, inputObjects, nor outputObjects
))

## a parent module has no events.
