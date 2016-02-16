#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"

// Default versioning level
#define DEFAULT_VERSIONING_LEVEL 2

#define EGVAR(module,var) TRIPLES(PREFIX,module,var)
#define QEGVAR(module,var) QUOTE(EGVAR(module,var))

#define DFUNC(var1) TRIPLES(ADDON,fnc,var1)
#define DEFUNC(var1,var2) TRIPLES(DOUBLES(PREFIX,var1),fnc,var2)
#define FUNC(var1) TRIPLES(ADDON,fnc,var1)
#define EFUNC(var1,var2) TRIPLES(DOUBLES(PREFIX,var1),fnc,var2)
#define CFUNC(var1) TRIPLES(cba,fnc,var1)
#define AFUNC(var1,var2) TRIPLES(DOUBLES(ace,var1),fnc,var2)

#define QFUNC(var1) QUOTE(DFUNC(var1))
#define QEFUNC(var1,var2) QUOTE(DEFUNC(var1,var2))

#define PATHTOEF(var1,var2) PATHTOF_SYS(PREFIX,var1,var2)

#define GETVAR_SYS(var1,var2) getVariable [ARR_2(QUOTE(var1),var2)]
#define SETVAR_SYS(var1,var2) setVariable [ARR_2(QUOTE(var1),var2)]
#define SETPVAR_SYS(var1,var2) setVariable [ARR_3(QUOTE(var1),var2,true)]

#define GETVAR(var1,var2,var3) var1 GETVAR_SYS(var2,var3)
#define GETMVAR(var1,var2) missionNamespace GETVAR_SYS(var1,var2)
#define GETUVAR(var1,var2) uiNamespace GETVAR_SYS(var1,var2)
#define GETPRVAR(var1,var2) profileNamespace GETVAR_SYS(var1,var2)
#define GETPAVAR(var1,var2) parsingNamespace GETVAR_SYS(var1,var2)

#define SETVAR(var1,var2,var3) var1 SETVAR_SYS(var2,var3)
#define SETPVAR(var1,var2,var3) var1 SETPVAR_SYS(var2,var3)
#define SETMVAR(var1,var2) missionNamespace SETVAR_SYS(var1,var2)
#define SETUVAR(var1,var2) uiNamespace SETVAR_SYS(var1,var2)
#define SETPRVAR(var1,var2) profileNamespace SETVAR_SYS(var1,var2)
#define SETPAVAR(var1,var2) parsingNamespace SETVAR_SYS(var1,var2)

#define GETGVAR(var1,var2) GETMVAR(GVAR(var1),var2)
#define GETEGVAR(var1,var2,var3) GETMVAR(EGVAR(var1,var2),var3)

#ifdef DISABLE_COMPILE_CACHE
    #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QUOTE(PATHTOF(functions\DOUBLES(fnc,fncName).sqf))
#else
    #define PREP(fncName) [QUOTE(PATHTOF(functions\DOUBLES(fnc,fncName).sqf)), QFUNC(fncName)] call SLX_XEH_COMPILE_NEW
#endif

#define KGE_LOG(module,level,message) diag_log text KGE_LOGFORMAT(module,level,message)
#define KGE_LOGFORMAT(module,level,message) FORMAT_2(QUOTE([KGE] (module) %1: %2),level,message)

#define KGE_LOGERROR(message) KGE_LOG(COMPONENT,"ERROR",message)
#define KGE_LOGERROR_1(message,arg1) KGE_LOGERROR(FORMAT_1(message,arg1))
#define KGE_LOGERROR_2(message,arg1,arg2) KGE_LOGERROR(FORMAT_2(message,arg1,arg2))
#define KGE_LOGERROR_3(message,arg1,arg2,arg3) KGE_LOGERROR(FORMAT_3(message,arg1,arg2,arg3))
#define KGE_LOGERROR_4(message,arg1,arg2,arg3,arg4) KGE_LOGERROR(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define KGE_LOGERROR_5(message,arg1,arg2,arg3,arg4,arg5) KGE_LOGERROR(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define KGE_LOGERROR_6(message,arg1,arg2,arg3,arg4,arg5,arg6) KGE_LOGERROR(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define KGE_LOGERROR_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) KGE_LOGERROR(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define KGE_LOGERROR_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) KGE_LOGERROR(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))

#define KGE_LOGWARNING(message) KGE_LOG(COMPONENT,"WARNING",message)
#define KGE_LOGWARNING_1(message,arg1) KGE_LOGWARNING(FORMAT_1(message,arg1))
#define KGE_LOGWARNING_2(message,arg1,arg2) KGE_LOGWARNING(FORMAT_2(message,arg1,arg2))
#define KGE_LOGWARNING_3(message,arg1,arg2,arg3) KGE_LOGWARNING(FORMAT_3(message,arg1,arg2,arg3))
#define KGE_LOGWARNING_4(message,arg1,arg2,arg3,arg4) KGE_LOGWARNING(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define KGE_LOGWARNING_5(message,arg1,arg2,arg3,arg4,arg5) KGE_LOGWARNING(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define KGE_LOGWARNING_6(message,arg1,arg2,arg3,arg4,arg5,arg6) KGE_LOGWARNING(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define KGE_LOGWARNING_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) KGE_LOGWARNING(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define KGE_LOGWARNING_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) KGE_LOGWARNING(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))

#define KGE_LOGINFO(message) KGE_LOG(COMPONENT,"INFO",message)
#define KGE_LOGINFO_1(message,arg1) KGE_LOGINFO(FORMAT_1(message,arg1))
#define KGE_LOGINFO_2(message,arg1,arg2) KGE_LOGINFO(FORMAT_2(message,arg1,arg2))
#define KGE_LOGINFO_3(message,arg1,arg2,arg3) KGE_LOGINFO(FORMAT_3(message,arg1,arg2,arg3))
#define KGE_LOGINFO_4(message,arg1,arg2,arg3,arg4) KGE_LOGINFO(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define KGE_LOGINFO_5(message,arg1,arg2,arg3,arg4,arg5) KGE_LOGINFO(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define KGE_LOGINFO_6(message,arg1,arg2,arg3,arg4,arg5,arg6) KGE_LOGINFO(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define KGE_LOGINFO_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) KGE_LOGINFO(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define KGE_LOGINFO_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) KGE_LOGINFO(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))

#define KGE_LOGDEBUG(message) KGE_LOG(COMPONENT,"DEBUG",message)
#define KGE_LOGDEBUG_1(message,arg1) KGE_LOGDEBUG(FORMAT_1(message,arg1))
#define KGE_LOGDEBUG_2(message,arg1,arg2) KGE_LOGDEBUG(FORMAT_2(message,arg1,arg2))
#define KGE_LOGDEBUG_3(message,arg1,arg2,arg3) KGE_LOGDEBUG(FORMAT_3(message,arg1,arg2,arg3))
#define KGE_LOGDEBUG_4(message,arg1,arg2,arg3,arg4) KGE_LOGDEBUG(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define KGE_LOGDEBUG_5(message,arg1,arg2,arg3,arg4,arg5) KGE_LOGDEBUG(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define KGE_LOGDEBUG_6(message,arg1,arg2,arg3,arg4,arg5,arg6) KGE_LOGDEBUG(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define KGE_LOGDEBUG_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) KGE_LOGDEBUG(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define KGE_LOGDEBUG_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) KGE_LOGDEBUG(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))

#define KGE_DEPRECATED(arg1,arg2,arg3) KGE_LOGWARNING_3("%1 is deprecated. Support will be dropped in version %2. Replaced by: %3",arg1,arg2,arg3)
