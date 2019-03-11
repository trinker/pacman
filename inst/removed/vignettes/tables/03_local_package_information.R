| pacman Function | Base Equivalent | Description |
|----------------------|----------------------|----------------|
| `p_author`  | `packageDescription`  | Author of Package|
| `p_citation`  | `citation`  | Citation for Package |
| `p_data`  | `data`  | List Package Data Sets |
| `p_depends` & <br>`p_depends_reverse` | `package_dependencies` & <br> `dependsOnPkgs`| Package Dependencies/Reverse Dependencies Locally/on CRAN |
| `p_exists`  | `available.packages` & <br>`list.files` + `.libPaths` | Logical Check if Package <br>Exists Locally/on CRAN |
| `p_functions`  | `loadNamespace` + `getNamespaceExports`  | Functions from Package |
| `p_help`  | `help`  | HTML/PDF Manuals Viewing |
| `p_information`  | `packageDescription`  |Information for Package |
| `p_interactive` | NONE  | Search Packages Interactively |
| `p_news`  | `news`  | Package NEWS |
| `p_version`  | `packageVersion` & `R.Version`  | Version of Package |
| `p_vignette`  | `browseVignettes`  | Package Vignettes Viewing |