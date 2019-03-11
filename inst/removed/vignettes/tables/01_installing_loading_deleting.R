| pacman Function | Base Equivalent | Description |
|----------------------|----------------------|----------------|
| `p_load`  |  `install.packages` + `library` | Load and Install Packages |
| `p_install` |  `install.packages` | Install Packages from CRAN |
| `p_load_gh`  |  NONE | Load and Install GitHub Packages |
| `p_install_gh` |  NONE | Install Packages from GitHub |    
| `p_install_version` |  `install.packages` & <br/> `packageVersion` | Install Minimum Version of Packages |
| `p_temp` |  NONE | Install a Package Temporarily |
| `p_unload` | `detach` | Unload Packages from the Search Path |
| `p_update` | `update.packages` | Update Out-of-Date Packages |
