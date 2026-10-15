# LandR_ClimateSensitiveSimulator

A parent SpaDES module: it has no events, parameters, inputs or outputs of its own. It groups the modules of a climate-sensitive forest landscape simulator, so that listing it in `setupProject(modules = )` fetches and runs all of them. It needs SpaDES.project >= 1.2.0.9013.

| Child module | Role |
|---|---|
| `PredictiveEcology/canClimateData@modsForFireSense` | historical and projected climate rasters |
| `PredictiveEcology/climateYear@modsForFireSense` | the current year's climate layers |
| `PredictiveEcology/fireSense@development` | itself a parent: the nine fireSense fire modules |
| `PredictiveEcology/localEcozones@development` | ecological zones (`ecoregionLayer`) |
| `PredictiveEcology/Biomass_borealDataPrep@development` | initial vegetation and species traits from SCANFI |
| `PredictiveEcology/Biomass_regeneration@development` | post-fire regeneration |
| `PredictiveEcology/Biomass_core@modsForFireSense` | forest growth, mortality and succession |

Each child keeps the account and branch written here. A module you list in `setupProject(modules = )` overrides this module's entry for it, e.g. `c("PredictiveEcology/LandR_ClimateSensitiveSimulator@development", "PredictiveEcology/Biomass_core@development")`.

## Data access

Every child uses public data. Two need a Google sign-in (any account, no special permission), because they read Google Drive with `googledrive`:

- `canClimateData`, for the climate tiles;
- `fireSense`, for the shared ledger of fitted fire models. Its fitting modules (`fireSense_ignitionFit`, `fireSense_spreadFit`) also write to that ledger, which needs write access to the team's Drive folder.

These modules are left out on purpose: `Biomass_speciesParameters` (by default it needs restricted provincial plot data), `Biomass_speciesFactorial` (it only feeds `Biomass_speciesParameters`), and `Biomass_speciesData` (with defaults it repeats Biomass_borealDataPrep's own SCANFI species layers). Add them to `setupProject(modules = )` if you have access.

## Use

```r
SpaDES.project::setupProject(
  modules = "PredictiveEcology/LandR_ClimateSensitiveSimulator@development",
  ...
)
```
