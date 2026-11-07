# LandR_ClimateSensitiveSimulator (development version)

- Biomass_borealDataPrep comes from its `modsForFireSense` branch, like Biomass_core: its `dataYear` check against the other LandR modules is there, and a run mixing it with the old version stops at `simInit()`.
- New parent module. Listing `PredictiveEcology/LandR_ClimateSensitiveSimulator@development` in `setupProject(modules = )` fetches and runs canClimateData, climateYear, fireSense (itself a parent), localEcozones, Biomass_borealDataPrep, Biomass_regeneration and Biomass_core.
