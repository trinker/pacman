library(staticdocs)

sd_section("Installing, Loading, Unloading, Updating, & Deleting",
  "Functions for installing, loading, unloading, updating, & deleting packages",  
  c(
    "p_load",
    "p_install",
    "p_temp",
    "p_unload",
    "p_update",
    "p_delete"
  )
)

sd_section("Session Information",
  "Functions to obtain package session information.",  
  c(
    "p_loaded"
  )
)

sd_section("Local Package Information",
  "Functions to obtain local package information.",  
  c(
    "p_author",
    "p_citation",
    "p_data",
    "p_exists",
    "p_functions",
    "p_help",
    "p_information",
    "p_interactive",
    "p_isloaded",
    "p_news",
    "p_version",
    "p_vignette"
  )
)

sd_section("Internet Based Package Informatio",
  "Functions to obtain Internet based package information.", 
  c(
    "p_cran",
    "p_search_any"
  )
)

sd_section("Library Information",
  "Functions to obtain package library information.", 
  c(
    "p_base",
    "p_library",
    "p_path",
    "p_search_library",
    "p_unlock"  
  )
)

sd_section("pacman Tools",
  "General pacman tools/functions.",  
  c(
    "p_detectOS",
    "p_isglobal",
    "p_opendir" 
  )
)




