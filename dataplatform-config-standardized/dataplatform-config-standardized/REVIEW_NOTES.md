# EveryAge Standardized Configuration Package

This is a proposed target-state configuration package for review. It is not a drop-in replacement for the current pipelines/notebooks until consuming expressions/code are updated.

## Main changes applied

1. Removed `environment` from orchestration configuration.
2. Removed unused `bronzeConfigMode`.
3. Replaced `executionProfileId` with `profileName`.
4. Replaced ambiguous `stages` with `activityControl`.
5. Removed duplicate notification enablement from activity controls; `notification.isEnabled` is the single notification switch.
6. Consolidated Initial and Incremental orchestration definitions into one `EveryAgeOrchestrationConfig.json`.
7. Replaced generic `MasterConfig.json`, `CreateConfig.json`, `BronzeMasterConfig.json`, and `CreateDelta.json` names with purpose-specific file names.
8. Added `description` to every top-level configuration and to Silver staging table entries.
9. Standardized processing-item enablement to `isEnabled`; top-level config state remains `isActive`.
10. Removed blank/non-applicable source connection fields and grouped relevant connection properties under `connection`.
11. Combined Source-to-Landing entity config path + filename into one `entityConfigPath`.
12. Consolidated duplicate Full/Incremental Bronze processing files into one per source with `loadSettings.initialLoad` and `loadSettings.incrementalLoad`.
13. Renamed Bronze source routing to `BronzeDataProcessingConfig`.
14. Renamed Bronze create routing to `BronzeTableCreateConfig`.
15. Standardized JSON property casing (`endpointUrl`, `powerBiRefresh`, etc.).
16. Removed redundant ADP `isParentEnabled` and repeated API-level Landing path/date partition settings; these are now represented by hierarchy and `landingSettings`.
17. Preserved all existing source/table mappings, DDL SQL and Silver staging SQL.

## Important review decisions still needed

- Whether `profileName` should instead be named `processingFrequency` / `executionFrequency`.
- Whether `sourceToLanding` should remain one orchestration activity when ADF and Fabric/API implementations are technically separate.
- Whether `landingToBronze` should become one common activity for Full Snapshot and API processing, as represented in this target config.
- Whether subject-area terminology should be `subjectArea` everywhere or retain `workloadId` for runtime compatibility.
- Final schema-evolution strategy for files whose columns change over time.
- Whether notification settings require profile-level overrides in the future.
