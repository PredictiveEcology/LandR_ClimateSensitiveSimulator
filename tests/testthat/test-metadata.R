## The parent's metadata is its contract: the children it fetches.
## Needs no network and none of the children.

md <- SpaDES.core::moduleMetadata(module = moduleName, path = modulePath)

childSpecs <- c(
  "PredictiveEcology/canClimateData@modsForFireSense",
  "PredictiveEcology/climateYear@modsForFireSense",
  "PredictiveEcology/fireSense@development",
  "PredictiveEcology/localEcozones@development",
  "PredictiveEcology/Biomass_borealDataPrep@development",
  "PredictiveEcology/Biomass_regeneration@development",
  "PredictiveEcology/Biomass_core@modsForFireSense"
)

test_that("metadata parses and names the parent", {
  expect_identical(md$name, "LandR_ClimateSensitiveSimulator")
  expect_identical(md$timeunit, "year")
  expect_false(is.na(package_version(md$version$LandR_ClimateSensitiveSimulator, strict = FALSE)))
})

test_that("a parent has no parameters, inputs or outputs of its own", {
  ## for a parent, moduleMetadata() reports its children's tables; read the file instead
  f <- file.path(modulePath, moduleName, paste0(moduleName, ".R"))
  declared <- names(as.list(parse(f, keep.source = FALSE)[[1]][[3]]))
  expect_false(any(c("parameters", "inputObjects", "outputObjects", "reqdPkgs") %in% declared))
})

test_that("childModules are the child specs", {
  expect_identical(md$childModules, childSpecs)
})

test_that("no child needs restricted data", {
  ## Biomass_speciesParameters needs restricted provincial PSP data; Biomass_speciesFactorial
  ## only feeds it; Biomass_speciesData repeats Biomass_borealDataPrep's SCANFI default
  skip_if_not_installed("Require")
  expect_false(any(c("Biomass_speciesParameters", "Biomass_speciesFactorial", "Biomass_speciesData") %in%
                     Require::extractPkgName(md$childModules)))
})
