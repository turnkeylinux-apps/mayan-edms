WEBMIN_FW_TCP_INCOMING = 22 80 443 12321 12322

CREDIT_ANCHORTEXT = Turnkey Mayan EDMS Appliance

COMMON_OVERLAYS += adminer nginx
COMMON_CONF += adminer-pgsql adminer-nginx


# Include the PostgreSQL/PHP make file 
include $(FAB_PATH)/common/mk/turnkey/pgsql.mk
include $(FAB_PATH)/common/mk/turnkey/nginx.mk
include $(FAB_PATH)/common/mk/turnkey/php-fpm.mk
include $(FAB_PATH)/common/mk/turnkey.mk


