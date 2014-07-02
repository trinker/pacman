| pacman Function | Base Equivalent | Description |
|----------------------|----------------------|----------------|
| `p_base`  | NONE | List Base Package |
| `p_library`  | `Sys.getenv` + `.packages` | List Packages in User's Library |
| `p_path`  | `.libPaths`  | Path to User's Package Library |
| `p_search_library`  | NONE | Search Library Packages Via Partial Matching |
| `p_unlock` | NONE  | Deletes 00LOCK Directory |