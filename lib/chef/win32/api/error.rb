#
# Author:: John Keiser (<jkeiser@chef.io>)
# Copyright:: Copyright 2011-2016, Chef Software Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require "chef/win32/api"

class Chef
  module ReservedNames::Win32
    module API
      module Error
        extend Chef::ReservedNames::Win32::API

        ###############################################
        # Win32 API Constants
        ###############################################

        S_OK                      = 0
        NO_ERROR                  = 0
        ERROR_SUCCESS             = 0
        ERROR_INVALID_FUNCTION    = 1
        ERROR_FILE_NOT_FOUND      = 2
        ERROR_PATH_NOT_FOUND      = 3
        ERROR_TOO_MANY_OPEN_FILES = 4
        ERROR_ACCESS_DENIED       = 5
        ERROR_INVALID_HANDLE      = 6
        ERROR_ARENA_TRASHED       = 7
        ERROR_NOT_ENOUGH_MEMORY   = 8
        ERROR_INVALID_BLOCK       = 9
        ERROR_BAD_ENVIRONMENT     = 10
        ERROR_BAD_FORMAT          = 11
        ERROR_INVALID_ACCESS      = 12
        ERROR_INVALID_DATA        = 13
        ERROR_INVALID_DRIVE       = 15
        ERROR_CURRENT_DIRECTORY   = 16
        ERROR_NOT_SAME_DEVICE     = 17
        ERROR_NO_MORE_FILES       = 18
        ERROR_WRITE_PROTECT       = 19
        ERROR_BAD_UNIT            = 20
        ERROR_NOT_READY           = 21
        ERROR_BAD_COMMAND         = 22
        ERROR_CRC                 = 23
        ERROR_BAD_LENGTH          = 24
        ERROR_SEEK                = 25
        ERROR_NOT_DOS_DISK        = 26
        ERROR_SECTOR_NOT_FOUND    = 27
        ERROR_OUT_OF_PAPER        = 28
        ERROR_WRITE_FAULT         = 29
        ERROR_READ_FAULT          = 30
        ERROR_GEN_FAILURE         = 31
        ERROR_SHARING_VIOLATION   = 32
        ERROR_LOCK_VIOLATION      = 33
        ERROR_WRONG_DISK          = 34
        ERROR_FCB_UNAVAILABLE     = 35  # gets returned for some unsuccessful DeviceIoControl calls
        ERROR_SHARING_BUFFER_EXCEEDED = 36
        ERROR_HANDLE_EOF          = 38
        ERROR_HANDLE_DISK_FULL    = 39

        ERROR_NOT_SUPPORTED       = 50
        ERROR_REM_NOT_LIST        = 51
        ERROR_DUP_NAME            = 52
        ERROR_BAD_NETPATH         = 53
        ERROR_NETWORK_BUSY        = 54
        ERROR_DEV_NOT_EXIST       = 55
        ERROR_TOO_MANY_CMDS       = 56
        ERROR_ADAP_HDW_ERR        = 57
        ERROR_BAD_NET_RESP        = 58
        ERROR_UNEXP_NET_ERR       = 59
        ERROR_BAD_REM_ADAP        = 60
        ERROR_PRINTQ_FULL         = 61
        ERROR_NO_SPOOL_SPACE      = 62
        ERROR_PRINT_CANCELLED     = 63
        ERROR_NETNAME_DELETED     = 64
        ERROR_NETWORK_ACCESS_DENIED = 65
        ERROR_BAD_DEV_TYPE        = 66
        ERROR_BAD_NET_NAME        = 67
        ERROR_TOO_MANY_NAMES      = 68
        ERROR_TOO_MANY_SESS       = 69
        ERROR_SHARING_PAUSED      = 70
        ERROR_REQ_NOT_ACCEP       = 71
        ERROR_REDIR_PAUSED        = 72

        ERROR_FILE_EXISTS         = 80
        ERROR_DUP_FCB             = 81
        ERROR_CANNOT_MAKE         = 82
        ERROR_FAIL_I24            = 83
        ERROR_OUT_OF_STRUCTURES   = 84
        ERROR_ALREADY_ASSIGNED    = 85
        ERROR_INVALID_PASSWORD    = 86
        ERROR_INVALID_PARAMETER   = 87
        ERROR_NET_WRITE_FAULT     = 88
        ERROR_NO_PROC_SLOTS       = 89  # no process slots available
        ERROR_NOT_FROZEN          = 90
        ERR_TSTOVFL               = 91  # timer service table overflow
        ERR_TSTDUP                = 92  # timer service table duplicate
        ERROR_NO_ITEMS            = 93  # There were no items to operate upon
        ERROR_INTERRUPT           = 95  # interrupted system call

        ERROR_TOO_MANY_SEMAPHORES       = 100
        ERROR_EXCL_SEM_ALREADY_OWNED    = 101
        ERROR_SEM_IS_SET                = 102
        ERROR_TOO_MANY_SEM_REQUESTS     = 103
        ERROR_INVALID_AT_INTERRUPT_TIME = 104
        ERROR_SEM_OWNER_DIED            = 105 # waitsem found owner died
        ERROR_SEM_USER_LIMIT            = 106 # too many procs have this sem
        ERROR_DISK_CHANGE               = 107 # insert disk b into drive a
        ERROR_DRIVE_LOCKED              = 108 # drive locked by another process
        ERROR_BROKEN_PIPE               = 109 # write on pipe with no reader
        ERROR_OPEN_FAILED               = 110 # open/created failed
        ERROR_DISK_FULL                 = 112 # not enough space
        ERROR_NO_MORE_SEARCH_HANDLES    = 113 # can't allocate
        ERROR_INVALID_TARGET_HANDLE     = 114 # handle in DOSDUPHANDLE is invalid
        ERROR_PROTECTION_VIOLATION      = 115 # bad user virtual address
        ERROR_VIOKBD_REQUEST            = 116
        ERROR_INVALID_CATEGORY          = 117 # category for DEVIOCTL not defined
        ERROR_INVALID_VERIFY_SWITCH     = 118 # invalid value
        ERROR_BAD_DRIVER_LEVEL          = 119 # DosDevIOCTL not level four
        ERROR_CALL_NOT_IMPLEMENTED      = 120
        ERROR_SEM_TIMEOUT               = 121 # timeout from semaphore function
        ERROR_INSUFFICIENT_BUFFER       = 122
        ERROR_INVALID_NAME              = 123 # illegal char or malformed file system name
        ERROR_INVALID_LEVEL             = 124 # unimplemented level for info retrieval
        ERROR_NO_VOLUME_LABEL           = 125 # no volume label found
        ERROR_MOD_NOT_FOUND             = 126 # w_getprocaddr, w_getmodhandle
        ERROR_PROC_NOT_FOUND            = 127 # w_getprocaddr
        ERROR_WAIT_NO_CHILDREN          = 128 # CWait finds to children
        ERROR_CHILD_NOT_COMPLETE        = 129 # CWait children not dead yet
        ERROR_DIRECT_ACCESS_HANDLE      = 130 # invalid for direct disk access
        ERROR_NEGATIVE_SEEK             = 131 # tried to seek negative offset
        ERROR_SEEK_ON_DEVICE            = 132 # tried to seek on device or pipe
        ERROR_IS_JOIN_TARGET            = 133
        ERROR_IS_JOINED                 = 134
        ERROR_IS_SUBSTED                = 135
        ERROR_NOT_JOINED                = 136
        ERROR_NOT_SUBSTED               = 137
        ERROR_JOIN_TO_JOIN              = 138
        ERROR_SUBST_TO_SUBST            = 139
        ERROR_JOIN_TO_SUBST             = 140
        ERROR_SUBST_TO_JOIN             = 141
        ERROR_BUSY_DRIVE                = 142
        ERROR_SAME_DRIVE                = 143
        ERROR_DIR_NOT_ROOT              = 144
        ERROR_DIR_NOT_EMPTY             = 145
        ERROR_IS_SUBST_PATH             = 146
        ERROR_IS_JOIN_PATH              = 147
        ERROR_PATH_BUSY                 = 148
        ERROR_IS_SUBST_TARGET           = 149
        ERROR_SYSTEM_TRACE              = 150 # system trace error
        ERROR_INVALID_EVENT_COUNT       = 151 # DosMuxSemWait errors
        ERROR_TOO_MANY_MUXWAITERS       = 152
        ERROR_INVALID_LIST_FORMAT       = 153
        ERROR_LABEL_TOO_LONG            = 154
        ERROR_TOO_MANY_TCBS             = 155
        ERROR_SIGNAL_REFUSED            = 156
        ERROR_DISCARDED                 = 157
        ERROR_NOT_LOCKED                = 158
        ERROR_BAD_THREADID_ADDR         = 159
        ERROR_BAD_ARGUMENTS             = 160
        ERROR_BAD_PATHNAME              = 161
        ERROR_SIGNAL_PENDING            = 162
        ERROR_UNCERTAIN_MEDIA           = 163
        ERROR_MAX_THRDS_REACHED         = 164
        ERROR_MONITORS_NOT_SUPPORTED    = 165

        ERROR_LOCK_FAILED               = 167
        ERROR_BUSY                      = 170
        ERROR_CANCEL_VIOLATION          = 173
        ERROR_ATOMIC_LOCKS_NOT_SUPPORTED = 174

        ERROR_INVALID_SEGMENT_NUMBER    = 180
        ERROR_INVALID_CALLGATE          = 181
        ERROR_INVALID_ORDINAL           = 182
        ERROR_ALREADY_EXISTS            = 183
        ERROR_NO_CHILD_PROCESS          = 184
        ERROR_CHILD_ALIVE_NOWAIT        = 185
        ERROR_INVALID_FLAG_NUMBER       = 186
        ERROR_SEM_NOT_FOUND             = 187
        ERROR_INVALID_STARTING_CODESEG  = 188
        ERROR_INVALID_STACKSEG          = 189
        ERROR_INVALID_MODULETYPE        = 190
        ERROR_INVALID_EXE_SIGNATURE     = 191
        ERROR_EXE_MARKED_INVALID        = 192
        ERROR_BAD_EXE_FORMAT            = 193
        ERROR_ITERATED_DATA_EXCEEDS_64k = 194 # rubocop:disable Naming/ConstantName
        ERROR_INVALID_MINALLOCSIZE      = 195
        ERROR_DYNLINK_FROM_INVALID_RING = 196
        ERROR_IOPL_NOT_ENABLED          = 197
        ERROR_INVALID_SEGDPL            = 198
        ERROR_AUTODATASEG_EXCEEDS_64k   = 199 # rubocop:disable Naming/ConstantName
        ERROR_RING2SEG_MUST_BE_MOVABLE  = 200
        ERROR_RELOC_CHAIN_XEEDS_SEGLIM  = 201
        ERROR_INFLOOP_IN_RELOC_CHAIN    = 202
        ERROR_ENVVAR_NOT_FOUND          = 203
        ERROR_NOT_CURRENT_CTRY          = 204
        ERROR_NO_SIGNAL_SENT            = 205
        ERROR_FILENAME_EXCED_RANGE      = 206 # if filename > 8.3
        ERROR_RING2_STACK_IN_USE        = 207 # for FAPI
        ERROR_META_EXPANSION_TOO_LONG   = 208 # if "*a" > 8.3
        ERROR_INVALID_SIGNAL_NUMBER     = 209
        ERROR_THREAD_1_INACTIVE         = 210
        ERROR_INFO_NOT_AVAIL            = 211 # @@ PTM 5550
        ERROR_LOCKED                    = 212
        ERROR_BAD_DYNALINK              = 213 # @@ PTM 5760
        ERROR_TOO_MANY_MODULES          = 214
        ERROR_NESTING_NOT_ALLOWED       = 215
        ERROR_EXE_MACHINE_TYPE_MISMATCH = 216

        ERROR_BAD_PIPE                  = 230
        ERROR_PIPE_BUSY                 = 231
        ERROR_NO_DATA                   = 232
        ERROR_PIPE_NOT_CONNECTED        = 233
        ERROR_MORE_DATA                 = 234

        ERROR_VC_DISCONNECTED           = 240
        ERROR_INVALID_EA_NAME           = 254
        ERROR_EA_LIST_INCONSISTENT      = 255
        ERROR_NO_MORE_ITEMS             = 259
        ERROR_CANNOT_COPY               = 266
        ERROR_DIRECTORY                 = 267
        ERROR_EAS_DIDNT_FIT             = 275
        ERROR_EA_FILE_CORRUPT           = 276
        ERROR_EA_TABLE_FULL             = 277
        ERROR_INVALID_EA_HANDLE         = 278
        ERROR_EAS_NOT_SUPPORTED         = 282
        ERROR_NOT_OWNER                 = 288
        ERROR_TOO_MANY_POSTS            = 298
        ERROR_PARTIAL_COPY              = 299
        ERROR_OPLOCK_NOT_GRANTED        = 300
        ERROR_INVALID_OPLOCK_PROTOCOL   = 301
        ERROR_DISK_TOO_FRAGMENTED       = 302
        ERROR_MR_MID_NOT_FOUND          = 317
        ERROR_SCOPE_NOT_FOUND           = 318
        ERROR_FAIL_NOACTION_REBOOT      = 350
        ERROR_FAIL_SHUTDOWN             = 351
        ERROR_FAIL_RESTART              = 352
        ERROR_MAX_SESSIONS_REACHED      = 353
        ERROR_INVALID_ADDRESS           = 487
        ERROR_USER_PROFILE_LOAD         = 500
        ERROR_ARITHMETIC_OVERFLOW       = 534
        ERROR_PIPE_CONNECTED            = 535
        ERROR_PIPE_LISTENING            = 536

        ERROR_EA_ACCESS_DENIED          = 994
        ERROR_OPERATION_ABORTED         = 995
        ERROR_IO_INCOMPLETE             = 996
        ERROR_IO_PENDING                = 997
        ERROR_NOACCESS                  = 998
        ERROR_SWAPERROR                 = 999

        ERROR_STACK_OVERFLOW                  = 1001
        ERROR_INVALID_MESSAGE                 = 1002
        ERROR_CAN_NOT_COMPLETE                = 1003
        ERROR_INVALID_FLAGS                   = 1004
        ERROR_UNRECOGNIZED_VOLUME             = 1005
        ERROR_FILE_INVALID                    = 1006
        ERROR_FULLSCREEN_MODE                 = 1007
        ERROR_NO_TOKEN                        = 1008
        ERROR_BADDB                           = 1009
        ERROR_BADKEY                          = 1010
        ERROR_CANTOPEN                        = 1011
        ERROR_CANTREAD                        = 1012
        ERROR_CANTWRITE                       = 1013
        ERROR_REGISTRY_RECOVERED              = 1014
        ERROR_REGISTRY_CORRUPT                = 1015
        ERROR_REGISTRY_IO_FAILED              = 1016
        ERROR_NOT_REGISTRY_FILE               = 1017
        ERROR_KEY_DELETED                     = 1018
        ERROR_NO_LOG_SPACE                    = 1019
        ERROR_KEY_HAS_CHILDREN                = 1020
        ERROR_CHILD_MUST_BE_VOLATILE          = 1021
        ERROR_NOTIFY_ENUM_DIR                 = 1022
        ERROR_DEPENDENT_SERVICES_RUNNING      = 1051
        ERROR_INVALID_SERVICE_CONTROL         = 1052
        ERROR_SERVICE_REQUEST_TIMEOUT         = 1053
        ERROR_SERVICE_NO_THREAD               = 1054
        ERROR_SERVICE_DATABASE_LOCKED         = 1055
        ERROR_SERVICE_ALREADY_RUNNING         = 1056
        ERROR_INVALID_SERVICE_ACCOUNT         = 1057
        ERROR_SERVICE_DISABLED                = 1058
        ERROR_CIRCULAR_DEPENDENCY             = 1059
        ERROR_SERVICE_DOES_NOT_EXIST          = 1060
        ERROR_SERVICE_CANNOT_ACCEPT_CTRL      = 1061
        ERROR_SERVICE_NOT_ACTIVE              = 1062
        ERROR_FAILED_SERVICE_CONTROLLER_CONNECT = 1063
        ERROR_EXCEPTION_IN_SERVICE            = 1064
        ERROR_DATABASE_DOES_NOT_EXIST         = 1065
        ERROR_SERVICE_SPECIFIC_ERROR          = 1066
        ERROR_PROCESS_ABORTED                 = 1067
        ERROR_SERVICE_DEPENDENCY_FAIL         = 1068
        ERROR_SERVICE_LOGON_FAILED            = 1069
        ERROR_SERVICE_START_HANG              = 1070
        ERROR_INVALID_SERVICE_LOCK            = 1071
        ERROR_SERVICE_MARKED_FOR_DELETE       = 1072
        ERROR_SERVICE_EXISTS                  = 1073
        ERROR_ALREADY_RUNNING_LKG             = 1074
        ERROR_SERVICE_DEPENDENCY_DELETED      = 1075
        ERROR_BOOT_ALREADY_ACCEPTED           = 1076
        ERROR_SERVICE_NEVER_STARTED           = 1077
        ERROR_DUPLICATE_SERVICE_NAME          = 1078
        ERROR_DIFFERENT_SERVICE_ACCOUNT       = 1079
        ERROR_CANNOT_DETECT_DRIVER_FAILURE    = 1080
        ERROR_CANNOT_DETECT_PROCESS_ABORT     = 1081
        ERROR_NO_RECOVERY_PROGRAM             = 1082
        ERROR_SERVICE_NOT_IN_EXE              = 1083
        ERROR_END_OF_MEDIA                    = 1100
        ERROR_FILEMARK_DETECTED               = 1101
        ERROR_BEGINNING_OF_MEDIA              = 1102
        ERROR_SETMARK_DETECTED                = 1103
        ERROR_NO_DATA_DETECTED                = 1104
        ERROR_PARTITION_FAILURE               = 1105
        ERROR_INVALID_BLOCK_LENGTH            = 1106
        ERROR_DEVICE_NOT_PARTITIONED          = 1107
        ERROR_UNABLE_TO_LOCK_MEDIA            = 1108
        ERROR_UNABLE_TO_UNLOAD_MEDIA          = 1109
        ERROR_MEDIA_CHANGED                   = 1110
        ERROR_BUS_RESET                       = 1111
        ERROR_NO_MEDIA_IN_DRIVE               = 1112
        ERROR_NO_UNICODE_TRANSLATION          = 1113
        ERROR_DLL_INIT_FAILED                 = 1114
        ERROR_SHUTDOWN_IN_PROGRESS            = 1115
        ERROR_NO_SHUTDOWN_IN_PROGRESS         = 1116
        ERROR_IO_DEVICE                       = 1117
        ERROR_SERIAL_NO_DEVICE                = 1118
        ERROR_IRQ_BUSY                        = 1119
        ERROR_MORE_WRITES                     = 1120
        ERROR_COUNTER_TIMEOUT                 = 1121
        ERROR_FLOPPY_ID_MARK_NOT_FOUND        = 1122
        ERROR_FLOPPY_WRONG_CYLINDER           = 1123
        ERROR_FLOPPY_UNKNOWN_ERROR            = 1124
        ERROR_FLOPPY_BAD_REGISTERS            = 1125
        ERROR_DISK_RECALIBRATE_FAILED         = 1126
        ERROR_DISK_OPERATION_FAILED           = 1127
        ERROR_DISK_RESET_FAILED               = 1128
        ERROR_EOM_OVERFLOW                    = 1129
        ERROR_NOT_ENOUGH_SERVER_MEMORY        = 1130
        ERROR_POSSIBLE_DEADLOCK               = 1131
        ERROR_MAPPED_ALIGNMENT                = 1132
        ERROR_SET_POWER_STATE_VETOED          = 1140
        ERROR_SET_POWER_STATE_FAILED          = 1141
        ERROR_TOO_MANY_LINKS                  = 1142
        ERROR_OLD_WIN_VERSION                 = 1150
        ERROR_APP_WRONG_OS                    = 1151
        ERROR_SINGLE_INSTANCE_APP             = 1152
        ERROR_RMODE_APP                       = 1153
        ERROR_INVALID_DLL                     = 1154
        ERROR_NO_ASSOCIATION                  = 1155
        ERROR_DDE_FAIL                        = 1156
        ERROR_DLL_NOT_FOUND                   = 1157
        ERROR_NO_MORE_USER_HANDLES            = 1158
        ERROR_MESSAGE_SYNC_ONLY               = 1159
        ERROR_SOURCE_ELEMENT_EMPTY            = 1160
        ERROR_DESTINATION_ELEMENT_FULL        = 1161
        ERROR_ILLEGAL_ELEMENT_ADDRESS         = 1162
        ERROR_MAGAZINE_NOT_PRESENT            = 1163
        ERROR_DEVICE_REINITIALIZATION_NEEDED  = 1164
        ERROR_DEVICE_REQUIRES_CLEANING        = 1165
        ERROR_DEVICE_DOOR_OPEN                = 1166
        ERROR_DEVICE_NOT_CONNECTED            = 1167
        ERROR_NOT_FOUND                       = 1168
        ERROR_NO_MATCH                        = 1169
        ERROR_SET_NOT_FOUND                   = 1170
        ERROR_POINT_NOT_FOUND                 = 1171
        ERROR_NO_TRACKING_SERVICE             = 1172
        ERROR_NO_VOLUME_ID                    = 1173
        ERROR_UNABLE_TO_REMOVE_REPLACED       = 1175
        ERROR_UNABLE_TO_MOVE_REPLACEMENT      = 1176
        ERROR_UNABLE_TO_MOVE_REPLACEMENT_2    = 1177
        ERROR_JOURNAL_DELETE_IN_PROGRESS      = 1178
        ERROR_JOURNAL_NOT_ACTIVE              = 1179
        ERROR_POTENTIAL_FILE_FOUND            = 1180
        ERROR_JOURNAL_ENTRY_DELETED           = 1181
        ERROR_BAD_DEVICE                      = 1200
        ERROR_CONNECTION_UNAVAIL              = 1201
        ERROR_DEVICE_ALREADY_REMEMBERED       = 1202
        ERROR_NO_NET_OR_BAD_PATH              = 1203
        ERROR_BAD_PROVIDER                    = 1204
        ERROR_CANNOT_OPEN_PROFILE             = 1205
        ERROR_BAD_PROFILE                     = 1206
        ERROR_NOT_CONTAINER                   = 1207
        ERROR_EXTENDED_ERROR                  = 1208
        ERROR_INVALID_GROUPNAME               = 1209
        ERROR_INVALID_COMPUTERNAME            = 1210
        ERROR_INVALID_EVENTNAME               = 1211
        ERROR_INVALID_DOMAINNAME              = 1212
        ERROR_INVALID_SERVICENAME             = 1213
        ERROR_INVALID_NETNAME                 = 1214
        ERROR_INVALID_SHARENAME               = 1215
        ERROR_INVALID_PASSWORDNAME            = 1216
        ERROR_INVALID_MESSAGENAME             = 1217
        ERROR_INVALID_MESSAGEDEST             = 1218
        ERROR_SESSION_CREDENTIAL_CONFLICT     = 1219
        ERROR_REMOTE_SESSION_LIMIT_EXCEEDED   = 1220
        ERROR_DUP_DOMAINNAME                  = 1221
        ERROR_NO_NETWORK                      = 1222
        ERROR_CANCELLED                       = 1223
        ERROR_USER_MAPPED_FILE                = 1224
        ERROR_CONNECTION_REFUSED              = 1225
        ERROR_GRACEFUL_DISCONNECT             = 1226
        ERROR_ADDRESS_ALREADY_ASSOCIATED      = 1227
        ERROR_ADDRESS_NOT_ASSOCIATED          = 1228
        ERROR_CONNECTION_INVALID              = 1229
        ERROR_CONNECTION_ACTIVE               = 1230
        ERROR_NETWORK_UNREACHABLE             = 1231
        ERROR_HOST_UNREACHABLE                = 1232
        ERROR_PROTOCOL_UNREACHABLE            = 1233
        ERROR_PORT_UNREACHABLE                = 1234
        ERROR_REQUEST_ABORTED                 = 1235
        ERROR_CONNECTION_ABORTED              = 1236
        ERROR_RETRY                           = 1237
        ERROR_CONNECTION_COUNT_LIMIT          = 1238
        ERROR_LOGIN_TIME_RESTRICTION          = 1239
        ERROR_LOGIN_WKSTA_RESTRICTION         = 1240
        ERROR_INCORRECT_ADDRESS               = 1241
        ERROR_ALREADY_REGISTERED              = 1242
        ERROR_SERVICE_NOT_FOUND               = 1243
        ERROR_NOT_AUTHENTICATED               = 1244
        ERROR_NOT_LOGGED_ON                   = 1245
        ERROR_CONTINUE                        = 1246
        ERROR_ALREADY_INITIALIZED             = 1247
        ERROR_NO_MORE_DEVICES                 = 1248
        ERROR_NO_SUCH_SITE                    = 1249
        ERROR_DOMAIN_CONTROLLER_EXISTS        = 1250
        ERROR_ONLY_IF_CONNECTED               = 1251
        ERROR_OVERRIDE_NOCHANGES              = 1252
        ERROR_BAD_USER_PROFILE                = 1253
        ERROR_NOT_SUPPORTED_ON_SBS            = 1254
        ERROR_SERVER_SHUTDOWN_IN_PROGRESS     = 1255
        ERROR_HOST_DOWN                       = 1256
        ERROR_ACCESS_DISABLED_BY_POLICY       = 1260
        ERROR_REG_NAT_CONSUMPTION             = 1261
        ERROR_PKINIT_FAILURE                  = 1263
        ERROR_SMARTCARD_SUBSYSTEM_FAILURE     = 1264
        ERROR_DOWNGRADE_DETECTED              = 1265
        ERROR_MACHINE_LOCKED                  = 1271
        ERROR_CALLBACK_SUPPLIED_INVALID_DATA  = 1273
        ERROR_SYNC_FOREGROUND_REFRESH_REQUIRED = 1274
        ERROR_DRIVER_BLOCKED                  = 1275
        ERROR_INVALID_IMPORT_OF_NON_DLL       = 1276
        ERROR_NOT_ALL_ASSIGNED                = 1300
        ERROR_SOME_NOT_MAPPED                 = 1301
        ERROR_NO_QUOTAS_FOR_ACCOUNT           = 1302
        ERROR_LOCAL_USER_SESSION_KEY          = 1303
        ERROR_NULL_LM_PASSWORD                = 1304
        ERROR_UNKNOWN_REVISION                = 1305
        ERROR_REVISION_MISMATCH               = 1306
        ERROR_INVALID_OWNER                   = 1307
        ERROR_INVALID_PRIMARY_GROUP           = 1308
        ERROR_NO_IMPERSONATION_TOKEN          = 1309
        ERROR_CANT_DISABLE_MANDATORY          = 1310
        ERROR_NO_LOGON_SERVERS                = 1311
        ERROR_NO_SUCH_LOGON_SESSION           = 1312
        ERROR_NO_SUCH_PRIVILEGE               = 1313
        ERROR_PRIVILEGE_NOT_HELD              = 1314
        ERROR_INVALID_ACCOUNT_NAME            = 1315
        ERROR_USER_EXISTS                     = 1316
        ERROR_NO_SUCH_USER                    = 1317
        ERROR_GROUP_EXISTS                    = 1318
        ERROR_NO_SUCH_GROUP                   = 1319
        ERROR_MEMBER_IN_GROUP                 = 1320
        ERROR_MEMBER_NOT_IN_GROUP             = 1321
        ERROR_LAST_ADMIN                      = 1322
        ERROR_WRONG_PASSWORD                  = 1323
        ERROR_ILL_FORMED_PASSWORD             = 1324
        ERROR_PASSWORD_RESTRICTION            = 1325
        ERROR_LOGON_FAILURE                   = 1326
        ERROR_ACCOUNT_RESTRICTION             = 1327
        ERROR_INVALID_LOGON_HOURS             = 1328
        ERROR_INVALID_WORKSTATION             = 1329
        ERROR_PASSWORD_EXPIRED                = 1330
        ERROR_ACCOUNT_DISABLED                = 1331
        ERROR_NONE_MAPPED                     = 1332
        ERROR_TOO_MANY_LUIDS_REQUESTED        = 1333
        ERROR_LUIDS_EXHAUSTED                 = 1334
        ERROR_INVALID_SUB_AUTHORITY           = 1335
        ERROR_INVALID_ACL                     = 1336
        ERROR_INVALID_SID                     = 1337
        ERROR_INVALID_SECURITY_DESCR          = 1338
        ERROR_BAD_INHERITANCE_ACL             = 1340
        ERROR_SERVER_DISABLED                 = 1341
        ERROR_SERVER_NOT_DISABLED             = 1342
        ERROR_INVALID_ID_AUTHORITY            = 1343
        ERROR_ALLOTTED_SPACE_EXCEEDED         = 1344
        ERROR_INVALID_GROUP_ATTRIBUTES        = 1345
        ERROR_BAD_IMPERSONATION_LEVEL         = 1346
        ERROR_CANT_OPEN_ANONYMOUS             = 1347
        ERROR_BAD_VALIDATION_CLASS            = 1348
        ERROR_BAD_TOKEN_TYPE                  = 1349
        ERROR_NO_SECURITY_ON_OBJECT           = 1350
        ERROR_CANT_ACCESS_DOMAIN_INFO         = 1351
        ERROR_INVALID_SERVER_STATE            = 1352
        ERROR_INVALID_DOMAIN_STATE            = 1353
        ERROR_INVALID_DOMAIN_ROLE             = 1354
        ERROR_NO_SUCH_DOMAIN                  = 1355
        ERROR_DOMAIN_EXISTS                   = 1356
        ERROR_DOMAIN_LIMIT_EXCEEDED           = 1357
        ERROR_INTERNAL_DB_CORRUPTION          = 1358
        ERROR_INTERNAL_ERROR                  = 1359
        ERROR_GENERIC_NOT_MAPPED              = 1360
        ERROR_BAD_DESCRIPTOR_FORMAT           = 1361
        ERROR_NOT_LOGON_PROCESS               = 1362
        ERROR_LOGON_SESSION_EXISTS            = 1363
        ERROR_NO_SUCH_PACKAGE                 = 1364
        ERROR_BAD_LOGON_SESSION_STATE         = 1365
        ERROR_LOGON_SESSION_COLLISION         = 1366
        ERROR_INVALID_LOGON_TYPE              = 1367
        ERROR_CANNOT_IMPERSONATE              = 1368
        ERROR_RXACT_INVALID_STATE             = 1369
        ERROR_RXACT_COMMIT_FAILURE            = 1370
        ERROR_SPECIAL_ACCOUNT                 = 1371
        ERROR_SPECIAL_GROUP                   = 1372
        ERROR_SPECIAL_USER                    = 1373
        ERROR_MEMBERS_PRIMARY_GROUP           = 1374
        ERROR_TOKEN_ALREADY_IN_USE            = 1375
        ERROR_NO_SUCH_ALIAS                   = 1376
        ERROR_MEMBER_NOT_IN_ALIAS             = 1377
        ERROR_MEMBER_IN_ALIAS                 = 1378
        ERROR_ALIAS_EXISTS                    = 1379
        ERROR_LOGON_NOT_GRANTED               = 1380
        ERROR_TOO_MANY_SECRETS                = 1381
        ERROR_SECRET_TOO_LONG                 = 1382
        ERROR_INTERNAL_DB_ERROR               = 1383
        ERROR_TOO_MANY_CONTEXT_IDS            = 1384
        ERROR_LOGON_TYPE_NOT_GRANTED          = 1385
        ERROR_NT_CROSS_ENCRYPTION_REQUIRED    = 1386
        ERROR_NO_SUCH_MEMBER                  = 1387
        ERROR_INVALID_MEMBER                  = 1388
        ERROR_TOO_MANY_SIDS                   = 1389
        ERROR_LM_CROSS_ENCRYPTION_REQUIRED    = 1390
        ERROR_NO_INHERITANCE                  = 1391
        ERROR_FILE_CORRUPT                    = 1392
        ERROR_DISK_CORRUPT                    = 1393
        ERROR_NO_USER_SESSION_KEY             = 1394
        ERROR_LICENSE_QUOTA_EXCEEDED          = 1395
        ERROR_WRONG_TARGET_NAME               = 1396
        ERROR_MUTUAL_AUTH_FAILED              = 1397
        ERROR_TIME_SKEW                       = 1398
        ERROR_CURRENT_DOMAIN_NOT_ALLOWED      = 1399
        ERROR_INVALID_WINDOW_HANDLE           = 1400
        ERROR_INVALID_MENU_HANDLE             = 1401
        ERROR_INVALID_CURSOR_HANDLE           = 1402
        ERROR_INVALID_ACCEL_HANDLE            = 1403
        ERROR_INVALID_HOOK_HANDLE             = 1404
        ERROR_INVALID_DWP_HANDLE              = 1405
        ERROR_TLW_WITH_WSCHILD                = 1406
        ERROR_CANNOT_FIND_WND_CLASS           = 1407
        ERROR_WINDOW_OF_OTHER_THREAD          = 1408
        ERROR_HOTKEY_ALREADY_REGISTERED       = 1409
        ERROR_CLASS_ALREADY_EXISTS            = 1410
        ERROR_CLASS_DOES_NOT_EXIST            = 1411
        ERROR_CLASS_HAS_WINDOWS               = 1412
        ERROR_INVALID_INDEX                   = 1413
        ERROR_INVALID_ICON_HANDLE             = 1414
        ERROR_PRIVATE_DIALOG_INDEX            = 1415
        ERROR_LISTBOX_ID_NOT_FOUND            = 1416
        ERROR_NO_WILDCARD_CHARACTERS          = 1417
        ERROR_CLIPBOARD_NOT_OPEN              = 1418
        ERROR_HOTKEY_NOT_REGISTERED           = 1419
        ERROR_WINDOW_NOT_DIALOG               = 1420
        ERROR_CONTROL_ID_NOT_FOUND            = 1421
        ERROR_INVALID_COMBOBOX_MESSAGE        = 1422
        ERROR_WINDOW_NOT_COMBOBOX             = 1423
        ERROR_INVALID_EDIT_HEIGHT             = 1424
        ERROR_DC_NOT_FOUND                    = 1425
        ERROR_INVALID_HOOK_FILTER             = 1426
        ERROR_INVALID_FILTER_PROC             = 1427
        ERROR_HOOK_NEEDS_HMOD                 = 1428
        ERROR_GLOBAL_ONLY_HOOK                = 1429
        ERROR_JOURNAL_HOOK_SET                = 1430
        ERROR_HOOK_NOT_INSTALLED              = 1431
        ERROR_INVALID_LB_MESSAGE              = 1432
        ERROR_SETCOUNT_ON_BAD_LB              = 1433
        ERROR_LB_WITHOUT_TABSTOPS             = 1434
        ERROR_DESTROY_OBJECT_OF_OTHER_THREAD  = 1435
        ERROR_CHILD_WINDOW_MENU               = 1436
        ERROR_NO_SYSTEM_MENU                  = 1437
        ERROR_INVALID_MSGBOX_STYLE            = 1438
        ERROR_INVALID_SPI_VALUE               = 1439
        ERROR_SCREEN_ALREADY_LOCKED           = 1440
        ERROR_HWNDS_HAVE_DIFF_PARENT          = 1441
        ERROR_NOT_CHILD_WINDOW                = 1442
        ERROR_INVALID_GW_COMMAND              = 1443
        ERROR_INVALID_THREAD_ID               = 1444
        ERROR_NON_MDICHILD_WINDOW             = 1445
        ERROR_POPUP_ALREADY_ACTIVE            = 1446
        ERROR_NO_SCROLLBARS                   = 1447
        ERROR_INVALID_SCROLLBAR_RANGE         = 1448
        ERROR_INVALID_SHOWWIN_COMMAND         = 1449
        ERROR_NO_SYSTEM_RESOURCES             = 1450
        ERROR_NONPAGED_SYSTEM_RESOURCES       = 1451
        ERROR_PAGED_SYSTEM_RESOURCES          = 1452
        ERROR_WORKING_SET_QUOTA               = 1453
        ERROR_PAGEFILE_QUOTA                  = 1454
        ERROR_COMMITMENT_LIMIT                = 1455
        ERROR_MENU_ITEM_NOT_FOUND             = 1456
        ERROR_INVALID_KEYBOARD_HANDLE         = 1457
        ERROR_HOOK_TYPE_NOT_ALLOWED           = 1458
        ERROR_REQUIRES_INTERACTIVE_WINDOWSTATION = 1459
        ERROR_TIMEOUT                         = 1460
        ERROR_INVALID_MONITOR_HANDLE          = 1461
        ERROR_EVENTLOG_FILE_CORRUPT           = 1500
        ERROR_EVENTLOG_CANT_START             = 1501
        ERROR_LOG_FILE_FULL                   = 1502
        ERROR_EVENTLOG_FILE_CHANGED           = 1503
        ERROR_INVALID_TASK_NAME               = 1550
        ERROR_INVALID_TASK_INDEX              = 1551
        ERROR_THREAD_ALREADY_IN_TASK          = 1552
        ERROR_INSTALL_SERVICE_FAILURE         = 1601
        ERROR_INSTALL_USEREXIT                = 1602
        ERROR_INSTALL_FAILURE                 = 1603
        ERROR_INSTALL_SUSPEND                 = 1604
        ERROR_UNKNOWN_PRODUCT                 = 1605
        ERROR_UNKNOWN_FEATURE                 = 1606
        ERROR_UNKNOWN_COMPONENT               = 1607
        ERROR_UNKNOWN_PROPERTY                = 1608
        ERROR_INVALID_HANDLE_STATE            = 1609
        ERROR_BAD_CONFIGURATION               = 1610
        ERROR_INDEX_ABSENT                    = 1611
        ERROR_INSTALL_SOURCE_ABSENT           = 1612
        ERROR_INSTALL_PACKAGE_VERSION         = 1613
        ERROR_PRODUCT_UNINSTALLED             = 1614
        ERROR_BAD_QUERY_SYNTAX                = 1615
        ERROR_INVALID_FIELD                   = 1616
        ERROR_DEVICE_REMOVED                  = 1617
        ERROR_INSTALL_ALREADY_RUNNING         = 1618
        ERROR_INSTALL_PACKAGE_OPEN_FAILED     = 1619
        ERROR_INSTALL_PACKAGE_INVALID         = 1620
        ERROR_INSTALL_UI_FAILURE              = 1621
        ERROR_INSTALL_LOG_FAILURE             = 1622
        ERROR_INSTALL_LANGUAGE_UNSUPPORTED    = 1623
        ERROR_INSTALL_TRANSFORM_FAILURE       = 1624
        ERROR_INSTALL_PACKAGE_REJECTED        = 1625
        ERROR_FUNCTION_NOT_CALLED             = 1626
        ERROR_FUNCTION_FAILED                 = 1627
        ERROR_INVALID_TABLE                   = 1628
        ERROR_DATATYPE_MISMATCH               = 1629
        ERROR_UNSUPPORTED_TYPE                = 1630
        ERROR_CREATE_FAILED                   = 1631
        ERROR_INSTALL_TEMP_UNWRITABLE         = 1632
        ERROR_INSTALL_PLATFORM_UNSUPPORTED    = 1633
        ERROR_INSTALL_NOTUSED                 = 1634
        ERROR_PATCH_PACKAGE_OPEN_FAILED       = 1635
        ERROR_PATCH_PACKAGE_INVALID           = 1636
        ERROR_PATCH_PACKAGE_UNSUPPORTED       = 1637
        ERROR_PRODUCT_VERSION                 = 1638
        ERROR_INVALID_COMMAND_LINE            = 1639
        ERROR_INSTALL_REMOTE_DISALLOWED       = 1640
        ERROR_SUCCESS_REBOOT_INITIATED        = 1641
        ERROR_UNKNOWN_PATCH                   = 1647
        RPC_S_INVALID_STRING_BINDING          = 1700
        RPC_S_WRONG_KIND_OF_BINDING           = 1701
        RPC_S_INVALID_BINDING                 = 1702
        RPC_S_PROTSEQ_NOT_SUPPORTED           = 1703
        RPC_S_INVALID_RPC_PROTSEQ             = 1704
        RPC_S_INVALID_STRING_UUID             = 1705
        RPC_S_INVALID_ENDPOINT_FORMAT         = 1706
        RPC_S_INVALID_NET_ADDR                = 1707
        RPC_S_NO_ENDPOINT_FOUND               = 1708
        RPC_S_INVALID_TIMEOUT                 = 1709
        RPC_S_OBJECT_NOT_FOUND                = 1710
        RPC_S_ALREADY_REGISTERED              = 1711
        RPC_S_TYPE_ALREADY_REGISTERED         = 1712
        RPC_S_ALREADY_LISTENING               = 1713
        RPC_S_NO_PROTSEQS_REGISTERED          = 1714
        RPC_S_NOT_LISTENING                   = 1715
        RPC_S_UNKNOWN_MGR_TYPE                = 1716
        RPC_S_UNKNOWN_IF                      = 1717
        RPC_S_NO_BINDINGS                     = 1718
        RPC_S_NO_PROTSEQS                     = 1719
        RPC_S_CANT_CREATE_ENDPOINT            = 1720
        RPC_S_OUT_OF_RESOURCES                = 1721
        RPC_S_SERVER_UNAVAILABLE              = 1722
        RPC_S_SERVER_TOO_BUSY                 = 1723
        RPC_S_INVALID_NETWORK_OPTIONS         = 1724
        RPC_S_NO_CALL_ACTIVE                  = 1725
        RPC_S_CALL_FAILED                     = 1726
        RPC_S_CALL_FAILED_DNE                 = 1727
        RPC_S_PROTOCOL_ERROR                  = 1728
        RPC_S_UNSUPPORTED_TRANS_SYN           = 1730
        RPC_S_UNSUPPORTED_TYPE                = 1732
        RPC_S_INVALID_TAG                     = 1733
        RPC_S_INVALID_BOUND                   = 1734
        RPC_S_NO_ENTRY_NAME                   = 1735
        RPC_S_INVALID_NAME_SYNTAX             = 1736
        RPC_S_UNSUPPORTED_NAME_SYNTAX         = 1737
        RPC_S_UUID_NO_ADDRESS                 = 1739
        RPC_S_DUPLICATE_ENDPOINT              = 1740
        RPC_S_UNKNOWN_AUTHN_TYPE              = 1741
        RPC_S_MAX_CALLS_TOO_SMALL             = 1742
        RPC_S_STRING_TOO_LONG                 = 1743
        RPC_S_PROTSEQ_NOT_FOUND               = 1744
        RPC_S_PROCNUM_OUT_OF_RANGE            = 1745
        RPC_S_BINDING_HAS_NO_AUTH             = 1746
        RPC_S_UNKNOWN_AUTHN_SERVICE           = 1747
        RPC_S_UNKNOWN_AUTHN_LEVEL             = 1748
        RPC_S_INVALID_AUTH_IDENTITY           = 1749
        RPC_S_UNKNOWN_AUTHZ_SERVICE           = 1750
        EPT_S_INVALID_ENTRY                   = 1751
        EPT_S_CANT_PERFORM_OP                 = 1752
        EPT_S_NOT_REGISTERED                  = 1753
        RPC_S_NOTHING_TO_EXPORT               = 1754
        RPC_S_INCOMPLETE_NAME                 = 1755
        RPC_S_INVALID_VERS_OPTION             = 1756
        RPC_S_NO_MORE_MEMBERS                 = 1757
        RPC_S_NOT_ALL_OBJS_UNEXPORTED         = 1758
        RPC_S_INTERFACE_NOT_FOUND             = 1759
        RPC_S_ENTRY_ALREADY_EXISTS            = 1760
        RPC_S_ENTRY_NOT_FOUND                 = 1761
        RPC_S_NAME_SERVICE_UNAVAILABLE        = 1762
        RPC_S_INVALID_NAF_ID                  = 1763
        RPC_S_CANNOT_SUPPORT                  = 1764
        RPC_S_NO_CONTEXT_AVAILABLE            = 1765
        RPC_S_INTERNAL_ERROR                  = 1766
        RPC_S_ZERO_DIVIDE                     = 1767
        RPC_S_ADDRESS_ERROR                   = 1768
        RPC_S_FP_DIV_ZERO                     = 1769
        RPC_S_FP_UNDERFLOW                    = 1770
        RPC_S_FP_OVERFLOW                     = 1771
        RPC_X_NO_MORE_ENTRIES                 = 1772
        RPC_X_SS_CHAR_TRANS_OPEN_FAIL         = 1773
        RPC_X_SS_CHAR_TRANS_SHORT_FILE        = 1774
        RPC_X_SS_IN_NULL_CONTEXT              = 1775
        RPC_X_SS_CONTEXT_DAMAGED              = 1777
        RPC_X_SS_HANDLES_MISMATCH             = 1778
        RPC_X_SS_CANNOT_GET_CALL_HANDLE       = 1779
        RPC_X_NULL_REF_POINTER                = 1780
        RPC_X_ENUM_VALUE_OUT_OF_RANGE         = 1781
        RPC_X_BYTE_COUNT_TOO_SMALL            = 1782
        RPC_X_BAD_STUB_DATA                   = 1783
        ERROR_INVALID_USER_BUFFER             = 1784
        ERROR_UNRECOGNIZED_MEDIA              = 1785
        ERROR_NO_TRUST_LSA_SECRET             = 1786
        ERROR_NO_TRUST_SAM_ACCOUNT            = 1787
        ERROR_TRUSTED_DOMAIN_FAILURE          = 1788
        ERROR_TRUSTED_RELATIONSHIP_FAILURE    = 1789
        ERROR_TRUST_FAILURE                   = 1790
        RPC_S_CALL_IN_PROGRESS                = 1791
        ERROR_NETLOGON_NOT_STARTED            = 1792
        ERROR_ACCOUNT_EXPIRED                 = 1793
        ERROR_REDIRECTOR_HAS_OPEN_HANDLES     = 1794
        ERROR_PRINTER_DRIVER_ALREADY_INSTALLED = 1795
        ERROR_UNKNOWN_PORT                    = 1796
        ERROR_UNKNOWN_PRINTER_DRIVER          = 1797
        ERROR_UNKNOWN_PRINTPROCESSOR          = 1798
        ERROR_INVALID_SEPARATOR_FILE          = 1799
        ERROR_INVALID_PRIORITY                = 1800
        ERROR_INVALID_PRINTER_NAME            = 1801
        ERROR_PRINTER_ALREADY_EXISTS          = 1802
        ERROR_INVALID_PRINTER_COMMAND         = 1803
        ERROR_INVALID_DATATYPE                = 1804
        ERROR_INVALID_ENVIRONMENT             = 1805
        RPC_S_NO_MORE_BINDINGS                = 1806
        ERROR_NOLOGON_INTERDOMAIN_TRUST_ACCOUNT = 1807
        ERROR_NOLOGON_WORKSTATION_TRUST_ACCOUNT = 1808
        ERROR_NOLOGON_SERVER_TRUST_ACCOUNT    = 1809
        ERROR_DOMAIN_TRUST_INCONSISTENT       = 1810
        ERROR_SERVER_HAS_OPEN_HANDLES         = 1811
        ERROR_RESOURCE_DATA_NOT_FOUND         = 1812
        ERROR_RESOURCE_TYPE_NOT_FOUND         = 1813
        ERROR_RESOURCE_NAME_NOT_FOUND         = 1814
        ERROR_RESOURCE_LANG_NOT_FOUND         = 1815
        ERROR_NOT_ENOUGH_QUOTA                = 1816
        RPC_S_NO_INTERFACES                   = 1817
        RPC_S_CALL_CANCELLED                  = 1818
        RPC_S_BINDING_INCOMPLETE              = 1819
        RPC_S_COMM_FAILURE                    = 1820
        RPC_S_UNSUPPORTED_AUTHN_LEVEL         = 1821
        RPC_S_NO_PRINC_NAME                   = 1822
        RPC_S_NOT_RPC_ERROR                   = 1823
        RPC_S_UUID_LOCAL_ONLY                 = 1824
        RPC_S_SEC_PKG_ERROR                   = 1825
        RPC_S_NOT_CANCELLED                   = 1826
        RPC_X_INVALID_ES_ACTION               = 1827
        RPC_X_WRONG_ES_VERSION                = 1828
        RPC_X_WRONG_STUB_VERSION              = 1829
        RPC_X_INVALID_PIPE_OBJECT             = 1830
        RPC_X_WRONG_PIPE_ORDER                = 1831
        RPC_X_WRONG_PIPE_VERSION              = 1832
        RPC_S_GROUP_MEMBER_NOT_FOUND          = 1898
        EPT_S_CANT_CREATE                     = 1899
        RPC_S_INVALID_OBJECT                  = 1900
        ERROR_INVALID_TIME                    = 1901
        ERROR_INVALID_FORM_NAME               = 1902
        ERROR_INVALID_FORM_SIZE               = 1903
        ERROR_ALREADY_WAITING                 = 1904
        ERROR_PRINTER_DELETED                 = 1905
        ERROR_INVALID_PRINTER_STATE           = 1906
        ERROR_PASSWORD_MUST_CHANGE            = 1907
        ERROR_DOMAIN_CONTROLLER_NOT_FOUND     = 1908
        ERROR_ACCOUNT_LOCKED_OUT              = 1909
        OR_INVALID_OXID                       = 1910
        OR_INVALID_OID                        = 1911
        OR_INVALID_SET                        = 1912
        RPC_S_SEND_INCOMPLETE                 = 1913
        RPC_S_INVALID_ASYNC_HANDLE            = 1914
        RPC_S_INVALID_ASYNC_CALL              = 1915
        RPC_X_PIPE_CLOSED                     = 1916
        RPC_X_PIPE_DISCIPLINE_ERROR           = 1917
        RPC_X_PIPE_EMPTY                      = 1918
        ERROR_NO_SITENAME                     = 1919
        ERROR_CANT_ACCESS_FILE                = 1920
        ERROR_CANT_RESOLVE_FILENAME           = 1921
        RPC_S_ENTRY_TYPE_MISMATCH             = 1922
        RPC_S_NOT_ALL_OBJS_EXPORTED           = 1923
        RPC_S_INTERFACE_NOT_EXPORTED          = 1924
        RPC_S_PROFILE_NOT_ADDED               = 1925
        RPC_S_PRF_ELT_NOT_ADDED               = 1926
        RPC_S_PRF_ELT_NOT_REMOVED             = 1927
        RPC_S_GRP_ELT_NOT_ADDED               = 1928
        RPC_S_GRP_ELT_NOT_REMOVED             = 1929
        ERROR_KM_DRIVER_BLOCKED               = 1930
        ERROR_CONTEXT_EXPIRED                 = 1931
        ERROR_PER_USER_TRUST_QUOTA_EXCEEDED   = 1932
        ERROR_ALL_USER_TRUST_QUOTA_EXCEEDED   = 1933
        ERROR_USER_DELETE_TRUST_QUOTA_EXCEEDED = 1934
        ERROR_AUTHENTICATION_FIREWALL_FAILED = 1935
        ERROR_REMOTE_PRINT_CONNECTIONS_BLOCKED = 1936
        ERROR_INVALID_PIXEL_FORMAT            = 2000
        ERROR_BAD_DRIVER                      = 2001
        ERROR_INVALID_WINDOW_STYLE            = 2002
        ERROR_METAFILE_NOT_SUPPORTED          = 2003
        ERROR_TRANSFORM_NOT_SUPPORTED         = 2004
        ERROR_CLIPPING_NOT_SUPPORTED          = 2005
        ERROR_INVALID_CMM                     = 2010
        ERROR_INVALID_PROFILE                 = 2011
        ERROR_TAG_NOT_FOUND                   = 2012
        ERROR_TAG_NOT_PRESENT                 = 2013
        ERROR_DUPLICATE_TAG                   = 2014
        ERROR_PROFILE_NOT_ASSOCIATED_WITH_DEVICE = 2015
        ERROR_PROFILE_NOT_FOUND               = 2016
        ERROR_INVALID_COLORSPACE              = 2017
        ERROR_ICM_NOT_ENABLED                 = 2018
        ERROR_DELETING_ICM_XFORM              = 2019
        ERROR_INVALID_TRANSFORM               = 2020
        ERROR_COLORSPACE_MISMATCH             = 2021
        ERROR_INVALID_COLORINDEX              = 2022
        ERROR_CONNECTED_OTHER_PASSWORD        = 2108
        ERROR_BAD_USERNAME                    = 2202
        ERROR_USER_NOT_FOUND                  = 2221
        ERROR_NOT_CONNECTED                   = 2250
        ERROR_OPEN_FILES                      = 2401
        ERROR_ACTIVE_CONNECTIONS              = 2402
        ERROR_DEVICE_IN_USE                   = 2404
        ERROR_UNKNOWN_PRINT_MONITOR           = 3000

        ERROR_USER_DEFINED_BASE = 0xF000

        # Flags for FormatMessage function:

        FORMAT_MESSAGE_ALLOCATE_BUFFER   = 0x00000100
        FORMAT_MESSAGE_IGNORE_INSERTS    = 0x00000200
        FORMAT_MESSAGE_FROM_STRING       = 0x00000400
        FORMAT_MESSAGE_FROM_HMODULE      = 0x00000800
        FORMAT_MESSAGE_FROM_SYSTEM       = 0x00001000
        FORMAT_MESSAGE_ARGUMENT_ARRAY    = 0x00002000
        FORMAT_MESSAGE_MAX_WIDTH_MASK    = 0x000000FF

        # Set/GetErrorMode values:

        SEM_FAILCRITICALERRORS     = 0x0001
        SEM_NOALIGNMENTFAULTEXCEPT = 0x0004
        SEM_NOGPFAULTERRORBOX      = 0x0002
        SEM_NOOPENFILEERRORBOX     = 0x8000

        # Flags for LoadLibraryEx

        DONT_RESOLVE_DLL_REFERENCES = 0x00000001
        LOAD_IGNORE_CODE_AUTHZ_LEVEL = 0x00000010
        LOAD_LIBRARY_AS_DATAFILE = 0x00000002
        LOAD_LIBRARY_AS_DATAFILE_EXCLUSIVE = 0x00000040
        LOAD_LIBRARY_AS_IMAGE_RESOURCE = 0x00000020
        LOAD_LIBRARY_SEARCH_APPLICATION_DIR = 0x00000200
        LOAD_LIBRARY_SEARCH_DEFAULT_DIRS = 0x00001000
        LOAD_LIBRARY_SEARCH_DLL_LOAD_DIR = 0x00000100
        LOAD_LIBRARY_SEARCH_SYSTEM32 = 0x00000800
        LOAD_LIBRARY_SEARCH_USER_DIRS = 0x00000400
        LOAD_WITH_ALTERED_SEARCH_PATH = 0x00000008

        ###############################################
        # Win32 API Bindings
        ###############################################

        ffi_lib "kernel32", "user32"

=begin
DWORD WINAPI FormatMessage(
  __in      DWORD dwFlags,
  __in_opt  LPCVOID lpSource,
  __in      DWORD dwMessageId,
  __in      DWORD dwLanguageId,
  __out     LPTSTR lpBuffer,
  __in      DWORD nSize,
  __in_opt  va_list *Arguments
);
=end
        safe_attach_function :FormatMessageA, [:DWORD, :HANDLE, :DWORD, :DWORD, :LPTSTR, :DWORD, :varargs], :DWORD
        safe_attach_function :FormatMessageW, [:DWORD, :HANDLE, :DWORD, :DWORD, :LPWSTR, :DWORD, :varargs], :DWORD

=begin
DWORD WINAPI GetLastError(void);
=end
        safe_attach_function :GetLastError, [], :DWORD
=begin
void WINAPI SetLastError(
  __in  DWORD dwErrCode
);
=end
        safe_attach_function :SetLastError, [:DWORD], :void
        safe_attach_function :SetLastErrorEx, [:DWORD, :DWORD], :void
=begin
UINT WINAPI GetErrorMode(void);s
=end
        safe_attach_function :GetErrorMode, [], :uint
=begin
UINT WINAPI SetErrorMode(
  __in  UINT uMode
);
=end
        safe_attach_function :SetErrorMode, [:UINT], :UINT

=begin
https://msdn.microsoft.com/en-us/library/windows/desktop/ms684179(v=vs.85).aspx
HMODULE WINAPI LoadLibraryEx(
  _In_       LPCTSTR lpFileName,
  _Reserved_ HANDLE  hFile,
  _In_       DWORD   dwFlags
);
=end
        safe_attach_function :LoadLibraryExW, [:LPCTSTR, :HANDLE, :DWORD], :HANDLE

=begin
https://msdn.microsoft.com/en-us/library/windows/desktop/ms683152(v=vs.85).aspx
BOOL WINAPI FreeLibrary(
  _In_ HMODULE hModule
);
=end
        safe_attach_function :FreeLibrary, [:HANDLE], :BOOL
      end
    end
  end
end
