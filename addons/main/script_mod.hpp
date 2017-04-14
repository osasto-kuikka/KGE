#define MAINPREFIX z
#define PREFIX kge

#define MAJOR 1
#define MINOR 0
#define PATCHLVL 7
#define BUILD 0

#define VERSION MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR MAJOR,MINOR,PATCHLVL,BUILD

// MINIMAL required version for the Mod. Components can specify others..
#define REQUIRED_VERSION 1.68
#define REQUIRED_CBA_VERSION {3,2,1}

#ifdef COMPONENT_BEAUTIFIED
  #define COMPONENT_NAME QUOTE(KGE - COMPONENT_BEAUTIFIED)
#else
  #define COMPONENT_NAME QUOTE(KGE - COMPONENT)
#endif
