| pacman Function | Base Equivalent | Description |
|----------------------|----------------------|----------------|
| `p_load`  |  `install.packages` + `library` | Loads and Install Packages |
| `p_install` |  `install.packages` | Install Packages from CRAN |
| `p_install_version` |  `install.packages` & <br/> `packageVersion` | Install Minimum Version of Packages |
| `p_temp` |  NONE | Install a Package Temporarily |
| `p_unload` | `detach` | Unloads Packages from the Search Path |
| `p_update` | `update.packages` | Update Out-of-Date Packages |
