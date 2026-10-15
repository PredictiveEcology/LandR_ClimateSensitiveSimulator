# LandR_ClimateSensitiveSimulator

A parent SpaDES module: it has no events, parameters, inputs or outputs of its own. It groups the modules of a climate-sensitive forest landscape simulator, so that listing it in `setupProject(modules = )` fetches and runs all of them. It needs SpaDES.project >= 1.2.0.9013.

| Child module | Role |
|---|---|
| [`PredictiveEcology/canClimateData@modsForFireSense`](https://github.com/PredictiveEcology/canClimateData/tree/modsForFireSense) | historical and projected climate rasters |
| [`PredictiveEcology/climateYear@modsForFireSense`](https://github.com/PredictiveEcology/climateYear/tree/modsForFireSense) | the current year's climate layers |
| [`PredictiveEcology/fireSense@development`](https://github.com/PredictiveEcology/fireSense/tree/development) | itself a parent: the nine fireSense fire modules |
| [`PredictiveEcology/localEcozones@development`](https://github.com/PredictiveEcology/localEcozones/tree/development) | ecological zones (`ecoregionLayer`) |
| [`PredictiveEcology/Biomass_borealDataPrep@development`](https://github.com/PredictiveEcology/Biomass_borealDataPrep/tree/development) | initial vegetation and species traits from SCANFI |
| [`PredictiveEcology/Biomass_regeneration@development`](https://github.com/PredictiveEcology/Biomass_regeneration/tree/development) | post-fire regeneration |
| [`PredictiveEcology/Biomass_core@modsForFireSense`](https://github.com/PredictiveEcology/Biomass_core/tree/modsForFireSense) | forest growth, mortality and succession |

fireSense brings these, from `development` unless noted: [`fireSense_ELFs`](https://github.com/PredictiveEcology/fireSense_ELFs/tree/development), [`fireSense_dataPrepFit`](https://github.com/PredictiveEcology/fireSense_dataPrepFit/tree/development), [`fireSense_ignitionFit`](https://github.com/PredictiveEcology/fireSense_ignitionFit/tree/development), [`fireSense_spreadFit`](https://github.com/PredictiveEcology/fireSense_spreadFit/tree/development), [`fireSense_dataPrepPredict`](https://github.com/PredictiveEcology/fireSense_dataPrepPredict/tree/development), [`fireSense_ignitionPredict`](https://github.com/PredictiveEcology/fireSense_ignitionPredict/tree/development), [`fireSense_spreadPredict`](https://github.com/PredictiveEcology/fireSense_spreadPredict/tree/development), [`fireSense_burn`](https://github.com/PredictiveEcology/fireSense_burn/tree/development) and [`fireSense_summary`](https://github.com/PredictiveEcology/fireSense_summary/tree/modsForFireSense) (`modsForFireSense`).

Each child keeps the account and branch written here. A module you list in `setupProject(modules = )` overrides this module's entry for it, e.g. `c("PredictiveEcology/LandR_ClimateSensitiveSimulator@development", "PredictiveEcology/Biomass_core@development")`.

## Data access

Every child uses public data. Two need a Google sign-in (any account, no special permission), because they read Google Drive with `googledrive`:

- `canClimateData`, for the climate tiles;
- `fireSense`, for the shared ledger of fitted fire models. Its fitting modules (`fireSense_ignitionFit`, `fireSense_spreadFit`) also write to that ledger, which needs write access to the team's Drive folder.

These modules are left out on purpose: [`Biomass_speciesParameters`](https://github.com/PredictiveEcology/Biomass_speciesParameters) (by default it needs restricted provincial plot data), [`Biomass_speciesFactorial`](https://github.com/PredictiveEcology/Biomass_speciesFactorial) (it only feeds `Biomass_speciesParameters`), and [`Biomass_speciesData`](https://github.com/PredictiveEcology/Biomass_speciesData) (with defaults it repeats Biomass_borealDataPrep's own SCANFI species layers). Add them to `setupProject(modules = )` if you have access.

## Use

```r
SpaDES.project::setupProject(
  modules = "PredictiveEcology/LandR_ClimateSensitiveSimulator@development",
  ...
)
```
