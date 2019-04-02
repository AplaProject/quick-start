#! /usr/bin/env bash

### Configuration ### begin ###

PREV_VERSION="0.9.2"
VERSION="0.9.3"
SED_E="sed -E"

USE_PRODUCT="apla"

if [ "$USE_PRODUCT" = "apla" ]; then
    PRODUCT_BRAND_NAME="Apla"
else
    PRODUCT_BRAND_NAME="Genesis"
fi

GOLANG_VER="1.11.5"
NODEJS_SETUP_SCRIPT_URL="https://deb.nodesource.com/setup_10.x"

BACKEND_BRANCH="1.2.7"
if [ "$USE_PRODUCT" = "apla" ]; then
    BACKEND_GO_URL="github.com/AplaProject/go-apla"
else
    BACKEND_GO_URL="github.com/AplaProject/go-apla"
fi

MAX_BLOCK_GENERATION_TIME=4000
GAP_BETWEEN_BLOCKS=8
MAX_NUM_OF_NODES=5

if [ "$USE_PRODUCT" = "apla" ]; then
    FAST_INSTALL_DATA_URL="https://github.com/blitzstern5/quick-start-data/raw/master/apla/0.9.3/apla-qs-0.9.3-fast-install-data-20190402133432-1-nodes.tar.gz"
    FAST_INSTALL_DATA_BASENAME="apla-qs-0.9.3-fast-install-data-20190402133432-1-nodes.tar.gz"
else
    FAST_INSTALL_DATA_URL="https://github.com/blitzstern5/quick-start-data/raw/master/genesis/0.9.3/genesis-qs-0.9.3-fast-install-data-20190402074118-1-nodes.tar.gz"
    FAST_INSTALL_DATA_BASENAME="genesis-qs-0.9.3-fast-install-data-20190402074118-1-nodes.tar.gz"
fi    

INITIAL_APPS_URLS[0]="https://github.com/AplaProject/apps/releases/download/v1.4.0/init_qs.json"
INITIAL_APPS_IMPORT_TIMEOUT_SECS[0]=70
INITIAL_APPS_IMPORT_MAX_TRIES[0]=70

APPS_URLS[0]="https://github.com/GenesisKernel/apps/releases/download/v1.4.0/system.json"
APPS_IMPORT_TIMEOUT_SECS[0]=280
APPS_IMPORT_MAX_TRIES[0]=280

APPS_URLS[1]="https://github.com/GenesisKernel/apps/releases/download/v1.4.0/conditions.json"
APPS_IMPORT_TIMEOUT_SECS[1]=100
APPS_IMPORT_MAX_TRIES[1]=100

APPS_URLS[2]="https://github.com/GenesisKernel/apps/releases/download/v1.4.0/basic.json"
APPS_IMPORT_TIMEOUT_SECS[2]=250
APPS_IMPORT_MAX_TRIES[2]=250

APPS_URLS[3]="https://github.com/GenesisKernel/apps/releases/download/v1.4.0/lang_res.json"
APPS_IMPORT_TIMEOUT_SECS[3]=705
APPS_IMPORT_MAX_TRIES[3]=705


ES_APPS_URLS[0]="https://raw.githubusercontent.com/AplaProject/apps/develop/ecosystem_apps/crediting.json"
ES_APPS_IMPORT_TIMEOUT_SECS[0]=406
ES_APPS_IMPORT_MAX_TRIES[0]=406

ES_APPS_URLS[1]="https://raw.githubusercontent.com/AplaProject/apps/develop/ecosystem_apps/land_registry.json"
ES_APPS_IMPORT_TIMEOUT_SECS[1]=407
ES_APPS_IMPORT_MAX_TRIES[1]=407

ES_APPS_URLS[2]="https://raw.githubusercontent.com/AplaProject/apps/develop/ecosystem_apps/token_sale.json"
ES_APPS_IMPORT_TIMEOUT_SECS[2]=408
ES_APPS_IMPORT_MAX_TRIES[2]=408

DEMO_APPS_URL="https://github.com/GenesisKernel/apps/releases/download/v1.3.0/system.json"

DEV_BE_GO_URL="github.com/AplaProject/go-apla"
DEV_BE_BRANCH="master"
DEV_BE_CREATE_GO_URL_VENDOR_SYMLINK="yes"
DEV_BE_GO_URL_VENDOR_SRC="github.com/blitzstern5"
DEV_BE_GO_URL_VENDOR_DST="github.com/GenesisKernel"

if [ "$USE_PRODUCT" = "apla" ]; then
    FRONTEND_REPO_URL="https://github.com/AplaProject/apla-front"
else
    FRONTEND_REPO_URL="https://github.com/GenesisKernel/genesis-front"
fi
FRONTEND_BRANCH="v0.11.1"

SCRIPTS_REPO_URL="https://github.com/blitzstern5/genesis-scripts"
SCRIPTS_BRANCH="v0.2.4"

DB_USER="postgres"
if [ "$USE_PRODUCT" = "apla" ]; then
    DB_NAME_PREFIX="apla"
    DB_HOST="apla-db"
    DB_PASSWORD="apla"
    CENT_URL="http://apla-cf:8000"

    BLEX_REPO_URL="https://github.com/AplaProject/blockexplorer"
    BLEX_DB_NAME_PREFIX="apla_blex_"
    BLEX_REDIS_URL="redis://apla-rq:6379/0"
    BE_API_URL_PREFIX="http://apla-bf"
else
    DB_NAME_PREFIX="genesis"
    DB_HOST="genesis-db"
    DB_PASSWORD="genesis"
    CENT_URL="http://genesis-cf:8000"

    BLEX_REPO_URL="https://github.com/GenesisKernel/blockexplorer"
    BLEX_DB_NAME_PREFIX="genesis_blex_"
    BLEX_REDIS_URL="redis://genesis-rq:6379/0"
    BE_API_URL_PREFIX="http://genesis-bf"
fi
BLEX_BRANCH="v0.3.2"
BLEX_DB_HOST="$DB_HOST"
BLEX_DB_USER="$DB_USER"
BLEX_DB_PASSWORD="$DB_PASSWORD"

BE_ROOT="/genesis-back"
BE_ROOT_LOG_DIR="/var/log/go-genesis"
BE_ROOT_DATA_DIR="$BE_ROOT/data"
BE_BIN_DIR="$BE_ROOT/bin"
BE_BIN_BASENAME="go-apla"
BE_BIN_PATH="$BE_BIN_DIR/$BE_BIN_BASENAME"

FE_SRC_DIR="/genesis-front"

SCRIPTS_DIR="/genesis-scripts"
APPS_DIR="/genesis-apps"

DB_PORT=15432
CF_PORT=18100
BLEX_PORT=18200
WEB_PORT_SHIFT=8300
CLIENT_PORT_SHIFT=17300

CONT_DB_PORT=5432
CONT_CF_PORT=8000
CONT_BLEX_PORT=8000
CONT_WEB_PORT_SHIFT=80
CONT_CLIENT_PORT_SHIFT=7000

REDIS_HOST_PORT=16379
REDIS_CONT_PORT=6379

DOWNLOADS_DIR='$HOME/Downloads' # !!! USE SINGLE QUOTES HERE !!!
APPLICATIONS_DIR='$HOME/Applications' # !!! USE SINGLE QUOTES HERE !!!

DOCKER_APP_NAME="Docker"
DOCKER_DMG_DL_URL="https://download.docker.com/mac/stable/Docker.dmg"
DOCKER_DMG_BASENAME="$(basename "$(echo "$DOCKER_DMG_DL_URL" | $SED_E -n 's/^(.*\.dmg)(\?[^?]*)?$/\1/gp')")"
DOCKER_MAC_APP_DIR_SIZE_M=1248 # to update run 'du -sm /Applications/Docker.app'
DOCKER_MAC_APP_DIR="/Applications/Docker.app"
DOCKER_MAC_APP_BIN="/Applications/Docker.app/Contents/MacOS/Docker"

if [ "$USE_PRODUCT" = "apla" ]; then
    CLIENT_MAC_PROCESS_NAME="Apla"
    CLIENT_LINUX_PROCESS_NAME="apla-front"
    CLIENT_APP_NAME="Apla"
    CLIENT_DMG_DL_URL="https://github.com/AplaProject/apla-front/releases/download/v0.11.1/Apla-0.11.1.dmg"
    CLIENT_MAC_APP_DIR_SIZE_M=246 # to update run 'du -sm /Applications/Genesis.app'
    CLIENT_MAC_APP_DIR="/Applications/Apla.app"
    CLIENT_MAC_APP_BIN="/Applications/Apla.app/Contents/MacOS/Apla"
    CLIENT_APPIMAGE_DL_URL="https://github.com/AplaProject/apla-front/releases/download/v0.11.1/apla-front-0.11.1-x86_64.AppImage"
else
    CLIENT_MAC_PROCESS_NAME="Genesis"
    CLIENT_LINUX_PROCESS_NAME="genesis-front"
    CLIENT_APP_NAME="Genesis"
    CLIENT_DMG_DL_URL="https://github.com/GenesisKernel/genesis-front/releases/download/v0.11.1/Genesis-0.11.1.dmg"
    CLIENT_MAC_APP_DIR_SIZE_M=246 # to update run 'du -sm /Applications/Genesis.app'
    CLIENT_MAC_APP_DIR="/Applications/Genesis.app"
    CLIENT_MAC_APP_BIN="/Applications/Genesis.app/Contents/MacOS/Genesis"
    CLIENT_APPIMAGE_DL_URL="https://github.com/GenesisKernel/genesis-front/releases/download/v0.11.1/genesis-front-0.11.1-x86_64.AppImage"
fi
CLIENT_DMG_BASENAME="$(basename "$(echo "$CLIENT_DMG_DL_URL" | $SED_E -n 's/^(.*\.dmg)(\?[^?]*)?$/\1/gp')")"
CLIENT_APPIMAGE_BASENAME="$(basename "$(echo "$CLIENT_APPIMAGE_DL_URL" | $SED_E -n 's/^(.*\.AppImage)(\?[^?]*)?$/\1/gp')")"

if [ "$USE_PRODUCT" = "apla" ]; then
    BF_CONT_NAME="apla-bf"
    BF_CONT_IMAGE="str16071985/apla-bf:$VERSION"
    BF_CONT_PREV_IMAGE="str16071985/apla-bf:$PREV_VERSION"
    BF_CONT_BUILD_DIR="apla-bf"
else
    BF_CONT_NAME="genesis-bf"
    BF_CONT_IMAGE="str16071985/genesis-bf:$VERSION"
    BF_CONT_PREV_IMAGE="str16071985/genesis-bf:$PREV_VERSION"
    BF_CONT_BUILD_DIR="genesis-bf"
fi
TRY_LOCAL_BF_CONT_NAME_ON_RUN="yes"

if [ "$USE_PRODUCT" = "apla" ]; then
    DB_CONT_NAME="apla-db"
    DB_CONT_IMAGE="str16071985/apla-db:$VERSION"
    DB_CONT_PREV_IMAGE="str16071985/apla-db:$PREV_VERSION"
    DB_CONT_BUILD_DIR="apla-db"
else
    DB_CONT_NAME="genesis-db"
    DB_CONT_IMAGE="str16071985/genesis-db:$VERSION"
    DB_CONT_PREV_IMAGE="str16071985/genesis-db:$PREV_VERSION"
    DB_CONT_BUILD_DIR="genesis-db"
fi
TRY_LOCAL_DB_CONT_NAME_ON_RUN="yes"

if [ "$USE_PRODUCT" = "apla" ]; then
    CF_CONT_NAME="apla-cf"
    CF_CONT_IMAGE="str16071985/apla-cf:$VERSION"
    CF_CONT_PREV_IMAGE="str16071985/apla-cf:$PREV_VERSION"
    CF_CONT_BUILD_DIR="apla-cf"
else
    CF_CONT_NAME="genesis-cf"
    CF_CONT_IMAGE="str16071985/genesis-cf:$VERSION"
    CF_CONT_PREV_IMAGE="str16071985/genesis-cf:$PREV_VERSION"
    CF_CONT_BUILD_DIR="genesis-cf"
fi
TRY_LOCAL_CF_CONT_NAME_ON_RUN="yes"

if [ "$USE_PRODUCT" = "apla" ]; then
    BLEX_CONT_NAME="apla-blex"
    BLEX_CONT_IMAGE="str16071985/apla-blex:$VERSION"
    BLEX_CONT_PREV_IMAGE="str16071985/apla-blex:$PREV_VERSION"
    BLEX_CONT_BUILD_DIR="apla-blex"
else
    BLEX_CONT_NAME="genesis-blex"
    BLEX_CONT_IMAGE="str16071985/genesis-blex:$VERSION"
    BLEX_CONT_PREV_IMAGE="str16071985/genesis-blex:$PREV_VERSION"
    BLEX_CONT_BUILD_DIR="genesis-blex"
fi
TRY_LOCAL_BLEX_CONT_NAME_ON_RUN="yes"

if [ "$USE_PRODUCT" = "apla" ]; then
    BE_CONT_NAME="apla-be"
    BE_CONT_IMAGE="str16071985/apla-be:$VERSION"
    BE_CONT_PREV_IMAGE="str16071985/apla-be:$PREV_VERSION"
    BE_CONT_BUILD_DIR="apla-be"
else
    BE_CONT_NAME="genesis-be"
    BE_CONT_IMAGE="str16071985/genesis-be:$VERSION"
    BE_CONT_PREV_IMAGE="str16071985/genesis-be:$PREV_VERSION"
    BE_CONT_BUILD_DIR="genesis-be"
fi
TRY_LOCAL_BE_CONT_NAME_ON_RUN="yes"

if [ "$USE_PRODUCT" = "apla" ]; then
    FE_CONT_NAME="apla-fe"
    FE_CONT_IMAGE="str16071985/apla-fe:$VERSION"
    FE_CONT_PREV_IMAGE="str16071985/apla-fe:$PREV_VERSION"
    FE_CONT_BUILD_DIR="apla-fe"
else
    FE_CONT_NAME="genesis-fe"
    FE_CONT_IMAGE="str16071985/genesis-fe:$VERSION"
    FE_CONT_PREV_IMAGE="str16071985/genesis-fe:$PREV_VERSION"
    FE_CONT_BUILD_DIR="genesis-fe"
fi
TRY_LOCAL_FE_CONT_NAME_ON_RUN="yes"

if [ "$USE_PRODUCT" = "apla" ]; then
    RQ_CONT_NAME="apla-rq"
    RQ_CONT_IMAGE="str16071985/apla-rq:$VERSION"
    RQ_CONT_PREV_IMAGE="str16071985/apla-rq:$PREV_VERSION"
    RQ_CONT_BUILD_DIR="apla-rq"
else
    RQ_CONT_NAME="genesis-rq"
    RQ_CONT_IMAGE="str16071985/genesis-rq:$VERSION"
    RQ_CONT_PREV_IMAGE="str16071985/genesis-rq:$PREV_VERSION"
    RQ_CONT_BUILD_DIR="genesis-rq"
fi
TRY_LOCAL_RQ_CONT_NAME_ON_RUN="yes"


FORCE_COPY_IMPORT_DEMO_APPS_SCRIPTS="no"
FORCE_COPY_UPDATE_SYS_PARAMS_SCRIPTS="no"
FORCE_COPY_UPDATE_KEYS_SCRIPTS="no"
FORCE_REQUIREMENTS_INSTALL="no"
FORCE_COPY_MBS_SCRIPT="no"
FORCE_COPY_MBLEX_SCRIPT="no"

EMPTY_ENV_VARS="yes"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DOTENV_PATH="$SCRIPT_DIR/.env"

### Configuration #### end ####


### .env ### begin ###

[ -e "$DOTENV_PATH" ] && . "$DOTENV_PATH"

### .env #### end ####


### OS ### begin ###

get_os_type() {
    case "$OSTYPE" in
        linux*)   echo "linux" ;;
        darwin*)  echo "mac" ;; 
        win*)     echo "windows" ;;
        cygwin*)  echo "cygwin" ;;
        bsd*)     echo "bsd" ;;
        solaris*) echo "solaris" ;;
        *)        echo "unknown" ;;
    esac
}

get_linux_dist() {
    local arch; arch=$(uname -m)
    local kernel; kernel=$(uname -r)
    local dist
    if [ -n "$(command -v lsb_release)" ]; then
        dist=$(lsb_release -is)
    elif [ -f "/etc/os-release" ]; then
        dist=$(grep PRETTY_NAME /etc/os-release | sed 's/PRETTY_NAME=//g' | tr -d '="')
    elif [ -f "/etc/debian_version" ]; then
        dist="Debian $(cat /etc/debian_version)"
    elif [ -f "/etc/redhat-release" ]; then
        dist=$(cat /etc/redhat-release)
    else
        dist="$(uname -s) $(uname -r)"
    fi
    if [ "$(cat /etc/issue | head -1 | awk {'print $2'})" = "Mint" ]; then
        echo "mint"
    else
        [ -n "$dist" ] && echo "$dist"
    fi
}

is_root() {
    [ "$EUID" -eq 0 ] && return 0 || return 1
}

check_run_as_root() {
    local os_type; os_type="$(get_os_type)"
    case $os_type in
        linux)
            is_root;
            if [ $? -ne 0 ]; then
                echo "Please run with sudo or as root" 
                exit 20
            fi
            ;;
        mac)
            is_root;
            if [ $? -eq 0 ]; then
                echo "Please run as regular user (don't use sudo)"
                exit 21
            fi
            ;;
        *)
            echo "Sorry, but $os_type is not supported yet"
            exit 23
            ;;
    esac
}

run_as_orig_user() {
    local cmd
    is_root;
    if [ $? -eq 0 ]; then
        local who_user; who_user="$(who -m | awk '{print $1}')"
        local orig_user
        if [ -n "$SUDO_USER" ]; then
            orig_user="$SUDO_USER"
        elif [ -n "$who_user" ]; then
            orig_user="$who_user"
        else
            orig_user=""
        fi
        if [ -n "$orig_user" ]; then
            cmd="su - $orig_user -c '$@'"
        else
            cmd="su - -c '$@'"
        fi
    else
        cmd="$@"
    fi
    eval "$cmd"
}

get_orig_user_homedir() {
    run_as_orig_user 'echo $HOME'
}

check_min_req() {
    local cmd; local cmds;
    local os_type; os_type="$(get_os_type)"
    case $os_type in
        linux|mac)
            cmds="lsof curl sed awk grep cat"
            for cmd in $cmds; do
                [ -z "$(command -v $cmd)" ] \
                    && echo "Command '$cmd' not found" && return 1
            done
            ;;

        *)
            echo "Sorry, but $os_type is not supported yet"
            return 10
            ;;
    esac
}

check_requirements() {
    check_curl_avail
    check_docker_avail
}

check_proc() {
    [ -z "$1" ] && echo "Process name isn't set" && return 2
    [ -z "$(pgrep "$1")" ] \
        && echo "No process '$1'" && return 2
    echo "ok" && return 0
}

check_num_of_procs() {
    local proc_name num_of
    [ -z "$1" ] && echo "Process name isn't set" && return 2
    [ -z "$(pgrep "$1")" ] \
        && echo "No process '$1'" && return 2
    echo "ok" && return 0
}

wait_proc() {
    local proc_name; proc_name="$1"
    local timeout_secs; [ -z "$2" ] && timeout_secs=15 || timeout_secs="$2"
    local end_time; end_time=$(( $(date +%s) + timeout_secs ))

    echo "Waiting ($timeout_secs seconds) for process '$proc_name' ..."

    local cnt; cnt=1
    local stop; stop=0;
    local result; result=0;
    while [ $stop -eq 0 ]; do
        [ $cnt -gt 1 ] && sleep 1
        echo -n "    try $cnt: "
        check_proc "$proc_name"; result=$?
        case $result in
            0|1) stop=1 ;;
            2) [ $(date +%s) -lt $end_time ] || stop=1 ;;
        esac
        cnt=$(expr $cnt + 1)
    done
    return $result
}

### OS #### end ####


### Disk, FS ### begin ###

get_mac_fs_type_by_path() {
    local path; path="$1"
    local dev; local mp
    eval $(df "$path"| tail -n +2 | awk '{print "dev=\""$1"\"; mp=\""$9"\";"}')
    mount | grep "$dev on $mp" | $SED_E -n 's/^[^\(]+\(([^,]+).*$/\1/p'
}

### Disk, FS #### end ####


### Host ports ### begin ###

get_host_port_proc() {
    lsof -i :$1 | grep LISTEN | awk '{print $1}'
}

check_host_ports() {
    local num; num=$1;
    ([ -z "$num" ] || [ $num -lt 1 ]) \
        && echo "The number of clients/backends is not set" \
        && return 1
    local wps; wps=$2; [ -z "$wps" ] && wps=$WEB_PORT_SHIFT
    local cps; cps=$3; [ -z "$cps" ] && cps=$CLIENT_PORT_SHIFT
    local d_port; d_port=$4; [ -z "$d_port" ] && d_port=$DB_PORT
    local cfp; cfp=$CF_PORT # FIXME: Change to argument
    local blexp; blexp=$BLEX_PORT # FIXME: Change to argument
    local redisp; redisp=$REDIS_HOST_PORT # FIXME: Change to argument

    local result; result=0

    echo -n "Checking database port $d_port: "
    if [ -n "$(get_host_port_proc $d_port)" ]; then
        echo "BUSY"
        result=2
    else
        echo "FREE"
    fi

    echo -n "Checking centrifugo port $cfp: "
    if [ -n "$(get_host_port_proc $cfp)" ]; then
        echo "BUSY"
        result=5
    else
        echo "FREE"
    fi

    echo -n "Checking redis port $redisp: "
    if [ -n "$(get_host_port_proc $redisp)" ]; then
        echo "BUSY"
        result=2
    else
        echo "FREE"
    fi

    echo -n "Checking block explorer port $blexp: "
    if [ -n "$(get_host_port_proc $blexp)" ]; then
        echo "BUSY"
        result=5
    else
        echo "FREE"
    fi

    local i w_port c_port run_cmd
    for i in $(seq 1 $num); do
        w_port=$(expr $i + $wps)
        c_port=$(expr $i + $cps)
        echo -n "Checking web port $w_port: "
        if [ -n "$(get_host_port_proc $w_port)" ]; then
            echo "BUSY"
            result=3
        else
            echo "FREE"
        fi
        echo -n "Checking client port $c_port: "
        if [ -n "$(get_host_port_proc $c_port)" ]; then
            echo "BUSY"
            result=4
        else
            echo "FREE"
        fi
    done
    return $result
}

### Host ports #### end #####


### Download/install ### begin ###

update_global_home_var() {
    local home; home="$(get_orig_user_homedir)"
    HOME="$home"
}

update_global_downloads_and_apps_dir_vars() {
    local home; home="$(get_orig_user_homedir)"
    local home_esc; home_esc="$(echo "$home" | $SED_E 's/\//\\\//g')"
    DOWNLOADS_DIR="$(echo "$DOWNLOADS_DIR" | $SED_E "s/\\\$HOME/$home_esc/g")"
    APPLICATIONS_DIR="$(echo "$APPLICATIONS_DIR" | $SED_E "s/\\\$HOME/$home_esc/g")"
}

create_downloads_dir() {
    [ -d "$DOWNLOADS_DIR" ] && return 0
    run_as_orig_user "mkdir -p '$DOWNLOADS_DIR'"
}

create_apps_dir() {
    [ -d "$APPLICATIONS_DIR" ] && return 0
    run_as_orig_user "mkdir -p '$APPLICATIONS_DIR'"
}

get_app_dir_size_m() {
    [  -d "$1" ] &&  du -sm "$1" | awk '{print $1}' || echo 0
}

download_and_check_dmg() {
    check_curl_avail
    local dmg_url; dmg_url="$1"
    local dmg_basename; dmg_basename="$2"
    local result
    (
        update_global_downloads_and_apps_dir_vars

        local dmg_path; dmg_path="$DOWNLOADS_DIR/$dmg_basename"
        echo "1 dmg_path: $dmg_path"
        [ -f "$dmg_path" ] \
            && mv "$dmg_path" "$dmg_path.bak.$(date "+%Y%m%d%H%M%S")"
        create_downloads_dir \
            && echo "Downloading $app_name ..." \
            && curl -L -o "$dmg_path" "$dmg_url"
    ); result=$?
    case $result in
        77)
            echo
            echo "To fix this error you need to update CA certificate file."
            echo "Please read ISSUES.md 'curl: (77) SSL: can't load CA certificate file' section"
            echo "See also https://curl.haxx.se/docs/sslcerts.html for details."
            echo "See also https://curl.haxx.se/docs/caextract.html for download URLs."
            echo
            return $result
            ;;
        0) echo "$dmg_path" ;;
        *) return $result ;;
    esac
}

download_and_install_dmg() {
    check_curl_avail
    local app_bin; app_bin="$1"
    local app_dir; app_dir="$2"
    local dmg_url; dmg_url="$3"
    local dmg_basename; dmg_basename="$4"
    local app_name; app_name="$5"
    local exp_size_m; exp_size_m=$6

    local timeout_secs; timeout_secs="380"

    local result; result=0

    if [ ! -f "$app_bin" ]; then
        (
            update_global_downloads_and_apps_dir_vars

            local dmg_path; dmg_path="$DOWNLOADS_DIR/$dmg_basename"
            if [ ! -f "$dmg_path" ]; then
                create_downloads_dir \
                    && echo "Downloading $app_name ..." \
                    && curl -L -o "$dmg_path" "$dmg_url" && open "$dmg_path"
            else
                open "$dmg_path"
            fi
        ); result=$?
        case $result in
            77)
                echo
                echo "To fix this error you need to update CA certificate file."
                echo "Please read ISSUES.md 'curl: (77) SSL: can't load CA certificate file' section"
                echo "See also https://curl.haxx.se/docs/sslcerts.html for details."
                echo "See also https://curl.haxx.se/docs/caextract.html for download URLs."
                echo
                return $result
                ;;
            0) : ;;
            *) return $result ;;
        esac
        local end_time; end_time=$(( $(date +%s) + timeout_secs ))
        local stop; stop=0
        local cnt; cnt=0
        while [ $stop -eq 0 ]; do
            echo "Please move $app_name to Applications"
            [ -f "$app_bin" ] && stop=1
            [ $(date +%s) -lt $end_time ] || stop=2
            [ $cnt -ge 0 ] && sleep 1
        done
        case $stop in 
            2) echo "Waiting time for $app_name is out" && return 11
        esac

        echo "$app_name is copying to Applications. Please wait (timeout: $timeout_secs seconds) ..."
        end_time=$(( $(date +%s) + timeout_secs ))
        stop=0
        while [ $stop -eq 0 ]; do
            [ $(get_app_dir_size_m "$app_dir") -ge $exp_size_m ] \
                && stop=1
            read -n 1 -s -t 1 answ
            if [ $? -eq 0 ] && [ "${answ%\\n}" = "s" ]; then
                echo "You did input: '$answ'"
                stop=2
            fi
            [ $(date +%s) -lt $end_time ] || stop=3
            echo "Wait until the copying is complete or press 's' key to skip this waiting"
        done
        case $stop in
            1)
                echo "$app_name installed"
                result=0
                ;;
            2)
                echo "$app_name probably installed (you skipped waiting)"
                result=21
                ;;
            3)
                echo "$app_name probably installed (there was a timeout)"
                result=22
                ;;
        esac
    fi
    return $result
}

download_fast_install_data() {
    check_curl_avail
    local data_url; data_url="$1"
    local data_path; data_path="$2"
    local result 
    echo "Downloading fast install data from '$data_url' to '$data_path' ..."
    curl -L -o "$data_path" "$data_url"
    result=$?
    case $result in
        77)
            echo
            echo "To fix this error you need to update CA certificate file."
            echo "Please read ISSUES.md 'curl: (77) SSL: can't load CA certificate file' section"
            echo "See also https://curl.haxx.se/docs/sslcerts.html for details."
            echo "See also https://curl.haxx.se/docs/caextract.html for download URLs."
            echo
            return $result
            ;;
        0) echo "$data_path" ;;
        *) return $result ;;
    esac
}

### Download/install #### end ####


### Docker ### begin ###

install_mac_docker_directly() {
    download_and_install_dmg "$DOCKER_MAC_APP_BIN" "$DOCKER_MAC_APP_DIR" "$DOCKER_DMG_DL_URL" "$DOCKER_DMG_BASENAME" "$DOCKER_APP_NAME" $DOCKER_MAC_APP_DIR_SIZE_M
}

install_linux_docker() {
    [ -n "$(command -v docker)" ] && return 0

    local dist; dist="$1"

    case "$dist" in
        [Ff][Ee][Dd][Oo][Rr][Aa])
            dnf -y install dnf-plugins-core
            dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
            dnf -y install docker-ce lsof
            systemctl start docker && systemctl enable docker
            ;;

        [Cc][Ee][Nn][Tt][Oo][Ss])
            ;;

        [Dd][Ee][Bb][Ii][Aa][Nn])
            apt-get update -y --fix-missing
            apt-get install -y \
                apt-transport-https \
                ca-certificates \
                curl \
                gnupg2 \
                software-properties-common
            curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add -
            apt-key fingerprint 0EBFCD88
            add-apt-repository \
                "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
                $(lsb_release -cs) \
                stable"
            apt-get update -y
            apt-get install docker-ce lsof -y
            systemctl start docker &&  systemctl enable docker
            ;;

        [Uu][Bb][Uu][Nn][Tt][Uu])
            apt-get update -y --fix-missing
            apt-get install -y \
                apt-transport-https \
                ca-certificates \
                curl \
                software-properties-common
            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
            apt-key fingerprint 0EBFCD88
            add-apt-repository \
                "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
                $(lsb_release -cs) \
                stable"
            apt-get update -y
            apt-get install docker-ce lsof -y
            systemctl start docker &&  systemctl enable docker
            ;;

        [Mm][Ii][Nn][Tt])
            apt-get update -y --fix-missing
            apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
            --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
            apt-add-repository \
                'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
            apt-get update -y
            apt-get install docker.io lsof -y
            systemctl start docker &&  systemctl enable docker
            ;;
    esac
}

install_docker() {
    local os_type; os_type="$(get_os_type)"
    case $os_type in
        mac)
            install_mac_docker_directly
            ;;

        linux)
            install_linux_docker
            ;;

        *)
            echo "Sorry, but $os_type is not supported yet"
            return 10
            ;;
    esac
}

uninstall_mac_docker() {
    if [ "${USER}" != "root" ]; then
        echo "Please run this command with sudo or as root"
    	return 2
    fi

    if [ -e "$DOCKER_MAC_APP_BIN" ]; then
        $DOCKER_MAC_APP_BIN --uninstall
    fi
    
    if [ -n "$(command -v  docker-machine)" ]; then
        while true; do
            read -p "Remove all $DOCKER_APP_NAME Machine VMs? (Y/N): " yn
            case $yn in
                [Yy]* ) docker-machine rm -f $(docker-machine ls -q); break ;;
                [Nn]* ) break ;;
                * ) echo "Please answer yes or no."; exit 1;;
            esac
        done
    fi
    
    echo "Removing $DOCKER_APP_NAME from Applications..."
    [ -e "$DOCKER_MAC_APP_DIR" ] \
        && rm -rf "$DOCKER_MAC_APP_DIR"
    
    echo "Removing $DOCKER_APP_NAME binaries..."
    [ -e /usr/local/bin/docker ] \
        && rm -f /usr/local/bin/docker
    [ -e /usr/local/bin/docker-machine ] \
        && rm -f /usr/local/bin/docker-machine
    find /usr/local/bin -name 'docker-machine-driver*' -delete
    [ -e /usr/local/bin/docker-compose ] \
        && rm -f /usr/local/bin/docker-compose
    
    echo "Removing boot2docker.iso"
    [ -e /usr/local/share/boot2docker ] \
        && rm -rf /usr/local/share/boot2docker
    
    echo "Forget packages"
    pkgutil --forget io.docker.pkg.docker
    pkgutil --forget io.docker.pkg.dockercompose
    pkgutil --forget io.docker.pkg.dockermachine
    pkgutil --forget io.boot2dockeriso.pkg.boot2dockeriso
   
    local pids; pids="$(pgrep docker)" 
    [ -n "$pids" ] && echo "Terminating docker processes ..." \
        && kill $pids

    echo "$DOCKER_APP_NAME completely removed"
}

uninstall_docker() {
    local os_type; os_type="$(get_os_type)"
    case $os_type in
        mac)
            uninstall_mac_docker
            ;;
        *)
            echo "Sorry, but $os_type is not supported yet"
            return 10
            ;;
    esac
}

check_docker_ready_status() {
    [ -z "$(command -v docker)" ] && return 100
    docker ps -a 1>&2>/dev/null
}

wait_docker_ready_status() {
    local timeout_secs; [ -z "$1" ] && timeout_secs=15 || timeout_secs=$1
    local end_time; end_time=$(( $(date +%s) + timeout_secs ))

    echo "Waiting ($timeout_secs seconds) for docker daemon ready status ..."

    local cnt; cnt=1
    local stop; stop=0;
    local result; result=0;
    while [ $stop -eq 0 ]; do
        [ $cnt -gt 1 ] && sleep 1
        echo -n "    try $cnt: "
        check_docker_ready_status; result=$?
        case $result in
            0) stop=1; echo "ok" ;;
            *) [ $(date +%s) -lt $end_time ] || stop=1 ;;
        esac
        cnt=$(expr $cnt + 1)
    done
    return $result
}

check_mac_docker_proc() {
    local docker_vmnet_pid pid exists
    docker_vmnet_pid="$(pgrep com.docker.vmnet)"
    exists=1
    for pid in $(pgrep "docker"); do
        [ "$pid" == "$docker_vmnet_pid" ] && continue
        exists=0
    done
    case $exists in
        1) echo "no docker process" ;;
        0) echo "ok" ;;
    esac
    return $exists
}

wait_mac_docker_proc() {
    local timeout_secs; [ -z "$1" ] && timeout_secs=15 || timeout_secs="$1"
    local end_time; end_time=$(( $(date +%s) + timeout_secs ))

    echo "Waiting ($timeout_secs seconds) for docker process ..."

    local cnt; cnt=1
    local stop; stop=0;
    local result; result=0;
    while [ $stop -eq 0 ]; do
        [ $cnt -gt 1 ] && sleep 1
        echo -n "    try $cnt: "
        check_mac_docker_proc; result=$?
        case $result in
            0) stop=1 ;;
            1) [ $(date +%s) -lt $end_time ] || stop=1 ;;
        esac
        cnt=$(expr $cnt + 1)
    done
    return $result
}

start_mac_docker() {
    install_mac_docker_directly
    [ $? -ne 0 ] \
        && echo "Can't download docker" && return 1
    if ! check_mac_docker_proc > /dev/null; then
        echo "Docker process is absent. Starting ..."
        open "$DOCKER_MAC_APP_DIR"
    fi
    wait_mac_docker_proc 120
    [ $? -ne 0 ] \
        && echo "No docker process. Please reinstall docker." \
        && echo "You can use $(basename "$0") uninstall-docker to uninstall docker" \
        && return 10
    wait_docker_ready_status 120
    [ $? -ne 0 ] \
        && echo "Docker daemon isn't ready. Please reinstall docker." \
        && echo "You can use $(basename "$0") uninstall-docker to uninstall docker" \
        && return 11
    echo "Docker ready"
    return 0
}

start_linux_docker() {
    install_linux_docker "$(get_linux_dist)"
    [ -n "$(command -v docker)" ] && return 0
}

start_docker() {
    local os_type; os_type="$(get_os_type)"
    case $os_type in
        linux)
            start_linux_docker
            ;;
        mac)
            start_mac_docker
            ;;
        *)
            echo "Sorry, but $os_type is not supported yet"
            exit 30
            ;;
    esac
}

check_docker_avail() {
    [ -n "$(command -v docker)" ] && return 0
    local os_type; os_type="$(get_os_type)"
    case $os_type in
        linux)
            start_linux_docker
            ;;
        mac)
            start_mac_docker
            ;;
        *)
            echo "Sorry, but $os_type is not supported yet"
            exit 30
            ;;
    esac
}

### Docker #### end ####


### Client ### begin ###

check_curl_avail() {
    [ -n "$(command -v curl)" ] && return 0
    local os_type; os_type="$(get_os_type)"
    case $os_type in
        linux|mac)
            echo "Please install curl first"
            exit 31
            ;;
        *)
            echo "Sorry, but $os_type is not supported yet"
            exit 30
            ;;
    esac
}

install_mac_client_directly() {
    download_and_install_dmg "$CLIENT_MAC_APP_BIN" "$CLIENT_MAC_APP_DIR" "$CLIENT_DMG_DL_URL" "$CLIENT_DMG_BASENAME" "$CLIENT_APP_NAME" $CLIENT_MAC_APP_DIR_SIZE_M
}

uninstall_mac_client() {
    if [ "${USER}" != "root" ]; then
        echo "Please run this command with sudo or as root"
    	return 2
    fi

    if [ -e "$CLIENT_MAC_APP_DIR" ]; then
        echo "Removing $CLIENT_APP_NAME from Applications..."
        rm -rf "$CLIENT_MAC_APP_DIR"
    fi

    echo "$CLIENT_APP_NAME completely removed"
}

uninstall_client() {
    local os_type; os_type="$(get_os_type)"
    case $os_type in
        mac)
            uninstall_mac_client
            ;;
        *)
            echo "Sorry, but $os_type is not supported yet"
            return 10
            ;;
    esac
}

install_linux_client_directly() {
    check_curl_avail
    (
        update_global_downloads_and_apps_dir_vars
        local app_basename; app_basename="$CLIENT_APPIMAGE_BASENAME"
        local app_dl_path; app_dl_path="$DOWNLOADS_DIR/$app_basename"
        local app_inst_path; app_inst_path="$APPLICATIONS_DIR/$app_basename"

        if [ ! -f "$app_inst_path" ]; then
            if [ ! -f "$app_dl_path" ]; then
                create_downloads_dir \
                    && echo "Downloading Client ..." \
                    && run_as_orig_user "curl -L -o '$app_dl_path' '$CLIENT_APPIMAGE_DL_URL'"
            fi
            create_apps_dir \
                && mv "$app_dl_path" "$app_inst_path" \
                && chmod +x "$app_inst_path"
        fi
    )
}

start_mac_clients() {
    local num; num=$1;
    ([ -z "$num" ] || [ $num -lt 1 ]) \
        && echo "The number of clients is not set" \
        && return 100
    local wps; wps=$2; [ -z "$wps" ] && wps=$WEB_PORT_SHIFT
    local cps; cps=$3; [ -z "$cps" ] && cps=$CLIENT_PORT_SHIFT
    #local cfp; cfp=$4; [ -z "$cfp" ] && cfp=$CF_PORT
    local cfp; cfp=$CF_PORT # FIXME: change to parameter
    local priv_key

    install_mac_client_directly
    case $? in
        21|22|0) : ;;
        *) echo "Can't download/install client" && return 101 ;;
    esac

    local i w_port c_port run_cmd offset_x offset_y
    offset_x=0; offset_y=0
    for i in $(seq 1 $num); do
        priv_key="$(get_priv_key $i)"
        w_port=$(expr $i + $wps)
        c_port=$(expr $i + $cps)
        echo "Starting client $i (web port: $w_port; client port: $c_port) ..."
        run_cmd="open -n $CLIENT_MAC_APP_DIR --args --disable-full-nodes-sync=true --full-node http://127.0.0.1:$c_port --private-key $priv_key --socket-url http://127.0.0.1:$cfp --offset-x $offset_x --offset-y $offset_y --dry"
        eval "$run_cmd"
        offset_x=$(expr $offset_x + 50) 
        offset_y=$(expr $offset_y + 50) 
    done
}

start_linux_clients() {
    local num; num=$1;
    ([ -z "$num" ] || [ $num -lt 1 ]) \
        && echo "The number of clients is not set" \
        && return 200
    local wps; wps=$2; [ -z "$wps" ] && wps=$WEB_PORT_SHIFT
    local cps; cps=$3; [ -z "$cps" ] && cps=$CLIENT_PORT_SHIFT
    #local cfp; cfp=$4; [ -z "$cfp" ] && cfp=$CF_PORT
    local cfp; cfp=$CF_PORT # FIXME: change to parameter
    local priv_key; priv_key="$(get_priv_key 1)"

    install_linux_client_directly

    (
        update_global_downloads_and_apps_dir_vars

        local app_basename; app_basename="$CLIENT_APPIMAGE_BASENAME"
        local app_inst_path; app_inst_path="$APPLICATIONS_DIR/$app_basename"

        local w_port; local c_port; local run_cmd
        local offset_x; offset_x=0; local offset_y; offset_y=0
        local priv_key i
        for i in $(seq 1 $num); do
            priv_key="$(get_priv_key $i)"
            w_port=$(expr $i + $wps)
            c_port=$(expr $i + $cps)
            echo "Starting client $i (web port: $w_port; client port: $c_port) ..."
            run_cmd="$app_inst_path --disable-full-nodes-sync=true --full-node http://127.0.0.1:$c_port --private-key $priv_key --socket-url http://127.0.0.1:$cfp --offset-x $offset_x --offset-y $offset_y --dry &" 
            run_as_orig_user "$run_cmd"
            offset_x=$(expr $offset_x + 50) 
            offset_y=$(expr $offset_y + 50) 
        done
    )
}

start_clients() {
    local num wps cps dbp cfp blexp src_dir ind
    read_install_params_to_vars || return $? 
    local os_type; os_type="$(get_os_type)"
    case $os_type in
        linux)
            start_linux_clients $num #$@
            ;;
        mac)
            start_mac_clients $num #$@
            ;;
        *)
            echo "Sorry, but $os_type is not supported yet"
            return 10
            ;;
    esac
}

get_mac_clients_pids() {
    pgrep -f "$CLIENT_MAC_PROCESS_NAME --disable-full-nodes-sync=true --full-node"
}

are_mac_clients_running() {
    [ -z "$(get_mac_clients_pids)" ] && echo "no" && return 1; echo "yes"
}

stop_mac_clients() {
    local max_tries; max_tries=20
    local cnt; cnt=1; local stop; stop=0; local pids
    while [ $stop -eq 0 ]; do
        [ $cnt -gt 1 ] && sleep 1
        pids="$(get_mac_clients_pids)"
        [ -n "$pids" ] && pids="$(echo "$pids" | tr '\n' ' ')" \
            && echo "Stopping clients ..." && kill $pids > /dev/null \
            || stop=1
        [ $cnt -gt $max_tries ] && echo "Can't stop clients ..." && return 1
        cnt=$(expr $cnt + 1)
    done
}

get_linux_clients_pids() {
    pgrep -f "$CLIENT_LINUX_PROCESS_NAME --disable-full-nodes-sync=true --full-node"
}

are_linux_clients_running() {
    [ -z "$(get_linux_clients_pids)" ] && echo "no" && return 1; echo "yes"
}

stop_linux_clients() {
    local max_tries; max_tries=20
    local cnt; cnt=1; local stop; stop=0; local pids
    while [ $stop -eq 0 ]; do
        [ $cnt -gt 1 ] && sleep 1
        pids="$(get_linux_clients_pids)"
        [ -n "$pids" ] && pids="$(echo "$pids" | tr '\n' ' ')" \
            && echo "Stopping clients ..." && kill $pids > /dev/null \
            || stop=1
        [ $cnt -gt $max_tries ] && echo "Can't stop clients ..." && return 1
        cnt=$(expr $cnt + 1)
    done
}

stop_clients() {
    local os_type; os_type="$(get_os_type)"
    case $os_type in
        linux)
            stop_linux_clients
            ;;
        mac)
            stop_mac_clients
            ;;
        *)
            echo "Sorry, but $os_type is not supported yet"
            return 10
            ;;
    esac
}

are_clients_running() {
    local os_type; os_type="$(get_os_type)"
    case $os_type in
        linux)
            are_linux_clients_running
            ;;
        mac)
            are_mac_clients_running
            ;;
        *)
            echo "Sorry, but $os_type is not supported yet"
            return 10
            ;;
    esac
}

restart_clients() {
    stop_clients
    start_clients
}

restart_running_clients() {
    if [ "$(are_clients_running)" = "yes" ]; then
        restart_clients
    fi
}

### Client #### end ####


### Common containers ### begin ###

get_cont_id() {
    docker ps -a -f name="$1" --format '{{.ID}}'
}

get_running_cont_id() {
    docker ps -f name="$1" -f status=running --format '{{.ID}}'
}

check_cont() {
    [ -z "$(get_cont_id $1)" ] \
        && echo "Container with name '$1' doesn't exist" && return 1
    id="$(get_running_cont_id $1)"
    [ -z "$id" ] \
        && echo "Container with name '$1' isn't running" && return 2
    echo "$id"
}

get_cont_status() {
    local result; result=0
    local id; id=$(check_cont "$1"); result=$?
    case $result in
        1)  
            echo "absent"
            ;;
        2)
            echo "not-running"
            ;;
        0)
            echo "running"
            ;;
        *)
            echo "unknown"
            ;;
    esac
    return $result
}

cont_exec() {
    local name; name="$1"
    local id; id=$(check_cont "$name"); [ $? -ne 0 ] && return 1
    shift 1
    local run_cmd; run_cmd="docker exec -ti $id $@"
    eval "$run_cmd"
}

prep_cont_for_inspect() {
    #cont_exec $1 "bash -c \"apt update --fix-missing; apt install -y tmux telnet net-tools vim nano links procps\""
    cont_exec $1 "bash -c 'apt update --fix-missing; apt install -y tmux telnet iputils-ping net-tools vim nano links screen procps mc build-essential; (command -v go && echo \"Installing delve ...\" && go get -u github.com/derekparker/delve/cmd/dlv)'"
}

prep_cont_for_inspect_centos7() {
    cont_exec $1 "bash -c 'dnf install -y tmux telnet net-tools vim nano links'"
}

cont_bash() {
    cont_exec "$1" bash
}

remove_cont() {
    check_cont $1 > /dev/null
    [ $? -ne 1 ] && echo -n "Stopping/removing " && docker rm -f $1 
}

check_cont_proc() {
    [ -z "$1" ] && echo "Container name isn't set" && return 1
    [ -z "$2" ] && echo "Process name isn't set" && return 2
    check_cont "$1" > /dev/null; [ $? -ne 0 ] \
        && echo "Container '$1' isn't available " && return 3
    [ -z "$(docker exec -t "$1" pgrep "$2")" ] \
        && echo "No process '$2' @ container '$1'" && return 4
    return 0
}

wait_cont_proc() {
    local cont_name; cont_name="$1"
    local proc_name; proc_name="$2"
    local timeout_secs; [ -z "$3" ] && timeout_secs=15 || timeout_secs="$3"
    local end_time; end_time=$(( $(date +%s) + timeout_secs ))

    echo "Waiting ($timeout_secs seconds) for process '$proc_name' @ container '$cont_name' ..."

    local cnt; cnt=1
    local stop; stop=0;
    local result; result=0;
    while [ $stop -eq 0 ]; do
        [ $cnt -gt 1 ] && sleep 1
        echo -n "    try $cnt: "
        check_cont_proc "$cont_name" "$proc_name"; result=$?
        case $result in
            0|1|2) stop=1 ;;
            3|4) [ $(date +%s) -lt $end_time ] || stop=1 ;;
        esac
        cnt=$(expr $cnt + 1)
    done
    return $result
}

gen_docker_p_args() {
    local num; num=$1; ([ -z "$num" ] || [ $num -eq 0 ]) && return 1
    local hsh; hsh=$2; [ -z "$hsh" ] && hsh=0
    local gsh; gsh=$3; [ -z "$gsh" ] && gsh=$hsh

    local i s; s=""
    for i in $(seq 1 $num); do
        [ -n "$s" ] && s="$s "
        s="${s}-p $(expr $i + $hsh):$(expr $i + $gsh)"
    done
    echo "$s"
}

### Common containers #### end ####


### DB container ### begin ###

start_db_cont() {
    local dbp; dbp=$1
    [ -z "$dbp" ] && dbp=$DB_PORT
    check_cont $DB_CONT_NAME > /dev/null
    case $? in
        1)  
            local image_name
            if [ "$TRY_LOCAL_DB_CONT_NAME_ON_RUN" = "yes" ]; then
                local loc; loc=$(docker images --format "{{.Repository}}" -f "reference=$DB_CONT_NAME")
                [ -n "$loc" ] && image_name="$DB_CONT_NAME" \
                    || image_name="$DB_CONT_IMAGE"
            else
                image_name="$DB_CONT_IMAGE"
            fi
            echo "Creating a new database container from image '$image_name' ..."
            docker run -d --restart always --name $DB_CONT_NAME -p $dbp:$CONT_DB_PORT -t $image_name
            ;;
        2)
            echo "Starting database container (host port: $dbp) ..."
            docker start $DB_CONT_NAME &
            ;;
        0)
            echo "Database container is already running"
            ;;
        *)
            echo "Unknown database container status"
            ;;
    esac
}

### DB container #### end ####


### RQ container ### begin ###

start_rq_cont() {
    #local blexp; blexp="$1"
    #[ -z "$blexp" ] && blexp=$BLEX_PORT
    check_cont $RQ_CONT_NAME > /dev/null
    case $? in
        1)  
            local image_name
            if [ "$TRY_LOCAL_RQ_CONT_NAME_ON_RUN" = "yes" ]; then
                local loc; loc=$(docker images --format "{{.Repository}}" -f "reference=$RQ_CONT_NAME")
                [ -n "$loc" ] && image_name="$RQ_CONT_NAME" \
                    || image_name="$RQ_CONT_IMAGE"
            else
                image_name="$RQ_CONT_IMAGE"
            fi
            echo "Creating a new Redis Queue container from image '$image_name' ..."
            docker run -d --restart always --name $RQ_CONT_NAME -p $REDIS_HOST_PORT:$REDIS_CONT_PORT -t $image_name
            ;;
        2)
            echo "Starting Redis Queue container (host port $REDIS_HOST_PORT) ..."
            docker start $RQ_CONT_NAME &
            ;;
        0)
            echo "Redis Queue container is already running"
            ;;
        *)
            echo "Unknown Redis Queue container status"
            ;;
    esac
}

### RQ container #### end ####


### BLEX container ### begin ###

start_blex_cont() {
    local blexp; blexp="$1"
    [ -z "$blexp" ] && blexp=$BLEX_PORT
    check_cont $BLEX_CONT_NAME > /dev/null
    case $? in
        1)  
            local image_name
            if [ "$TRY_LOCAL_BLEX_CONT_NAME_ON_RUN" = "yes" ]; then
                local loc; loc=$(docker images --format "{{.Repository}}" -f "reference=$BLEX_CONT_NAME")
                [ -n "$loc" ] && image_name="$BLEX_CONT_NAME" \
                    || image_name="$BLEX_CONT_IMAGE"
            else
                image_name="$BLEX_CONT_IMAGE"
            fi
            echo "Creating a new block explorer container from image '$image_name' ..."
            docker run -d --restart always --name $BLEX_CONT_NAME -p $blexp:$CONT_BLEX_PORT --link $DB_CONT_NAME:$DB_CONT_NAME --link $RQ_CONT_NAME:$RQ_CONT_NAME --link $BF_CONT_NAME:$BF_CONT_NAME -t $image_name
            ;;
        2)
            echo "Starting block explorer container (host port: $blexp) ..."
            docker start $BLEX_CONT_NAME &
            ;;
        0)
            echo "Block explorer container is already running"
            ;;
        *)
            echo "Unknown block explorer container status"
            ;;
    esac
}

### BLEX container #### end ####


### CF container ### begin ###

start_cf_cont() {
    local cfp; cfp=$1
    [ -z "$cfp" ] && cfp=$CF_PORT
    check_cont $CF_CONT_NAME > /dev/null
    case $? in
        1)  
            local image_name
            if [ "$TRY_LOCAL_CF_CONT_NAME_ON_RUN" = "yes" ]; then
                local loc; loc=$(docker images --format "{{.Repository}}" -f "reference=$CF_CONT_NAME")
                [ -n "$loc" ] && image_name="$CF_CONT_NAME" \
                    || image_name="$CF_CONT_IMAGE"
            else
                image_name="$CF_CONT_IMAGE"
            fi
            echo "Creating a new centrifugo container from image '$image_name' ..."
            docker run -d --restart always --name $CF_CONT_NAME -p $cfp:$CONT_CF_PORT -t $image_name
            ;;
        2)
            echo "Starting centrifugo container (host port: $cfp) ..."
            docker start $CF_CONT_NAME &
            ;;
        0)
            echo "Centrifugo container is already running"
            ;;
        *)
            echo "Unknown centrifugo container status"
            ;;
    esac
}

### CF container #### end ####


### BF container ### begin ###

start_bf_cont() {
    local num; ([ -z "$1" ] || [ $1 -lt 1 ]) \
        && echo "The number of backends isn't set" && return 1 || num=$1
    local wps; [ -z "$2" ] && wps=$WEB_PORT_SHIFT || wps=$2
    local cps; [ -z "$3" ] && cps=$CLIENT_PORT_SHIFT || cps=$3

    check_cont $BF_CONT_NAME > /dev/null
    case $? in
        1)  

            local w_ports;
            w_ports=$(gen_docker_p_args $num $wps $CONT_WEB_PORT_SHIFT)
            local c_ports;
            c_ports=$(gen_docker_p_args $num $cps $CONT_CLIENT_PORT_SHIFT)

            local image_name
            if [ "$TRY_LOCAL_BF_CONT_NAME_ON_RUN" = "yes" ]; then
                local loc; loc=$(docker images --format "{{.Repository}}" -f "reference=$BF_CONT_NAME")
                [ -n "$loc" ] && image_name="$BF_CONT_NAME" \
                    || image_name="$BF_CONT_IMAGE"
            else
                image_name="$BF_CONT_IMAGE"
            fi
            echo "Creating a new backend/frontend container from image '$image_name' ..."
            #docker run -d --restart always --name $BF_CONT_NAME $w_ports $c_ports -v apla:/s --link $DB_CONT_NAME:$DB_CONT_NAME --link $CF_CONT_NAME:$CF_CONT_NAME -t $image_name
            docker run -d --restart always --name $BF_CONT_NAME $w_ports $c_ports --link $DB_CONT_NAME:$DB_CONT_NAME --link $CF_CONT_NAME:$CF_CONT_NAME -t $image_name
            ;;
        2)
            echo "Starting backend/frontend container ..."
            docker start $BF_CONT_NAME &
            ;;
        0)
            echo "Backend/frontend container is already running"
            ;;
        *)
            echo "Unknown backend/frontend container status"
            ;;
    esac
}

### BF container #### end ####


### Database ### begin ###

check_db_exists() {
    local db_name; db_name="$1"; [ -z "$db_name" ] \
        && echo "DB name isn't set" && return 1
    check_cont $DB_CONT_NAME > /dev/null; [ $? -ne 0 ] \
        && echo "DB container isn't available" && return 2
    local db; db=$(docker exec -ti $DB_CONT_NAME bash -c "sudo -u postgres psql -lqt" | $SED_E -n "s/^[^e]*($db_name)[^|]+.*$/\1/gp")
    [ -z "$db" ] && echo "DB '$db_name' doesn't exist" && return 3
    return 0
}

wait_db_exists() {
    local db_name; db_name="$1"
    local timeout_secs; [ -z "$2" ] && timeout_secs=15 || timeout_secs="$2"
    local end_time; end_time=$(( $(date +%s) + timeout_secs ))

    echo "Waiting ($timeout_secs seconds) for database '$db_name' existence ..."

    local cnt; cnt=1
    local stop; stop=0;
    local result; result=0;
    while [ $stop -eq 0 ]; do
        [ $cnt -gt 1 ] && sleep 1
        echo -n "    try $cnt: "
        check_db_exists "$1"; result=$?
        case $result in
            1|0) stop=1 ;;
            2|3) [ $(date +%s) -lt $end_time ] || stop=1 ;;
        esac
        cnt=$(expr $cnt + 1)
    done
    [ $result -eq 0 ] && echo "ok"
    return $result
}

### Update ### 20180405 ### 08fad ### begin ###

check_dbs() {
    local num; num=$1
    echo "Checking databases for $num backends ..."
    local total_result; total_result=0; local result
    local i db_name
    for i in $(seq 1 $num); do
        db_name="$DB_NAME_PREFIX$i"
        echo -n "  checking database for backend $i: "
        check_db_exists "$db_name"; result=$?
        [ $result -ne 0 ] && total_result=$result || echo "ok"
    done
    return $total_result
}

wait_dbs() {
    local num; num=$1
    local timeout_secs; [ -z "$2" ] && timeout_secs=15 || timeout_secs="$2"
    echo "Waiting ($timeout_secs seconds for each) databases for $num backends ..."
    local i total_result result db_name
    total_result=0
    for i in $(seq 1 $num); do
        db_name="$DB_NAME_PREFIX$i"
        echo "  checking database for backend $i: "
        wait_db_exists "$db_name" $timeout_secs; result=$?
        [ $result -ne 0 ] && total_result=$result || echo "ok"
    done
    return $total_result
}

create_dbs() {
    local num; num=$1
    local timeout_secs; timeout_secs=$2
    local max_tries; [ -z "$3" ] && max_tries=5 || max_tries=$3

    echo "Creating/checking databases for $num backends ..."
    local total_result; total_result=0; local result db_name
    local i cnt stop 
    for i in $(seq 1 $num); do
        db_name="$DB_NAME_PREFIX$i"
        cnt=1; stop=0
        while [ $stop -eq 0 ]; do
            if [ $cnt -gt 1 ]; then
                wait_db_exists "$db_name" $timeout_secs; result=$?
            else
                echo "Quick checking database '$db_name' existence ..."
                check_db_exists "$db_name"; result=$?
            fi
            case $result in
                0)
                    [ $cnt -gt 1 ] && echo "Database '$db_name' exists" \
                        || echo "Database '$db_name' already exists"
                    stop=1
                    ;;
                3)
                    echo "Creating '$db_name' database ..."
                    docker exec -ti $DB_CONT_NAME bash /db.sh create postgres "$db_name"
                    ;;
                *) total_result=$result ;;
            esac
            [ $cnt -ge $max_tries ] && total_result=20 && stop=1
            cnt=$(expr $cnt + 1)
        done
    done
}


run_db_shell() {
    local db_name
    [ -z "$1" ] && echo "Backend's number isn't set" && return 1 \
        || db_name="$DB_NAME_PREFIX$1"
    check_db_exists "$db_name" || return 3
    docker exec -ti $DB_CONT_NAME bash -c \
        "sudo -u postgres psql -U postgres -d $db_name"
}

do_db_query() {
    local out_mode; 
    [ -z "$1" ] && echo "Output mode isn't set" && return 1 \
        || out_mode="$1"
    local db_name
    [ -z "$2" ] && echo "Backend's number isn't set" && return 1 \
        || db_name="$DB_NAME_PREFIX$2"
    shift 2
    [ -z "$1" ] \
        && echo "Query string isn't set" && return 2
    local query; query="$@";
    check_db_exists "$db_name" || return 3
    local query_esc; query_esc="$(echo "$query" | $SED_E "s#\\\\[*]#*#g")"
    case $out_mode in
        t-md5) docker exec -ti $DB_CONT_NAME bash -c \
                "sudo -u postgres psql -U postgres -d $db_name -t -c '$query_esc' | md5sum | sed -E -n 's/^([0-9a-zA-Z]{32}).*$/\1/p'"
            ;;
        t) docker exec -ti $DB_CONT_NAME bash -c \
            "sudo -u postgres psql -U postgres -d $db_name -t -c '$query_esc'"
            ;;
        comn|*) docker exec -ti $DB_CONT_NAME bash -c \
            "sudo -u postgres psql -U postgres -d $db_name -c '$query_esc'"
            ;;
    esac
}

get_pg_major_ver_from_dockerfile() {
    local df_path ver
    df_path="$SCRIPT_DIR/$DB_CONT_BUILD_DIR/Dockerfile"
    [ ! -e "$df_path" ] && return 1
    ver="$($SED_E -n 's/^ENV PG_MAJOR (.*)$/\1/p' "$df_path" | tail -n 1)"
    [ -n "$ver" ] && echo "$ver" || return 2
}

get_pgdata_var_value_from_dockerfile() {
    local df_path ver
    df_path="$SCRIPT_DIR/$DB_CONT_BUILD_DIR/Dockerfile"
    [ ! -e "$df_path" ] && return 1
    ver="$($SED_E -n 's/^ENV PGDATA (.*)$/\1/p' "$df_path" | tail -n 1)"
    [ -n "$ver" ] && echo "$ver" || return 2
}

restart_db_server() {
    local rmt_pg_ctl_path rmt_pgdata
    rmt_pg_ctl_path="/usr/lib/postgresql/$(get_pg_major_ver_from_dockerfile)/bin/pg_ctl"
    rmt_pgdata="$(get_pgdata_var_value_from_dockerfile)"
    echo "Restarting DB Server ..."
    docker exec -ti $DB_CONT_NAME su - postgres -c "PGDATA=$rmt_pgdata $rmt_pg_ctl_path -w restart"
    case $? in
        0|137) echo ""; return 0 ;;
    esac
}

block_chain_count() {
    local i num; num="$1"; local query db_name
    for i in $(seq 1 $num); do
        db_name="$DB_NAME_PREFIX$i"
        query='SELECT COUNT(*) FROM block_chain'
        echo -n "$db_name: $query: "
        do_db_query comn "$i" "$query" | tail -n +4 | head -n +1 | $SED_E 's/^ +//'
    done
}

get_first_blocks() {
    local i num
    [ -z "$1" ] && echo "The number of backends isn't set" && return 1 || num=$1
    local query; local out; local prev; local res; res=0
    for i in $(seq 1 $num); do
        query='SELECT key_id FROM block_chain WHERE id=1'
        echo -n "backend #$i db: $query: "
        do_db_query t "$i" "$query" | $SED_E -e 's/^[^0-9]+//' -e '/^\s*$/d'
    done
}

### Update ### 20180405 ### 08fad #### end ####

cmp_first_blocks() {
    local i num
    [ -z "$1" ] && echo "the number of backends isn't set" && return 1 || num=$1
    [ $num -eq 1 ] && echo "The backend is single" && return 0
    local query; local out; local prev; local res; result=0
    for i in $(seq 1 $num); do
        prev="$out"
        query='SELECT key_id FROM block_chain WHERE id=1'
        out="$(do_db_query t "$i" "$query" | $SED_E -e 's/^[^0-9]+//' -e '/^\s*$/d')"
        [ $i -gt 1 ] && [ "$prev" != "$out" ] && result=1
    done
    [ $result -ne 0 ] && echo "first blocks differ" && return 2
    echo "first blocks are the same: $out" 
}

cmp_keys() {
    local num
    [ -z "$1" ] && echo "Backend's number isn't set" && return 1 || num=$1
    [ $num -eq 1 ] && echo "The backend is single" && return 0
    local i prev; local result; result=0
    for i in $(seq 1 $num); do
        prev="$out"
        out="$(do_db_query t-md5 $i "select id, pub from \"1_keys\" order by id;")"
        [ $i -gt 1 ] && [ "$prev" != "$out" ] && result=1
    done
    [ $result -ne 0 ] && echo "keys differ" && return 2
    echo "keys are the same" 
}

wait_keys_sync() {
    local num;
    [ -z "$1" ] && echo "Backend's number isn't set" && return 1 || num=$1
    local timeout_secs; [ -z "$2" ] && timeout_secs=25 || timeout_secs="$2"
    local end_time; end_time=$(( $(date +%s) + timeout_secs ))
    local cnt; cnt=1
    local stop; stop=0;
    local result; result=0;
    local out
    echo "Waiting ($timeout_secs seconds) for keys synchronization to complete ..."
    while [ $stop -eq 0 ]; do
        [ $cnt -gt 1 ] && sleep 1
        echo -n "    try $cnt: "
        cmp_keys "$1"; result=$?
        case $result in
            1|0) stop=1 ;;
            2) [ $(date +%s) -lt $end_time ] || stop=1 ;;
        esac
        cnt=$(expr $cnt + 1)
    done
    [ $result -eq 0 ] && echo "OK: keys are synchronized"
    return $result
}

### Database #### end ####


### Backends services ### begin ###

check_cont_http() {
    [ -z "$1" ] && echo "Container name isn't set" && return 1
    [ -z "$2" ] && echo "URL isn't set" && return 2
    check_cont "$1" > /dev/null; [ $? -ne 0 ] \
        && echo "Container '$1' isn't available " && return 3
    local result
    local resp; resp="$(docker exec -t "$1" curl $2 --stderr -)"; result=$?
    [ -n "$(echo "$resp" | grep "Could not resolve host")" ] \
        && echo "Could not resolve host" && return 4
    [ $result -ne 0 ] && echo "HTTP Request Error: $resp" && return 5
    echo "ok"
    return 0
}

wait_cont_http() {
    local cont_name; cont_name="$1"
    local url; url="$2"
    local timeout_secs; [ -z "$3" ] && timeout_secs=15 || timeout_secs="$3"
    local end_time; end_time=$(( $(date +%s) + timeout_secs ))

    echo "Waiting ($timeout_secs seconds) for HTTP response to URL '$url' @ container '$cont_name' ..."

    local cnt; cnt=1
    local stop; stop=0;
    local result; result=0;
    while [ $stop -eq 0 ]; do
        [ $cnt -gt 1 ] && sleep 1
        echo -n "    try $cnt: "
        check_cont_http "$cont_name" "$url"; result=$?
        case $result in
            0|1|2|4) stop=1 ;;
            3|5) [ $(date +%s) -lt $end_time ] || stop=1 ;;
        esac
        cnt=$(expr $cnt + 1)
    done
    return $result
}

check_http_code() {
    [ -z "$1" ] && echo "URL isn't set" && return 1
    [ -z "$2" ] && echo "List of OK codes isn't set" \
        && return 2
    local resp; resp="$(curl -sv "$1" --stderr -)"
    [ -n "$(echo "$resp" | grep "Could not resolve host")" ] \
        && echo "Could not resolve host" && return 3
    [ -n "$(echo "$resp" | grep "failed: Connection refused")" ] \
        && echo "Connection refused" && return 4
    local code; code="$(echo "$resp" | $SED_E -n 's/^< HTTP[^ ]* ([0-9]+)[^0-9]+.*$/\1/gp')"
    local c; local result; result=1; IFS=','
    for c in $2; do
        [ "$c" = "$code" ] && result=0 && break
    done
    unset IFS;
    [ $result -ne 0 ] && echo "Bad HTTP Response code '$code' (OK-codes: '$2')" && return 5
    echo "ok"
    return 0
}

wait_http_code() {
    local url; url="$1"
    local codes; codes="$2"
    local timeout_secs; [ -z "$3" ] && timeout_secs=15 || timeout_secs="$3"
    local end_time; end_time=$(( $(date +%s) + timeout_secs ))

    echo "Waiting ($timeout_secs seconds) for HTTP response with one of OK-code ($codes) to URL '$url' request ..."

    local cnt; cnt=1
    local stop; stop=0;
    local result; result=0;
    while [ $stop -eq 0 ]; do
        [ $cnt -gt 1 ] && sleep 1
        echo -n "    try $cnt: "
        check_http_code "$url" "$codes"; result=$?
        case $result in
            0|1|2|3) stop=1 ;;
            4|5) [ $(date +%s) -lt $end_time ] || stop=1 ;;
        esac
        cnt=$(expr $cnt + 1)
    done
    return $result
}

check_cont_http_code() {
    [ -z "$1" ] && echo "Container name isn't set" && return 1
    [ -z "$2" ] && echo "URL isn't set" && return 2
    [ -z "$3" ] && echo "List of OK codes isn't set" \
        && return 3
    check_cont "$1" > /dev/null; [ $? -ne 0 ] \
        && echo "Container '$1' isn't available " && return 4
    local resp; resp="$(docker exec -t "$1" curl -sv "$2" --stderr -)"
    [ -n "$(echo "$resp" | grep "Could not resolve host")" ] \
        && echo "Could not resolve host" && return 5
    [ -n "$(echo "$resp" | grep "failed: Connection refused")" ] \
        && echo "HTTP Connection refused" && return 6
    local code; code="$(echo "$resp" | $SED_E -n 's/^< HTTP[^ ]* ([0-9]+)[^0-9]+.*$/\1/gp')"
    local c; local result; result=1; IFS=','
    for c in $3; do
        [ "$c" = "$code" ] && result=0 && break
    done
    unset IFS;
    [ $result -ne 0 ] && echo "Bad HTTP Response code '$code' (OK-codes: '$3')" && return 7
    echo "ok"
    return 0
}

wait_cont_http_code() {
    local cont_name; cont_name="$1"
    local url; url="$2"
    local codes; codes="$3"
    local timeout_secs; [ -z "$4" ] && timeout_secs=15 || timeout_secs="$4"
    local end_time; end_time=$(( $(date +%s) + timeout_secs ))

    echo "Waiting ($timeout_secs seconds) for HTTP response with one of OK-code ($codes) to URL '$url' request @ container '$cont_name' ..."

    local cnt; cnt=1
    local stop; stop=0;
    local result; result=0;
    while [ $stop -eq 0 ]; do
        [ $cnt -gt 1 ] && sleep 1
        echo -n "    try $cnt: "
        check_cont_http_code "$cont_name" "$url" "$codes"; result=$?
        case $result in
            0|1|2|3|5) stop=1 ;;
            4|6|7) [ $(date +%s) -lt $end_time ] || stop=1 ;;
        esac
        cnt=$(expr $cnt + 1)
    done
    return $result
}

get_http_len() {
    [ -z "$1" ] && echo "URL isn't set" && return 1
    [ -z "$2" ] && echo "List of OK codes isn't set" \
        && return 2
    [ -z "$3" ] && echo "Content-Length minimal size (bytes) isn't set" \
        && return 3
    local resp; resp="$(curl -sv "$1" --stderr -)"
    [ -n "$(echo "$resp" | grep "Could not resolve host")" ] \
        && echo "Could not resolve host" && return 4
    [ -n "$(echo "$resp" | grep "failed: Connection refused")" ] \
        && echo "HTTP Connection refused" && return 5
    local code; code="$(echo "$resp" | $SED_E -n 's/^< HTTP[^ ]* ([0-9]+)[^0-9]+.*$/\1/gp')"
    local c; local result; result=1; IFS=','
    for c in $2; do
        [ "$c" = "$code" ] && result=0 && break
    done
    unset IFS;
    [ $result -ne 0 ] && echo "Bad HTTP Response code '$code' (OK-codes: '$3')" && return 6
    local len; len="$(echo "$resp" | $SED_E -n 's/^[^C]*Content-Length: ([0-9]+)[^0-9]*.*$/\1/gp')"
    [ -z "$len" ] && echo "No Content-Length in HTTP response" && return 7
    [ $len -lt $3 ] && echo "HTTP Content-Length '$len' is lesser than minimal '$3'" && return 8
    local data; data="$(echo "$resp" | $SED_E -n 's/^([^\*<>]+).*$/\1/pg' | grep -v '{ \[')"
    echo "$data"
}

check_http_len() {
    local result; local out; out="$(get_http_len $@)"; result=$?
    [ $result -ne 0 ] && ([ -n "$out" ] && echo "$out" || :) && return $result
    echo "ok"
}

wait_http_len() {
    local url; url="$1"
    local codes; codes="$2"
    local min_len; min_len="$3"
    local timeout_secs; [ -z "$4" ] && timeout_secs=15 || timeout_secs="$4"
    local end_time; end_time=$(( $(date +%s) + timeout_secs ))

    echo "Waiting ($timeout_secs seconds) for HTTP response with one of OK-code ($codes) and Content-Length more or equal to '$min_len' bytes to URL '$url' request @ container '$cont_name' ..."

    local cnt; cnt=1
    local stop; stop=0;
    local result; result=0;
    while [ $stop -eq 0 ]; do
        [ $cnt -gt 1 ] && sleep 1
        echo -n "    try $cnt: "
        check_http_code_len "$url" "$codes" "$min_len"; result=$?
        case $result in
            0|1|2|3|4) stop=1 ;;
            5|6|7|8) [ $(date +%s) -lt $end_time ] || stop=1 ;;
        esac
        cnt=$(expr $cnt + 1)
    done
    return $result
}

# URL template: 'http://127.0.0.1:PORT/keys/PrivateKey'
get_http_priv_key() {
    [ -z "$1" ] && echo "URL template isn't set" && return 1
    [ -z "$2" ] && echo "The index number of backend isn't set" && return 2
    [ -z "$3" ] && echo "List of OK codes isn't set" \
        && return 3
    [ -z "$4" ] && echo "Content-Length minimal size (bytes) isn't set" \
        && return 4
    [ -z "$5" ] && wps=$WEB_PORT_SHIFT || wps=$5
    local port; port=$(expr $wps + $2)
    local url; url="$(echo "$1" | $SED_E "s/:PORT/:$port/g")"
    local resp; resp="$(curl -vs "$url" --stderr -)"
    [ -n "$(echo "$resp" | grep "Could not resolve host")" ] \
        && echo "Could not resolve host" && return 5
    [ -n "$(echo "$resp" | grep "failed: Connection refused")" ] \
        && echo "HTTP Connection refused" && return 6
    local code; code="$(echo "$resp" | $SED_E -n 's/^< HTTP[^ ]* ([0-9]+)[^0-9]+.*$/\1/gp')"
    local c; local result; result=1; IFS=','
    for c in $3; do
        [ "$c" = "$code" ] && result=0 && break
    done
    unset IFS;
    [ $result -ne 0 ] && echo "Bad HTTP Response code '$code' (OK-codes: '$3')" && return 7
    local len; len="$(echo "$resp" | $SED_E -n 's/^[^C]*Content-Length: ([0-9]+)[^0-9]*.*$/\1/gp')"
    [ -z "$len" ] && echo "No Content-Length in HTTP response" && return 8
    [ $len -lt $4 ] && echo "HTTP Content-Length '$len' is lesser than minimal '$3'" && return 9
    local data; data="$(echo "$resp" | $SED_E -n 's/^([^\*<>\{]+)\* .*$/\1/pg')"
    local chck; chck="$(echo -n "$data" | $SED_E -n 's/^([a-zA-Z0-9]{64})$/\1/p')"
    [ -z "$chck" ] \
        && echo "Data '$data' doesn't match to REGEX /^([a-zA-Z0-9]{64})$/" \
        && return 10 
    echo "$data"
}

get_priv_key() {
    [ -z "$1" ] && echo "The index number of a backend isn't set" && return 1
    local idx; idx="$1"
    local num; local wps; local cps; local dbp; local cfp; local blexp
    read_install_params_to_vars || return 2
    [ $idx -gt $num ] && echo "The total number of backends is $num" && return 3
    local priv_key_path; priv_key_path="$BE_ROOT_DATA_DIR/node$1/PrivateKey"; local result
    cont_exec $BF_CONT_NAME "bash -c '[ -e \"$priv_key_path\" ] && cat \"$priv_key_path\"'"
    result=$?
    [ $result -ne 0 ] && echo "File '$priv_key_path' doesn't exist @ container '$BF_CONT_NAME'" && return $result
    echo
}

get_priv_keys() {
    if [ -n "$1" ]; then 
        get_priv_key $1
        return $?
    fi
    local num; local wps; local cps; local dbp; local cfp; local blexp
    read_install_params_to_vars || return 10
    cont_exec $BF_CONT_NAME "bash -c 'for i in \$(seq 1 $num); do echo -n \"\$i: \" && priv_key_path=\"$BE_ROOT_DATA_DIR/node\$i/PrivateKey\" && [ -e \"\$priv_key_path\" ]  && cat \"\$priv_key_path\" && echo; done'"
}

get_key_id() {
    [ -z "$1" ] && echo "The index number of a backend isn't set" && return 1
    local idx; idx="$1"
    local num; local wps; local cps; local dbp; local cfp; local blexp
    read_install_params_to_vars || return 2
    [ $idx -gt $num ] && echo "The total number of backends is $num" && return 3
    local keyd_id_path; key_id_path="$BE_ROOT_DATA_DIR/node$1/KeyID"; local result
    cont_exec $BF_CONT_NAME "bash -c '[ -e \"$key_id_path\" ] && cat \"$key_id_path\"'"
    result=$?
    [ $result -ne 0 ] && echo "File '$key_id_path' doesn't exist @ container '$BF_CONT_NAME'" && return $result
    echo
}

get_key_ids() {
    if [ -n "$1" ]; then 
        get_key_id $1
        return $?
    fi
    local num; local wps; local cps; local dbp; local cfp; local blexp
    read_install_params_to_vars || return 10
    cont_exec $BF_CONT_NAME "bash -c 'for i in \$(seq 1 $num); do echo -n \"\$i: \" && key_id_path=\"$BE_ROOT_DATA_DIR/node\$i/KeyID\" && [ -e \"\$key_id_path\" ]  && cat \"\$key_id_path\" && echo; done'"
}

get_pub_key() {
    [ -z "$1" ] && echo "The index number of a backend isn't set" && return 1
    local idx; idx="$1"
    local num; local wps; local cps; local dbp; local cfp; local blexp
    read_install_params_to_vars || return 2
    [ $idx -gt $num ] && echo "The total number of backends is $num" && return 3
    local pub_key_path; pub_key_path="$BE_ROOT_DATA_DIR/node$1/PublicKey"; local result
    cont_exec $BF_CONT_NAME "bash -c '[ -e \"$pub_key_path\" ] && cat \"$pub_key_path\"'"
    result=$?
    [ $result -ne 0 ] && echo "File '$pub_key_path' doesn't exist @ container '$BF_CONT_NAME'" && return $result
    echo
}

get_pub_keys() {
    if [ -n "$1" ]; then 
        get_pub_key $1
        return $?
    fi
    local num; local wps; local cps; local dbp; local cfp; local blexp
    read_install_params_to_vars || return 10
    cont_exec $BF_CONT_NAME "bash -c 'for i in \$(seq 1 $num); do echo -n \"\$i: \" && pub_key_path=\"$BE_ROOT_DATA_DIR/node\$i/PublicKey\" && [ -e \"\$pub_key_path\" ]  && cat \"\$pub_key_path\" && echo; done'"
}

get_first_n_pub_keys() {
    local n
    if [ -n "$1" ]; then
        get_pub_keys |  tail -n +1 | head -n $1
    else
        get_pub_keys
    fi
}

get_node_pub_key() {
    [ -z "$1" ] && echo "The index number of a backend isn't set" && return 1
    local idx; idx="$1"
    local num; local wps; local cps; local dbp; local cfp; local blexp
    read_install_params_to_vars || return 2
    [ $idx -gt $num ] && echo "The total number of backends is $num" && return 3
    local pub_key_path; pub_key_path="$BE_ROOT_DATA_DIR/node$1/NodePublicKey"; local result
    cont_exec $BF_CONT_NAME "bash -c '[ -e \"$pub_key_path\" ] && cat \"$pub_key_path\"'"
    result=$?
    [ $result -ne 0 ] && echo "File '$pub_key_path' doesn't exist @ container '$BF_CONT_NAME'" && return $result
    echo
}

get_node_pub_keys() {
    if [ -n "$1" ]; then 
        get_node_pub_key $1
        return $?
    fi
    local num; local wps; local cps; local dbp; local cfp; local blexp
    read_install_params_to_vars || return 10
    cont_exec $BF_CONT_NAME "bash -c 'for i in \$(seq 1 $num); do echo -n \"\$i: \" && pub_key_path=\"$BE_ROOT_DATA_DIR/node\$i/NodePublicKey\" && [ -e \"\$pub_key_path\" ]  && cat \"\$pub_key_path\" && echo; done'"
}


check_http_priv_key() {
    local result; local out; out=$(get_http_priv_key $@) > /dev/null; result=$?
    [ $result -ne 0 ] && ([ -n "$out" ] && echo "$out" || :) && return $result
    echo "ok"
}

get_api_url() {
    [ -z "$1" ] && echo "The index number of a backend isn't set" && return 1
    local idx; idx="$1"
    local num; local wps; local cps; local dbp; local cfp; local blexp
    read_install_params_to_vars || return 2
    [ $idx -gt $num ] && echo "The total number of backends is $num" && return 3
    [ -z "$cps" ] && cps=$CLIENT_PORT_SHIFT
    local c_port
    c_port=$(expr $idx + $cps)
    echo "http://127.0.0.1:$c_port/api/v2"
}

get_api_urls() {
    if [ -n "$1" ]; then 
        get_api_url $1
        return $?
    fi
    local num; local wps; local cps; local dbp; local cfp; local blexp
    read_install_params_to_vars || return 10
    [ -z "$cps" ] && cps=$CLIENT_PORT_SHIFT

    local i c_port
    for i in $(seq 1 $num); do
        c_port=$(expr $i + $cps)
        echo "$i: http://127.0.0.1:$c_port/api/v2"
    done
}

get_int_api_url() {
    [ -z "$1" ] && echo "The index number of a backend isn't set" && return 1
    local idx; idx="$1"
    local num; local wps; local cps; local dbp; local cfp; local blexp
    read_install_params_to_vars || return 2
    [ $idx -gt $num ] && echo "The total number of backends is $num" && return 3
    cps=7000
    local c_port
    c_port=$(expr $idx + $cps)
    echo "http://127.0.0.1:$c_port/api/v2"
}

get_int_api_urls() {
    if [ -n "$1" ]; then 
        get_int_api_url $1
        return $?
    fi
    local num; local wps; local cps; local dbp; local cfp; local blexp
    read_install_params_to_vars || return 10
    cps=7000
    local i c_port
    for i in $(seq 1 $num); do
        c_port=$(expr $i + $cps)
        echo "$i: http://127.0.0.1:$c_port/api/v2"
    done
}

get_int_tcp_addr() {
    [ -z "$1" ] && echo "The index number of a backend isn't set" && return 1
    local idx; idx="$1"
    local num; local wps; local cps; local dbp; local cfp; local blexp
    read_install_params_to_vars || return 2
    [ $idx -gt $num ] && echo "The total number of backends is $num" && return 3
    if [ $idx -eq 1 ]; then
        echo "127.0.0.1:7078"
    else
        cps=7010
        local c_port
        c_port=$(expr $idx + $cps)
        echo "127.0.0.1:$c_port"
    fi
}

get_int_tcp_addrs() {
    if [ -n "$1" ]; then 
        get_int_tcp_addr $1
        return $?
    fi
    local i num wps cps dbp cfp blexp
    read_install_params_to_vars || return 10
    for i in $(seq 1 $num); do
        echo "$i: $(get_int_tcp_addr $i)"
    done
}

check_http_priv_key() {
    local result; local out; out=$(get_http_priv_key $@) > /dev/null; result=$?
    [ $result -ne 0 ] && ([ -n "$out" ] && echo "$out" || :) && return $result
    echo "ok"
}


wait_http_priv_key() {
    local url_tpl; url_tpl="$1"
    local idx; idx="$2"
    local codes; codes="$3"
    local min_len; min_len="$4"
    local timeout_secs; [ -z "$5" ] && timeout_secs=15 || timeout_secs=$5
    local wps; wps=$6
    local end_time; end_time=$(( $(date +%s) + timeout_secs ))

    echo "Waiting ($timeout_secs seconds) for PrivateKey from backend number '$idx' ..."

    local cnt; cnt=1
    local stop; stop=0
    local result; result=0
    while [ $stop -eq 0 ]; do
        [ $cnt -gt 1 ] && sleep 1
        echo -n "    try $cnt: "
        check_http_priv_key "$url_tpl" $idx "$codes" $min_len $wps; result=$?
        case $result in
            0|1|2|3|4|5|9|10) stop=1 ;;
            5|6|7|8) [ $(date +%s) -lt $end_time ] || stop=1 ;;
        esac
        cnt=$(expr $cnt + 1)
    done
    return $result
}

check_cont_http_len() {
    [ -z "$1" ] && echo "Container name isn't set" && return 1
    [ -z "$2" ] && echo "URL isn't set" && return 2
    [ -z "$3" ] && echo "List of OK codes isn't set" \
        && return 3
    [ -z "$4" ] && echo "Content-Length minimal size (bytes) isn't set" \
        && return 4
    check_cont "$1" > /dev/null; [ $? -ne 0 ] \
        && echo "Container '$1' isn't available " && return 5
    local resp; resp="$(docker exec -t "$1" curl -sv "$2" --stderr -)"
    [ -n "$(echo "$resp" | grep "Could not resolve host")" ] \
        && echo "Could not resolve host" && return 6
    [ -n "$(echo "$resp" | grep "failed: Connection refused")" ] \
        && echo "HTTP Connection refused" && return 7
    local code; code="$(echo "$resp" | $SED_E -n 's/^< HTTP[^ ]* ([0-9]+)[^0-9]+.*$/\1/gp')"
    local c; local result; result=1; IFS=','
    for c in $3; do
        [ "$c" = "$code" ] && result=0 && break
    done
    unset IFS;
    [ $result -ne 0 ] && echo "Bad HTTP Response code '$code' (OK-codes: '$3')" && return 8
    local len; len="$(echo "$resp" | $SED_E -n 's/^[^C]*Content-Length: ([0-9]+)[^0-9]*.*$/\1/gp')"
    [ -z "$len" ] && echo "No Content-Length in HTTP response" && return 9
    [ $len -lt $4 ] && echo "HTTP Content-Length '$len' is lesser than minimal '$3'" && return 10
    echo "ok"
    return 0
}

wait_cont_http_len() {
    local cont_name; cont_name="$1"
    local url; url="$2"
    local codes; codes="$3"
    local min_len; min_len="$4"
    local timeout_secs; [ -z "$5" ] && timeout_secs=15 || timeout_secs="$5"
    local end_time; end_time=$(( $(date +%s) + timeout_secs ))

    echo "Waiting ($timeout_secs seconds) for HTTP response with one of OK-code ($codes) and Content-Length more or equal to '$min_len' bytes to URL '$url' request @ container '$cont_name' ..."

    local cnt; cnt=1
    local stop; stop=0;
    local result; result=0;
    while [ $stop -eq 0 ]; do
        [ $cnt -gt 1 ] && sleep 1
        echo -n "    try $cnt: "
        check_cont_http_len "$cont_name" "$url" "$codes" "$min_len"; result=$?
        case $result in
            0|1|2|3|4|6|9|10) stop=1 ;;
            5|7|8) [ $(date +%s) -lt $end_time ] || stop=1 ;;
        esac
        cnt=$(expr $cnt + 1)
    done
    return $result
}

check_centrifugo_status() {
    echo "Checking centrifugo ..."
    check_cont_http_code $CF_CONT_NAME http://127.0.0.1:8000/connection/ 200
    [ $? -ne 0 ] && echo "centrifugo isn't ready" && exit 200 \
        || echo "Centrifugo ready"
}

wait_centrifugo_status() {
    local result
    wait_cont_http_code $CF_CONT_NAME http://127.0.0.1:8000/connection/ 200 15
    result=$?
    [ $result -ne 0 ] && echo "  centrifugo isn't ready" \
        || echo "  centrifugo ready"
    return $result
}

### Update ### 20180405 ### 08fad ### begin ###

check_backend_apps_status() {
    local i num; num=$1
    local app_name result; result=0
    echo "Checking backends ..."
    for i in $(seq 1 $num); do
        [ $i -eq 1 ] && app_name="$BE_BIN_BASENAME" \
            || app_name="$BE_BIN_BASENAME$i"
        echo -n "  backend number $i status: "
        # TODO: use CONT_CLIENT_PORT_SHIFT here
        check_cont_http_len $BF_CONT_NAME http://127.0.0.1:700$i/api/v2/getuid 200,201 100 
    done
    [ $result -ne 0 ] && echo "backends arn't ready" && exit 200 \
        || echo "Backends ready"
}

wait_backend_apps_status() {
    local i num; num=$1
    local app_name result; result=0
    for i in $(seq 1 $num); do
        [ $i -eq 1 ] && app_name="$BE_BIN_BASENAME" \
            || app_name="$BE_BIN_BASENAME$i"
        # TODO: use CONT_CLIENT_PORT_SHIFT here
        wait_cont_http_len $BF_CONT_NAME http://127.0.0.1:700$i/api/v2/getuid 200,201 100 120
        [ $? -ne 0 ] && echo "  backend number $i isn't ready" \
            && result=1 \
            || echo "  backend number $i ready"
    done
    [ $result -ne 0 ] && echo "backends arn't ready" && exit 200 \
        || echo "Backends ready"
}

backend_app_ctl() {
    local ind; [ -z "$1" ] && echo "Backend index number isnt' set" && return 1 \
        || ind=$1
    local cmd; [ -z "$2" ] && echo "Command isn't set" \
        && echo "Available commands: status, stop, start, restart" \
        && return 2 || cmd="$2"

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 3

    local app_name; local result; result=0; local rcmd
    [ $ind -eq 1 ] && app_name="$BE_BIN_BASENAME" \
        || app_name="$BE_BIN_BASENAME$ind"
    case "$cmd" in
        status|stop|start|restart)
            rcmd="supervisorctl $cmd $app_name"
            ;;
        *)
            echo "Available commands: status, stop, start, restart"
            return 4
            ;;
    esac
    echo "Backend #$ind, starting '$rcmd' ..."
    docker exec -ti $BF_CONT_NAME bash -c "$rcmd"
    [ $? -ne 0 ] && result=4
    return $result
}

backend_apps_ctl() {
    local num; [ -z "$1" ] && echo "Number of backends isnt' set" && return 1 \
        || num=$1
    local cmd; [ -z "$2" ] && echo "Command isn't set" \
        && echo "Available commands: status, stop, start, restart" \
        && return 2 || cmd="$2"

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 3

    local i app_name result rcmd; result=0
    for i in $(seq 1 $num); do
        [ $i -eq 1 ] && app_name="$BE_BIN_BASENAME" \
            || app_name="$BE_BIN_BASENAME$i"
        case "$cmd" in
            status|stop|start|restart)
                rcmd="supervisorctl $cmd $app_name"
                ;;
            *)
                echo "Available commands: status, stop, start, restart"
                return 4
                ;;
        esac
        echo "Backend number $i, starting '$rcmd' ..."
        docker exec -ti $BF_CONT_NAME bash -c "$rcmd"
        [ $? -ne 0 ] && result=4
    done
    return $result
}

### Update ### 20180405 ### 08fad #### end ####

check_frontend_apps_status() {
    local i num; num=$1
    local result; result=0
    echo "Checking frontends ..."
    for i in $(seq 1 $num); do
        echo -n "  frontend number $i status: "
        # TODO: use CONT_WEB_PORT_SHIFT here
        check_cont_http_code $BF_CONT_NAME http://127.0.0.1:8$i/ 200,201
    done
    [ $result -ne 0 ] && echo "nginx frontends arn't ready" && exit 210 \
        || echo "Frontends ready"
}

wait_frontend_apps_status() {
    local i num; num=$1
    local result; result=0
    for i in $(seq 1 $num); do
        # TODO: use CONT_WEB_PORT_SHIFT here
        wait_cont_http_code $BF_CONT_NAME http://127.0.0.1:8$i/ 200,201 20
        [ $? -ne 0 ] && echo "  nginx frontend number $i isn't ready" \
            && result=1 \
            || echo "  nginx frontend number $i ready"
    done
    [ $result -ne 0 ] && echo "nginx frontends arn't ready" && exit 210 \
        || echo "Frontends ready"
}

### Update ### 20180405 ### 08fad ### begin ###

check_update_mbs_script() {
    local i srcs dsts do_copy
    srcs[0]="$SCRIPT_DIR/$BF_CONT_BUILD_DIR$SCRIPTS_DIR/manage_bf_set.sh"
    dsts[0]="$SCRIPTS_DIR/manage_bf_set.sh"

    srcs[1]="$SCRIPT_DIR/$BF_CONT_BUILD_DIR/scripts.config.sh"
    dsts[1]="$SCRIPTS_DIR/.env"

    for i in $(seq 0 $(expr ${#srcs[@]} - 1)); do
        do_copy="no"
        docker exec -t $BF_CONT_NAME bash -c "[ -e '${dsts[$i]}' ]" 
        if [ $? -ne 0 ]; then
            do_copy="yes"
        fi
        if [ "$do_copy" = "yes" ] || [ "$FORCE_COPY_MBS_SCRIPT" = "yes" ]; then
            if [ -e "${srcs[$i]}" ]; then
                echo "Copying '${srcs[$i]}' to '${dsts[$i]}' @ '$BF_CONT_NAME' ..."
                docker cp "${srcs[$i]}" $BF_CONT_NAME:${dsts[$i]}
            else
                echo "No '${srcs[$i]}' @ host system. Please create it first." \
                    && return 1
            fi
        fi
    done
}

run_mbs_cmd() {
    local i num cmd rmt_path
    check_update_mbs_script || return $?
    rmt_path="$SCRIPTS_DIR/manage_bf_set.sh"
    docker exec -ti $BF_CONT_NAME bash $rmt_path $@
}

check_update_mblex_script() {
    local i srcs dsts do_copy
    srcs[0]="$SCRIPT_DIR/$BLEX_CONT_BUILD_DIR$SCRIPTS_DIR/manage_blex.sh"
    dsts[0]="$SCRIPTS_DIR/manage_blex.sh"

    for i in $(seq 0 $(expr ${#srcs[@]} - 1)); do
        do_copy="no"
        docker exec -t $BLEX_CONT_NAME bash -c "[ -e '${dsts[$i]}' ]" 
        if [ $? -ne 0 ]; then
            do_copy="yes"
        fi
        if [ "$do_copy" = "yes" ] || [ "$FORCE_COPY_MBLEX_SCRIPT" = "yes" ]; then
            if [ -e "${srcs[$i]}" ]; then
                echo "Copying '${srcs[$i]}' to '${dsts[$i]}' @ '$BLEX_CONT_NAME' ..."
                docker cp "${srcs[$i]}" $BLEX_CONT_NAME:${dsts[$i]}
            else
                echo "No '${srcs[$i]}' @ host system. Please create it first." \
                    && return 1
            fi
        fi
    done
}

run_mblex_cmd() {
    local num cmd rmt_path
    check_update_mblex_script || return $?
    rmt_path="$SCRIPTS_DIR/manage_blex.sh"
    docker exec -ti $BLEX_CONT_NAME bash $rmt_path $@
}

reread_blex_supervisor() {
    check_cont $BLEX_CONT_NAME > /dev/null \
    && docker exec -t $BLEX_CONT_NAME bash -c "supervisorctl reread"
}

update_blex_supervisor() {
    check_cont $BLEX_CONT_NAME > /dev/null \
    && docker exec -t $BLEX_CONT_NAME bash -c "supervisorctl update"
}

restart_blex() {
    check_cont $BLEX_CONT_NAME > /dev/null \
    && echo "Restarting blockexplorer ..." \
    && docker exec -t $BLEX_CONT_NAME bash -c "supervisorctl restart blockexplorer" \
    && docker exec -t $BLEX_CONT_NAME bash -c "supervisorctl restart blockexplorer-worker"
}

start_blex() {
    check_cont $BLEX_CONT_NAME > /dev/null \
    && echo "Starting blockexplorer ..." \
    && docker exec -t $BLEX_CONT_NAME bash -c "supervisorctl start blockexplorer" \
    && docker exec -t $BLEX_CONT_NAME bash -c "supervisorctl start blockexplorer-worker"
}

stop_blex() {
    check_cont $BLEX_CONT_NAME > /dev/null \
    && echo "Stopping blockexplorer ..." \
    && docker exec -t $BLEX_CONT_NAME bash -c "supervisorctl stop blockexplorer" \
    && docker exec -t $BLEX_CONT_NAME bash -c "supervisorctl stop blockexplorer-worker"
}

#create_blex_dbs() {
#    local i num wps cps dbp cfp blexp db_name
#    read_install_params_to_vars || return $? 
#    check_cont $DB_CONT_NAME > /dev/null \
#    run_mblex_cmd create-dbs $num
#    for i in $(seq 1 $num); do
#        db_name="$BLEX_DB_NAME_PREFIX$i"
#        echo "Creating '$db_name' database @ '$DB_CONT_NAME' ..."
#        docker exec -ti $DB_CONT_NAME bash /db.sh create postgres "$db_name"
#    done
#}

setup_blex() {
    local num blexp
    num="$1"; [ -z "$2" ] && blexp="$CONT_BLEX_PORT" || blexp="$2"
    create_blex_dbs $num
    run_mblex_cmd config $num $blexp
    run_mblex_cmd create-sv-conf
    run_mblex_cmd create-wrk-sv-conf
    reread_blex_supervisor && update_blex_supervisor
}

setup_be_apps() {
    docker exec -t $BF_CONT_NAME bash -c "supervisorctl update && supervisorctl reload"
    local suffix
    [ "$EMPTY_ENV_VARS" = "yes" ] && suffix="-eev" || suffix=""
    #run_mbs_cmd create-configs$suffix $1 \
    run_mbs_cmd create-configs2$suffix $1 \
        && run_mbs_cmd gen-keys$suffix $1 \
        && run_mbs_cmd gen-first-block$suffix $1 \
        && run_mbs_cmd init-dbs$suffix $1 \
        && run_mbs_cmd setup-sv-configs$suffix $1 \
        docker exec -t $BF_CONT_NAME bash -c "supervisorctl update"
}

init_be_dbs() {
    local suffix num
    [ -z "$1" ] && echo "Number of backends isnt' set" && return 1 || num=$1
    [ "$EMPTY_ENV_VARS" = "yes" ] && suffix="-eev" || suffix=""
    stop_blex \
        && backend_apps_ctl "$num" "stop" \
        && run_mbs_cmd init-dbs$suffix $num \
        && backend_apps_ctl "$num" "start" \
        && start_blex
}

# FIXIT: BACKEND: fix backend to get back to normal start without restartes
keep_restart_be_apps_on_error() {
    local num result i error_codes cnt _stop max_tries
    [ -z "$1" ] \
        && echo "The number of backends isn't set" && return 1 \
        || num=$1
    [ -z "$2" ] \
        && echo "The error codes isn't set" && return 2 \
        || error_codes="$2"
    [ -z "$3" ] && max_tries="5" || max_tries="$3"

    echo "Checking backends are not in ${error_codes}-error(s) state ..."
    cnt=1
    max_tries=5
    _stop=1
    while [ $_stop -eq 1 ]; do
        echo -n "  try $cnt/$max_tries: "
        [ $cnt -ge $max_tries ] && _stop=0
        result=0
        for i in $(seq 1 $num); do
            if check_cont_http_code $BF_CONT_NAME http://127.0.0.1:700$i/api/v2/getuid $error_codes > /dev/null; then
                echo
                echo "        found backend #$i is in 503-error state, restarting ..."
                result=1
                [ $i -eq 1 ] && app_name="$BE_BIN_BASENAME" \
                    || app_name="$BE_BIN_BASENAME$i"
                docker exec -t $BF_CONT_NAME bash -c "supervisorctl restart $app_name"
            fi
        done
        [ $result -eq 0 ] && echo "ok" && _stop=0
        cnt="$(expr $cnt + 1)"
    done
}

start_be_apps() {
    local num; [ -z "$1" ] \
        && echo "The number of backends isn't set" && return 1 \
        || num=$1
    local cps; [ -z "$2" ] && cps=$CLIENT_PORT_SHIFT || cps=$2

    echo "Starting backend applications ..."
    for i in $(seq 1 $num); do
        [ $i -eq 1 ] && app_name="$BE_BIN_BASENAME" \
            || app_name="$BE_BIN_BASENAME$i"
        docker exec -t $BF_CONT_NAME bash -c "supervisorctl start $app_name"
    done
    keep_restart_be_apps_on_error $num 503 10 || return 2
    #echo "Restarting backend applications ..."
    #for i in $(seq 1 $num); do
    #    [ $i -eq 1 ] && app_name="$BE_BIN_BASENAME" \
    #       || app_name="$BE_BIN_BASENAME$i"
    #    docker exec -t $BF_CONT_NAME bash -c "supervisorctl restart $app_name"
    #done
    wait_backend_apps_status $num || return 3
}

start_be_apps_normal() {
    local num; [ -z "$1" ] \
        && echo "The number of backends isn't set" && return 1 \
        || num=$1
    local cps; [ -z "$2" ] && cps=$CLIENT_PORT_SHIFT || cps=$2

    echo "Starting backend applications ..."
    for i in $(seq 1 $num); do
        [ $i -eq 1 ] && app_name="$BE_BIN_BASENAME" \
            || app_name="$BE_BIN_BASENAME$i"
        docker exec -t $BF_CONT_NAME bash -c "supervisorctl start $app_name"
    done
    wait_backend_apps_status $num || return 2
}

stop_be_app() {
    local ind app_name
    [ -z "$1" ] && echo "The backend index number isn't set"  && return 1
    ind="$1"
    echo "Stopping backend #$ind ..."
    [ $ind -eq 1 ] && app_name="$BE_BIN_BASENAME" \
        || app_name="$BE_BIN_BASENAME$ind"
    docker exec -t $BF_CONT_NAME bash -c "supervisorctl stop $app_name"
}

start_be_app() {
    local ind app_name
    [ -z "$1" ] && echo "The backend index number isn't set"  && return 1
    ind="$1"
    echo "Starting backend #$ind ..."
    [ $ind -eq 1 ] && app_name="$BE_BIN_BASENAME" \
        || app_name="$BE_BIN_BASENAME$ind"
    docker exec -t $BF_CONT_NAME bash -c "supervisorctl start $app_name"
}

restart_be_app() {
    local ind app_name
    [ -z "$1" ] && echo "The backend index number isn't set"  && return 1
    ind="$1"
    echo "Restarting backend #$ind ..."
    [ $ind -eq 1 ] && app_name="$BE_BIN_BASENAME" \
        || app_name="$BE_BIN_BASENAME$ind"
    docker exec -t $BF_CONT_NAME bash -c "supervisorctl restart $app_name"
}

stop_be_apps() {
    [ -z "$1" ] && echo "The number of backends isn't set"  && return 1
    echo "Stopping backend applications ..."
    local app_name
    for i in $(seq 1 $1); do
        [ $i -eq 1 ] && app_name="$BE_BIN_BASENAME" \
            || app_name="$BE_BIN_BASENAME$i"
        docker exec -t $BF_CONT_NAME bash -c "supervisorctl stop $app_name"
    done
}

setup_fe_apps() {
    local num cps rmt_path
    [ -z "$1" ] && echo "The number of frontends isn't set"  && return 1
    num="$1"
    [ -z "$2" ] && cps="$CLIENT_PORT_SHIFT" || cps="$2"
    check_update_mbs_script || return $?
    rmt_path="$SCRIPTS_DIR/manage_bf_set.sh"
    docker exec -ti $BF_CONT_NAME bash -c "$rmt_path setup-frontends $num $cps"
}

start_fe_apps() {
    local num cps stat rmt_path
    [ -z "$1" ] && echo "The number of frontends isn't set"  && return 1
    num="$1"
    [ -z "$2" ] && cps="$CLIENT_PORT_SHIFT" || cps="$2"
    rmt_path="$SCRIPTS_DIR/manage_bf_set.sh"
    stat="$(docker exec -ti $BF_CONT_NAME \
        sh -c 'supervisorctl status nginx' | awk '{print $2}')"
    if [ "$stat" != "RUNNING" ]; then
        docker exec -ti $BF_CONT_NAME sh -c 'supervisorctl start nginx'
    fi
    wait_frontend_apps_status $num || return $?
}

### Update ### 20180405 ### 08fad #### end ####

stop_fe_apps() {
    [ -z "$1" ] && echo "The number of frontends isn't set"  && return 1
    echo "Stopping frontend applications ..."
    docker exec -t $BF_CONT_NAME bash -c "supervisorctl stop nginx"
}

check_host_side() {
    local num; ([ -z "$1" ] || [ $1 -eq 0 ]) && return 1 || num=$1
    local wps; [ -z "$2" ] && wps=$WEB_PORT_SHIFT || wps=$2
    local cps; [ -z "$3" ] && cps=$CLIENT_PORT_SHIFT || cps=$3
    local dbp; [ -z "$4" ] && dbp=$DB_PORT || dbp=$4
    local cfp; cfp=$CF_PORT # FIXME: Change to argument
    local blexp; blexp=$BLEX_PORT # FIXME: Change to argument

    echo "The host system listens on:"
    echo

    local d_result; d_result=0
    echo "  Database port: $dbp" 
    echo -n "    checking: "
    [ -n "$(get_host_port_proc $dbp)" ] && echo "ok" \
        || (echo "error" && d_result=1)
    echo

    local cf_result; cf_result=0
    echo "  Centrifugo port: $cfp" 
    echo -n "    checking: "
    [ -n "$(check_http_code "http://127.0.0.1:$cfp/connection/" 200)" ] && echo "ok" \
        || (echo "error" && cf_result=1)
    echo

    local rq_result; rq_result=0
    echo "  Redis port: $REDIS_HOST_PORT" 
    echo -n "    checking: "
    [ -n "$(get_host_port_proc $REDIS_HOST_PORT)" ] && echo "ok" \
        || (echo "error" && rq_result=1)
    echo


    local blex_result; blex_result=0
    echo "  Block explorer port: $blexp" 
    echo -n "    checking: "
    [ -n "$(check_http_code "http://127.0.0.1:$blexp" 200)" ] && echo "ok" \
        || (echo "error" && blex_result=1)

    local w_result; w_result=0
    echo
    echo "  Web ports: "
    local w_port
    for i in $(seq 1 $num); do
        w_port=$(expr $i + $wps)
        echo -n "    checking (private key) $w_port: "
        check_http_priv_key "http://127.0.0.1:PORT/keys/PrivateKey" $i 200 64 $wps
        [ $? -ne 0 ] && w_result=1
    done

    local c_result; c_result=0
    echo
    echo "  Client ports: "
    local c_port
    for i in $(seq 1 $num); do
        c_port=$(expr $i + $cps)
        echo -n "    checking (getuid) $c_port: "
        check_http_len http://127.0.0.1:$c_port/api/v2/getuid 200,201 100
        [ $? -ne 0 ] && c_result=1
    done
    echo

    local result; result=0
    [ $d_result -ne 0 ] || [ $w_result -ne 0 ] && result=1
    [ $cf_result -ne 0 ] || [ $cf_result -ne 0 ] && result=3
    [ $rq_result -ne 0 ] || [ $rq_result -ne 0 ] && result=3
    [ $blex_result -ne 0 ] || [ $blex_result -ne 0 ] && result=5
    [ $c_result -ne 0 ] && result=2
    echo -n "Total check result: "
    [ $result -ne 0 ] && echo "FAILED" || echo "OK"
    return $result
}

### Update ### 20180405 ### 08fad ### begin ###

tail_be_log() {
    local log_basename log_dirname log_path
    [ -z "$1" ] && echo "Backend's number isn't set" && return 1
    log_basename="node$1.log"

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    log_dirname="$BE_ROOT_DATA_DIR/node$1"
    docker exec -t $BF_CONT_NAME bash -c "[ -d '$log_dirname' ]"
    [ $? -ne 0 ] && echo "No log dir '$log_dirname'" && return 3

    log_path="$log_dirname/$log_basename"
    docker exec -t $BF_CONT_NAME bash -c "[ -e '$log_path' ]"
    [ $? -ne 0 ] && echo "No log file '$log_path'" && return 4

    docker exec -ti $BF_CONT_NAME bash -c "tail -f $log_path"
}
### Update ### 20180405 ### 08fad #### end ####

cp_be_log() {
    local log_basename log_dirname log_path dst_path _dst_path
    [ -z "$1" ] && echo "Backend's number isn't set" && return 1
    log_basename="node$1.log"

    [ -z "$2" ] && dst_path="." || dst_path="$2"

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    log_dirname="$BE_ROOT_DATA_DIR/node$1"
    docker exec -t $BF_CONT_NAME bash -c "[ -d '$log_dirname' ]"
    [ $? -ne 0 ] && echo "No log dir '$log_dirname'" && return 3

    log_path="$log_dirname/$log_basename"
    docker exec -t $BF_CONT_NAME bash -c "[ -e '$log_path' ]"
    [ $? -ne 0 ] && echo "No log file '$log_path'" && return 4

    [ "$dst_path" = "." ] \
        && _dst_path="./$log_basename" \
        || _dst_path="$dst_path"
    echo "Copying backend #$1 log from container '$BF_CONT_NAME' to the host path '$_dst_path' ..."
    docker cp "$BF_CONT_NAME:$log_path" "$dst_path"
}

cp_be_logs() {
    local num  wps cps dbp cfp blexp dst_dir
    [ -z "$1" ] && dst_dir="." || dst_dir="$1"
    if [ ! -e "$dst_dir" ]; then
        mkdir -p "$dst_dir" || return $?
    fi

    read_install_params_to_vars || return $? 

    for i in $(seq $num); do
        echo "Copying backend #$i log from container '$BF_CONT_NAME' to the host dir '$dst_dir' ..."
        (cd "$dst_dir" && cp_be_log $i > /dev/null) || return 10
    done
}

null_be_log() {
    local log_basename log_dirname log_path
    [ -z "$1" ] && echo "Backend's number isn't set" && return 1
    log_basename="node$1.log"

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    log_dirname="$BE_ROOT_DATA_DIR/node$1"
    docker exec -t $BF_CONT_NAME bash -c "[ -d '$log_dirname' ]"
    [ $? -ne 0 ] && echo "No log dir '$log_dirname'" && return 3

    log_path="$log_dirname/$log_basename"
    docker exec -t $BF_CONT_NAME bash -c "[ -e '$log_path' ]"
    [ $? -ne 0 ] && echo "No log file '$log_path'" && return 4

    echo "Nulling backend #$1 log @ container '$BF_CONT_NAME' ..."
    docker exec -t $BF_CONT_NAME bash -c "cp /dev/null '$log_path'"
}

null_be_logs() {
    local num wps cps dbp cfp blexp dst_dir
    [ -z "$1" ] && dst_dir="." || dst_dir="$1"
    if [ ! -e "$dst_dir" ]; then
        mkdir -p "$dst_dir" || return $?
    fi

    read_install_params_to_vars || return $? 

    for i in $(seq $num); do
        null_be_log $i || return $?
    done
}

install_postgresql_dump_requirements() {
    check_cont $DB_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Database container isn't ready" \
        && return 2

    docker exec -ti $DB_CONT_NAME bash -c "[ ! "$(command -v sudo)" ] && apt update -f && apt install -y sudo || :"
    docker exec -ti $DB_CONT_NAME bash -c "[ -z \`getent passwd | grep -E '^postgres:x'\` ] && useradd -m -u 102 -s /bin/bash -d /var/lib/postgresql -c 'PostgreSQL administrator' postgres || :"
}

dump_be_db() {
    local ind db_name db_dump_path dst_path _dst_path
    [ -z "$1" ] && echo "Backend's number isn't set" && return 1
    ind="$1"
    db_name="$DB_NAME_PREFIX$ind"

    [ -z "$2" ] && dst_path="." || dst_path="$2"

    install_postgresql_dump_requirements || return $?

    db_dump_path="/tmp/db_dump.$(date '+%Y%m%d%H%M%S').sql"
    [ "$dst_path" = "." ] \
        && _dst_path="./$(basename "$db_dump_path")" \
        || _dst_path="$dst_path"
    echo "Creating database dump into temporary file '$db_dump_path' ..."
    docker exec -ti $DB_CONT_NAME bash -c "sudo -u postgres PGPASSWORD=$DB_PASSWORD pg_dump -h localhost -U $DB_USER $db_name -f $db_dump_path" \
    && echo "Copying backend #$ind database dump from container '$BF_CONT_NAME:$db_dump_path' to the host path '$_dst_path' ..." \
    && docker cp "$DB_CONT_NAME:$db_dump_path" "$_dst_path" \
    && echo "Removing temporary file '$db_dump_path' ..." \
    && docker exec -ti $DB_CONT_NAME bash -c "rm '$db_dump_path'"
}

dump_be_dbs() {
    local num wps cps dbp cfp blexp dst_dir
    [ -z "$1" ] && dst_dir="./db-dumps-$(date '+%Y%m%d%H%M%S')" || dst_dir="$1"
    if [ ! -e "$dst_dir" ]; then
        mkdir -p "$dst_dir" || return $?
    fi

    read_install_params_to_vars || return $? 

    for i in $(seq $num); do
        echo "Dumping backend #$i database  from container '$BF_CONT_NAME' to the host dir '$dst_dir' ..."
        (cd "$dst_dir" && dump_be_db $i "./be-db.$i.sql" > /dev/null) || return 10
    done
}

safe_dump_be_db() {
    local ind answ app_name dst_path
    [ -z "$1" ] && echo "Backend's number isn't set" && return 1
    ind="$1"
    [ -z "$2" ] && dst_path="." || dst_path="$2"

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    [ $ind -eq 1 ] && app_name="$BE_BIN_BASENAME" \
        || app_name="$BE_BIN_BASENAME$i"
    echo
    echo -n "Are you sure you want to start db dump process (backend will be stopped) [y/n]? "
    read -n 1 answ
    case $answ in
        y|Y)
            echo
            stop_clients \
                && stop_blex \
                && stop_be_app $ind \
                && restart_db_server \
                && dump_be_db $ind "$dst_path" \
                && start_be_app $ind \
                && start_blex \
                && start_clients
            ;;
        *) echo; echo "OK, canceling db dump process ..." ;;
    esac
}

safe_dump_be_dbs() {
    local num wps cps dbp cfp blexp dst_dir ind app_name
    read_install_params_to_vars || return $? 

    dst_dir="$1"

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    echo
    echo -n "Are you sure you want to start dbs dump process (backends will be stopped) [y/n]? "
    read -n 1 answ
    case $answ in
        y|Y)
            echo
            stop_clients \
                && stop_blex \
                && stop_be_apps $num \
                && restart_db_server \
                && dump_be_dbs \
                && start_be_apps $num \
                && start_blex \
                && start_clients \
            ;;
        *) echo; echo "OK, canceling dbs dump process ..." ;;
    esac
}

fast_safe_dump_be_dbs() {
    local num wps cps dbp cfp blexp dst_dir ind app_name
    read_install_params_to_vars || return $? 

    dst_dir="$1"

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    echo
    stop_blex \
        && stop_be_apps $num \
        && restart_db_server \
        && dump_be_dbs \
        && start_be_apps $num \
        && start_blex
}

drop_blex_db() {
    local ind db_name
    [ -z "$1" ] && echo "Backend's number isn't set" && return 1
    ind="$1"

    install_postgresql_dump_requirements || return $?

    db_name="$BLEX_DB_NAME_PREFIX$ind"

    check_db_exists "$db_name"
    [ $? -eq 3 ] && return 0

    echo "Dropping database '$db_name' @ container '$DB_CONT_NAME' ..."
    docker exec -ti $DB_CONT_NAME bash -c "sudo -u postgres PGPASSWORD=$DB_PASSWORD dropdb -h localhost -U $DB_USER $db_name"
}

drop_blex_dbs() {
    local num wps cps dbp cfp blexp max_tries res
    read_install_params_to_vars || return $? 

    max_tries=10
    for i in $(seq $num); do
        cnt=1
        while true; do
            echo "Dropping DB (try $cnt/$max_tries) ... "
            drop_blex_db $i; res=$?
            [ $res -eq 0 ] && echo "DB has been successfully dropped" \
                && break
            [ $cnt -ge $max_tries ] \
                && echo "Error: Dropping DB max tries exceeded" && return 1
            sleep 1
            cnt=$(expr $cnt + 1)
        done
    done
}

create_blex_db() {
    local ind db_name
    [ -z "$1" ] && echo "Backend's number isn't set" && return 1
    ind="$1"

    install_postgresql_dump_requirements || return $?

    db_name="$BLEX_DB_NAME_PREFIX$ind"

    echo "Creating database '$db_name' @ container '$DB_CONT_NAME' ..."
    docker exec -ti $DB_CONT_NAME bash -c "sudo -u postgres PGPASSWORD=$DB_PASSWORD createdb -h localhost -U $DB_USER -O $DB_USER $db_name"
}

create_blex_dbs() {
    local i num wps cps dbp cfp blexp

    read_install_params_to_vars || return $? 

    for i in $(seq $num); do
        create_blex_db $i
    done
}

drop_be_db() {
    local ind db_name
    [ -z "$1" ] && echo "Backend's number isn't set" && return 1
    ind="$1"

    install_postgresql_dump_requirements || return $?

    db_name="$DB_NAME_PREFIX$ind"

    check_db_exists "$db_name"
    [ $? -eq 3 ] && return 0

    echo "Dropping database '$db_name' @ container '$DB_CONT_NAME' ..."
    docker exec -ti $DB_CONT_NAME bash -c "sudo -u postgres PGPASSWORD=$DB_PASSWORD dropdb -h localhost -U $DB_USER $db_name"
}

drop_be_dbs() {
    local num wps cps dbp cfp blexp max_tries res

    read_install_params_to_vars || return $? 

    max_tries=10
    for i in $(seq $num); do
        cnt=1
        while true; do
            echo "Dropping DB (try $cnt/$max_tries) ... "
            drop_be_db $i; res=$?
            [ $res -eq 0 ] && echo "DB has been successfully dropped" \
                && break
            [ $cnt -ge $max_tries ] \
                && echo "Error: Dropping DB max tries exceeded" && return 1
            sleep 1
            cnt=$(expr $cnt + 1)
        done
    done
}

create_be_db() {
    local ind db_name
    [ -z "$1" ] && echo "Backend's number isn't set" && return 1
    ind="$1"

    install_postgresql_dump_requirements || return $?

    db_name="$DB_NAME_PREFIX$ind"

    echo "Creating database '$db_name' @ container '$DB_CONT_NAME' ..."
    docker exec -ti $DB_CONT_NAME bash -c "sudo -u postgres PGPASSWORD=$DB_PASSWORD createdb -h localhost -U $DB_USER -O $DB_USER $db_name"
}

create_be_dbs() {
    local num wps cps dbp cfp blexp

    read_install_params_to_vars || return $? 

    for i in $(seq $num); do
        create_be_db $i
    done
}

init_be_db() {
    local ind data_dir config_path empty_env_vars
    [ -z "$1" ] && echo "Backend's number isn't set" && return 1
    ind="$1"

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    empty_env_vars="GENESIS_DB_HOST='' GENESIS_DB_PORT='' GENESIS_DB_NAME=''"
    empty_env_vars="$empty_env_vars GENESIS_DB_USER='' GENESIS_DB_PASSWORD=''"

    data_dir="$BE_ROOT_DATA_DIR/node$ind"
    config_path="$data_dir/config.toml"

    docker exec -ti $BF_CONT_NAME bash -c "$empty_env_vars $BE_BIN_PATH initDatabase --config=$config_path"
}

safe_recreate_be_db() {
    local ind answ app_name
    [ -z "$1" ] && echo "Backend's number isn't set" && return 1
    ind="$1"

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    [ $ind -eq 1 ] && app_name="$BE_BIN_BASENAME" \
        || app_name="$BE_BIN_BASENAME$i"
    echo
    echo -n "Are you sure you want to start db drop process (backend will be stopped) [y/n]? "
    read -n 1 answ
    case $answ in
        y|Y)
            echo
            stop_clients \
                && stop_blex \
                && stop_be_app $ind \
                && drop_be_db $ind \
                && create_be_db $ind \
                && init_be_db $ind \
                && start_be_app $ind \
                && start_blex \
                && start_clients
            ;;
        *) echo; echo "OK, canceling db drop process ..." ;;
    esac
}

restore_be_db() {
    local ind db_name db_dump_path src_path
    [ -z "$1" ] && echo "Backend's number isn't set" && return 1
    ind="$1"
    db_name="$DB_NAME_PREFIX$ind"

    [ -z "$2" ] && echo "Source path for database dump isn't set" && return 2
    src_path="$2"

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    install_postgresql_dump_requirements || return $?

    db_dump_path="/tmp/db_dump.$(date '+%Y%m%d%H%M%S').sql"
    echo "Copying database dump from the host '$src_path' to '$db_dump_path' @ '$DB_CONT_NAME' ..."
    docker cp "$src_path" "$DB_CONT_NAME:$db_dump_path" \
    && echo "Restoring database dump into backend #$ind database ..." \
    && docker exec -ti $DB_CONT_NAME bash -c "sudo -u postgres PGPASSWORD=$DB_PASSWORD psql -h localhost -U $DB_USER -d $db_name -f '$db_dump_path'"
}

safe_restore_be_db() {
    local ind answ app_name src_path
    [ -z "$1" ] && echo "Backend's number isn't set" && return 1
    ind="$1"

    [ -z "$2" ] && echo "Source path for database dump isn't set" && return 2
    src_path="$2"

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    [ $ind -eq 1 ] && app_name="$BE_BIN_BASENAME" \
        || app_name="$BE_BIN_BASENAME$i"
    echo
    echo -n "Are you sure you want to start db restore process (backend will be stopped) [y/n]? "
    read -n 1 answ
    case $answ in
        y|Y)
            echo
            stop_clients \
                && stop_blex \
                && stop_be_app $ind \
                && restart_db_server \
                && drop_be_db $ind \
                && create_be_db $ind \
                && restore_be_db $ind "$src_path" \
                && start_be_app $ind \
                && start_blex \
                && start_clients
            ;;
        *) echo; echo "OK, canceling db restore process ..." ;;
    esac
}

restore_be_dbs() {
    local num wps cps dbp cfp blexp src_dir src_paths src_path j
    [ -z "$1" ] && echo "Source path for databases dumps isn't set" && return 1
    src_dir="$1"

    read_install_params_to_vars || return $? 

    src_paths=()
    #while IFS= read -d $'\0' -r src_path ; do
    while read src_path ; do
        src_paths=("${src_paths[@]}" "$src_path")
    done < <(find "$src_dir" -mindepth 1 -maxdepth 1 | sort -n)

    j=0
    for i in $(seq $num); do
        echo "Restoring backend #$i database from file '${src_paths[$j]}' ..."
        restore_be_db $i "${src_paths[$j]}" || return $?
        j=$(expr $j + 1)
    done
}

safe_restore_be_dbs() {
    local num wps cps dbp cfp blexp src_dir ind
    read_install_params_to_vars || return $? 

    src_dir="$1"

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    echo
    echo -n "Are you sure you want to start dbs restore process (backends will be stopped) [y/n]? "
    read -n 1 answ
    case $answ in
        y|Y)
            echo
            stop_clients \
                && stop_blex \
                && stop_be_apps $num \
                && restart_db_server \
                && drop_be_dbs \
                && create_be_dbs \
                && restore_be_dbs "$src_dir" \
                && start_be_apps $num \
                && start_blex \
                && start_clients
            ;;
        *) echo; echo "OK, canceling dbs restore process ..." ;;
    esac
}

fast_safe_restore_be_dbs() {
    local num wps cps dbp cfp blexp src_dir ind
    read_install_params_to_vars || return $? 

    src_dir="$1"

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    echo
    stop_blex \
       && stop_be_apps $num \
       && restart_db_server \
       && drop_be_dbs \
       && create_be_dbs \
       && restore_be_dbs "$src_dir" \
       && start_be_apps $num \
       && start_blex 
}

dump_be_data_dir() {
    local ind dst_path dst_dir src_path data_dir
    [ -z "$1" ] && echo "Backend's number isn't set" && return 1
    ind="$1"

    [ -z "$2" ] && dst_dir="./node$ind" || dst_dir="$2"
    if [ ! -e "$dst_dir" ]; then
        mkdir -p "$dst_dir" || return $?
    fi

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    data_dir="$BE_ROOT_DATA_DIR/node$ind"
    #config_path="$data_dir/config.toml"

    docker exec -t $BF_CONT_NAME bash -c "find '$data_dir' -mindepth 1 -maxdepth 1 -not -name '*.toml' -not -name '*.lock' -not -name '*.pid' -not -name '*.log'" | tr -d '\r' | while read src_path; do
        dst_path="$dst_dir/$(basename "$src_path")"
        echo "Copying '$BF_CONT_NAME:$src_path' to '$dst_path' ..."
        docker cp "$BF_CONT_NAME:$src_path" "$dst_path"
    done
}

dump_be_data_dirs() {
    local num wps cps dbp cfp blexp dst_dir
    [ -z "$1" ] && dst_dir="./data-dirs-$(date '+%Y%m%d%H%M%S')" || dst_dir="$1"
    if [ ! -e "$dst_dir" ]; then
        mkdir -p "$dst_dir" || return $?
    fi

    read_install_params_to_vars || return $? 

    for i in $(seq $num); do
        echo "Dumping backend #$i data dir from container '$BF_CONT_NAME' to the host dir '$dst_dir' ..."
        (cd "$dst_dir" && dump_be_data_dir $i "./node$i" > /dev/null) || return 10
    done
}

restore_be_data_dir() {
    local ind src_dir data_dir
    [ -z "$1" ] && echo "Backend's number isn't set" && return 1
    ind="$1"

    [ -z "$2" ] && src_dir="./node$ind" || src_dir="$2"
    [ ! -e "$src_dir" ] && echo "Source backend data dir '$src_dir' doesn't exist" \
        && return 2

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    data_dir="$BE_ROOT_DATA_DIR/node$ind"
    #config_path="$data_dir/config.toml"

    find "$src_dir" -mindepth 1 -maxdepth 1 -not -name '*.toml' -not -name '*.lock' -not -name '*.pid' -not -name '*.log' | tr -d '\r' | sort -n | while read src_path; do
        dst_path="$data_dir/$(basename "$src_path")"
        echo "Copying '$src_path' to '$BF_CONT_NAME:$dst_path' ..."
        docker cp "$src_path" "$BF_CONT_NAME:$dst_path"
    done
}

restore_be_data_dirs() {
    local num wps cps dbp cfp blexp src_dir src_paths src_path j
    [ -z "$1" ] && echo "Source path for databases dumps isn't set" && return 1
    src_dir="$1"

    read_install_params_to_vars || return $? 

    src_paths=()
    while read src_path ; do
        src_paths=("${src_paths[@]}" "$src_path")
    done < <(find "$src_dir" -mindepth 1 -maxdepth 1 | sort -n)

    j=0
    for i in $(seq $num); do
        echo "Restoring backend #$i data dir from dir '${src_paths[$j]}' ..."
        restore_be_data_dir $i "${src_paths[$j]}" || return $?
        j=$(expr $j + 1)
    done
}

safe_restore_be_data_dir() {
    local ind answ app_name src_path
    [ -z "$1" ] && echo "Backend's number isn't set" && return 1
    ind="$1"

    src_path="$2"

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    [ $ind -eq 1 ] && app_name="$BE_BIN_BASENAME" \
        || app_name="$BE_BIN_BASENAME$i"
    echo
    echo -n "Are you sure you want to start data dir restore (backend will be stopped) [y/n]? "
    read -n 1 answ
    case $answ in
        y|Y)
            echo
            stop_clients \
                && stop_be_app $ind \
                && restart_db_server \
                && restore_be_data_dir $ind "$src_path" \
                && start_be_app $ind \
                && start_clients
            ;;
        *) echo; echo "OK, canceling data dir restore process ..." ;;
    esac
}

safe_restore_be_data_dirs() {
    local num wps cps dbp cfp blexp src_dir ind
    read_install_params_to_vars || return $? 

    src_dir="$1"

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    echo
    echo -n "Are you sure you want to start data dirs restore process (backends will be stopped) [y/n]? "
    read -n 1 answ
    case $answ in
        y|Y)
            echo
            stop_clients \
                && stop_be_apps $num \
                && restart_db_server \
                && restore_be_data_dirs "$src_dir" \
                && start_be_apps $num \
                && stop_clients
            ;;
        *) echo; echo "OK, canceling data dirs restore process ..." ;;
    esac
}

safe_dump_be_dbs_and_data_dirs() {
    local num wps cps dbp cfp blexp dst_dir
    [ -z "$1" ] && dst_dir="./dbs-and-data-dirs-$(date '+%Y%m%d%H%M%S')" || dst_dir="$1"
    if [ ! -e "$dst_dir" ]; then
        mkdir -p "$dst_dir" || return $?
    fi

    read_install_params_to_vars || return $? 

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    echo
    echo -n "Are you sure you want to start dbs and data dirs dump process (backends will be stopped) [y/n]? "
    read -n 1 answ
    case $answ in
        y|Y)
            echo
            stop_clients \
                && stop_be_apps $num \
                && echo "$num" > "$dst_dir/num_of_backends" \
                && get_versions > "$dst_dir/versions" \
                && cp_be_logs "$dst_dir/logs" \
                && dump_be_data_dirs "$dst_dir/data-dirs" \
                && restart_db_server \
                && dump_be_dbs "$dst_dir/db-dumps" \
                && tar -czf "$dst_dir.tar.gz" "$dst_dir" \
                && ([ -e "$dst_dir" ] && [ -e "$dst_dir.tar.gz" ] && rm -rf "$dst_dir" || :) \
                && start_be_apps $num \
                && start_clients
            ;;
        *) echo; echo "OK, canceling dbs and data dirs dump process ..." ;;
    esac
}

safe_dump_be_dbs_and_data_dirs_non_inter() {
    local num wps cps dbp cfp blexp dst_dir
    [ -z "$1" ] && dst_dir="./dbs-and-data-dirs-$(date '+%Y%m%d%H%M%S')" || dst_dir="$1"
    if [ ! -e "$dst_dir" ]; then
        mkdir -p "$dst_dir" || return $?
    fi

    read_install_params_to_vars || return $? 

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    echo
    stop_clients \
        && stop_be_apps $num \
        && echo "$num" > "$dst_dir/num_of_backends" \
        && get_versions > "$dst_dir/versions" \
        && cp_be_logs "$dst_dir/logs" \
        && dump_be_data_dirs "$dst_dir/data-dirs" \
        && restart_db_server \
        && dump_be_dbs "$dst_dir/db-dumps" \
        && tar -czf "$dst_dir.tar.gz" "$dst_dir" \
        && ([ -e "$dst_dir" ] && [ -e "$dst_dir.tar.gz" ] && rm -rf "$dst_dir" || :)
}

dump_fast_install_data() {
    local num wps cps dbp cfp blexp dst_dir
    read_install_params_to_vars || return $? 
    [ -z "$1" ] && session=$(date '+%Y%m%d%H00') || session="$1"

    [ -z "$2" ] && dst_dir="./$USE_PRODUCT-qs-$VERSION-fast-install-data-$session-$num-nodes" || dst_dir="$2"
    if [ ! -e "$dst_dir" ]; then
        mkdir -p "$dst_dir" || return $?
    fi

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    echo
    stop_clients \
        && stop_be_apps $num \
        && echo "$num" > "$dst_dir/num_of_backends" \
        && get_versions > "$dst_dir/versions" \
        && dump_be_data_dirs "$dst_dir/data-dirs" \
        && restart_db_server \
        && dump_be_dbs "$dst_dir/db-dumps" \
        && tar -czf "$dst_dir.tar.gz" "$dst_dir" \
        && ([ -e "$dst_dir" ] && [ -e "$dst_dir.tar.gz" ] && rm -rf "$dst_dir" || :) \
        && start_be_apps $num \
        && start_clients
}

safe_restore_be_dbs_and_data_dirs() {
    local num wps cps dbp cfp blexp src_dir ind is_tar_gz num_of_backends
    [ -z "$1" ] && echo "Source directory or tar.gz archive isn't set" \
        && return 1
    src_dir="$1"

    read_install_params_to_vars || return $? 

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    echo
    echo -n "Are you sure you want to start dbs and data dirs restore process (backends will be stopped) [y/n]? "
    read -n 1 answ
    case $answ in
        y|Y)
            echo
            is_tar_gz="$(file "$src_dir" | cut -f 2 -d ':' | cut -d ',' -f1 | $SED_E 's/^[ ]*//' | grep "gzip compressed data")"
            if [ -n "$is_tar_gz" ]; then
                echo "Source path '$src_dir' is a tar.gz archive. Unpacking ..."
                (cd "$(dirname "$src_dir")" && tar zvxf "$src_dir")
                src_dir="$(echo "$src_dir" | $SED_E 's/\.tar\.gz$//')"
            fi

            [ ! -e "$src_dir" ] \
                && echo "Source directory '$src_dir' doesn't exist" && return 3
            num_of_backends="$([ -e "$src_dir/num_of_backends" ] && cat "$src_dir/num_of_backends" || echo 0)"
            if [ $num_of_backends -ne $num ]; then
                echo "The expected number of backends '$num_of_backends' isn't equal to real number of backends '$num'. Please run './manage.sh install $num_of_backends' first."
            fi

            stop_clients \
                && stop_blex \
                && stop_be_apps $num \
                && restore_be_data_dirs "$src_dir/data-dirs" \
                && restart_db_server \
                && drop_be_dbs \
                && create_be_dbs \
                && restore_be_dbs "$src_dir/db-dumps" \
                && ([ -n "$is_tar_gz" ] && [ -e "$src_dir" ] && rm -rf "$src_dir" || :) \
                && start_be_apps $num \
                && start_blex \
                && start_clients
            ;;
        *) echo; echo "OK, canceling dbs and data dirs restore process ..." ;;
    esac
}

safe_restore_be_dbs_and_data_dirs_non_inter() {
    local num wps cps dbp cfp blexp src_dir ind is_tar_gz num_of_backends
    [ -z "$1" ] && echo "Source directory or tar.gz archive isn't set" \
        && return 1
    src_dir="$1"

    read_install_params_to_vars || return $? 

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    echo
    is_tar_gz="$(file "$src_dir" | cut -f 2 -d ':' | cut -d ',' -f1 | $SED_E 's/^[ ]*//' | grep "gzip compressed data")"
    if [ -n "$is_tar_gz" ]; then
        echo "Source path '$src_dir' is a tar.gz archive. Unpacking ..."
        (cd "$(dirname "$src_dir")" && tar zvxf "$src_dir")
        src_dir="$(echo "$src_dir" | $SED_E 's/\.tar\.gz$//')"
    fi

    [ ! -e "$src_dir" ] \
        && echo "Source directory '$src_dir' doesn't exist" && return 3
    num_of_backends="$([ -e "$src_dir/num_of_backends" ] && cat "$src_dir/num_of_backends" || echo 0)"
    if [ $num_of_backends -ne $num ]; then
        echo "The expected number of backends '$num_of_backends' isn't equal to real number of backends '$num'. Please run './manage.sh install $num_of_backends' first."
    fi

    stop_clients \
        && stop_blex \
        && stop_be_apps $num \
        && restore_be_data_dirs "$src_dir/data-dirs" \
        && restart_db_server \
        && drop_be_dbs \
        && create_be_dbs \
        && restore_be_dbs "$src_dir/db-dumps" \
        && ([ -n "$is_tar_gz" ] && [ -e "$src_dir" ] && rm -rf "$src_dir" || :) \
        && start_be_apps $num \
        && start_blex
}

restore_fast_install_data() {
    local num wps cps dbp cfp blexp src_dir ind is_tar_gz num_of_backends
    [ -z "$1" ] && echo "Source directory or tar.gz archive isn't set" \
        && return 1
    src_dir="$1"

    read_install_params_to_vars || return $? 

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 2

    echo

    is_tar_gz="$(file "$src_dir" | cut -f 2 -d ':' | cut -d ',' -f1 | $SED_E 's/^[ ]*//' | grep "gzip compressed data")"
    if [ -n "$is_tar_gz" ]; then
        echo "Source path '$src_dir' is a tar.gz archive. Unpacking ..."
        (cd "$(dirname "$src_dir")" && tar zvxf "$src_dir")
        src_dir="$(echo "$src_dir" | $SED_E 's/\.tar\.gz$//')"
    fi

    [ ! -e "$src_dir" ] \
        && echo "Source directory '$src_dir' doesn't exist" && return 3
    num_of_backends="$([ -e "$src_dir/num_of_backends" ] && cat "$src_dir/num_of_backends" || echo 0)"

    stop_be_apps $num \
        && restore_be_data_dirs "$src_dir/data-dirs" \
        && restart_db_server \
        && drop_be_dbs \
        && create_be_dbs \
        && restore_be_dbs "$src_dir/db-dumps" \
        && ([ -n "$is_tar_gz" ] && [ -e "$src_dir" ] && rm -rf "$src_dir" || :) \
        && start_be_apps $num
}

### Backends services #### end ####


### Backend ### begin ###

### Update ### 20180405 ### 08fad ### begin ###
build_be() {
    local num; [ -z "$1" ] && echo "Number of backends isnt' set" && return 1 \
        || num=$1

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 1

    docker exec -ti $BF_CONT_NAME bash -c "echo \"GOPATH: '\$GOPATH' @ '$BF_CONT_NAME' container\"; (dpkg-query -s build-essential > /dev/null || (apt update --fix-missing; apt install -y build-essential)) && cd / && echo \"Starting 'go get -d $BACKEND_GO_URL' ...\" && go get -d $BACKEND_GO_URL && cd \$GOPATH/src/$BACKEND_GO_URL && echo \"Starting 'git checkout $BACKEND_BRANCH' ...\" && git checkout $BACKEND_BRANCH && echo \"Starting 'go get $BACKEND_GO_URL' ...\" && go get $BACKEND_GO_URL && mkdir -p $BE_BIN_DIR && git rev-parse --abbrev-ref HEAD > $BE_BIN_PATH.git_branch && echo \"git commit: \$(git rev-parse HEAD)\" && git rev-parse HEAD > $BE_BIN_PATH.git_commit && mkdir -p $BE_ROOT_DATA_DIR/node1 && mv \$GOPATH/bin/$BE_BIN_BASENAME $BE_BIN_PATH && rm -rf \$GOPATH && echo \"md5 of final $BE_BIN_PATH: \$(md5sum $BE_BIN_PATH | cut -f1 -d' ')\""
    backend_apps_ctl $num restart
}

dev_build_be() {
    local num; [ -z "$1" ] && echo "Number of backends isnt' set" && return 1 \
        || num=$1

    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 1

    docker exec -ti $BF_CONT_NAME sh -c "echo \"GOPATH: '\$GOPATH' @ '$BF_CONT_NAME' container\""
    docker exec -ti $BF_CONT_NAME sh -c "dpkg-query -s build-essential > /dev/null || (apt update --fix-missing; apt install -y build-essential)"
    docker exec -ti $BF_CONT_NAME sh -c "([ ! -e '\$GOPATH/src/$DEV_BE_GO_URL' ] && echo \"Directory '\$GOPATH/src/$DEV_BE_GO_URL' doesn't exist. Starting 'go get -d $DEV_BE_GO_URL' ...\" && go get -d $DEV_BE_GO_URL || :) && echo \"Starting 'cd \$GOPATH/src/$DEV_BE_GO_URL'... \" && cd \$GOPATH/src/$DEV_BE_GO_URL && echo \"Starting 'git checkout $DEV_BE_BRANCH' ...\" && git checkout $DEV_BE_BRANCH && echo \"Starting 'git pull' ...\" && git pull && cd \$GOPATH/src/$DEV_BE_GO_URL && ([ '$DEV_BE_CREATE_GO_URL_VENDOR_SYMLINK' = 'yes' ] && [ '$DEV_BE_GO_URL_VENDOR_SRC' != '$DEV_BE_GO_URL_VENDOR_DST' ] && cd \$GOPATH/src && ([ ! -e $DEV_BE_GO_URL_VENDOR_SRC ] || mv $DEV_BE_GO_URL_VENDOR_DST $DEV_BE_GO_URL_VENDOR_DST.bak.\$(date '+%Y%m%d%H%M%S')) && ln -s \$GOPATH/src/$DEV_BE_GO_URL_VENDOR_SRC \$GOPATH/src/$DEV_BE_GO_URL_VENDOR_DST) && echo \"Starting go build in '\$(pwd)' ...\" && go build && echo \"md5 of a new \$GOPATH/src/$DEV_BE_GO_URL/$BE_BIN_BASENAME: \$(md5sum \$GOPATH/src/$DEV_BE_GO_URL/$BE_BIN_BASENAME | cut -f1 -d' ')\" && git rev-parse --abbrev-ref HEAD > $BE_BIN_PATH.git_branch && echo \"git commit: \$(git rev-parse HEAD)\" && git rev-parse HEAD > $BE_BIN_PATH.git_commit && cd \$GOPATH/src/$DEV_BE_GO_URL && ([ -e \$GOPATH/bin ] || mkdir -p \$GOPATH/bin) && echo \"Starting 'mv \$GOPATH/src/$DEV_BE_GO_URL/$BE_BIN_BASENAME \$GOPATH/bin/$BE_BIN_BASENAME\" && mv \$GOPATH/src/$DEV_BE_GO_URL/$BE_BIN_BASENAME \$GOPATH/bin/$BE_BIN_BASENAME && ([ -e $BE_ROOT_DATA_DIR/node1 ] || mkdir -p $BE_ROOT_DATA_DIR/node1) && echo \"Starting 'mv \$GOPATH/bin/$BE_BIN_BASENAME $BE_BIN_PATH' ...\" && mv \$GOPATH/bin/$BE_BIN_BASENAME $BE_BIN_PATH && echo \"md5 of final $BE_BIN_PATH: \$(md5sum $BE_BIN_PATH | cut -f1 -d' ')\""
    backend_apps_ctl $num restart
}
### Update ### 20180405 ### 08fad #### end ####

clean_be_build() {
    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 1
    docker exec -ti $BF_CONT_NAME bash -c "rm -rf /go"
}

### Update ### 20180405 ### 08fad ### begin ###

get_be_ver() {
    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" && return 1
    docker exec -ti $BF_CONT_NAME bash -c "$BE_BIN_PATH -noStart 2>&1 | sed -E -n 's/^.*version\W+([0-9a-zA-Z\.\-]+)\W+.*/\1/pg'"
}

get_be_version() {
    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] && return
    local ver
    ver="$(docker exec -ti $BF_CONT_NAME sh -c "$BE_BIN_PATH help | grep version")"
    if [ -n "$ver" ]; then
        echo -n "Binary version: "
        docker exec -ti $BF_CONT_NAME sh -c "$BE_BIN_PATH version"
    fi
}

get_be_git_ver() {
    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" && return 1
    docker exec -ti $BF_CONT_NAME bash -c "[ -e $BE_BIN_PATH.git_branch ] && echo -n 'Git branch: ' && cat $BE_BIN_PATH.git_branch; [ -e $BE_BIN_PATH.git_commit ] && echo -n 'Git commit: ' && cat $BE_BIN_PATH.git_commit && echo"
}

### Update ### 20180405 ### 08fad #### end ####

### Backend #### end ####


### Frontend ### begin ###

### Update ### 20180405 ### 08fad ### begin ###

build_fe() {
    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 1

    docker exec -ti $BF_CONT_NAME bash -c "cd / && ([ -e $FE_SRC_DIR ] && rm -rf $FE_SRC_DIR || : ) && git clone --recursive $FRONTEND_REPO_URL genesis-front && cd /genesis-front && git checkout $FRONT_BRANCH && git pull origin $FRONT_BRANCH && git rev-parse --abbrev-ref HEAD > /genesis-front.git_branch && git rev-parse HEAD > /genesis-front.git_commit && yarn install && yarn build && find /genesis-front -maxdepth 1 -mindepth 1 -not -name 'build*' -exec rm -rf {} \;"
}

clean_fe_build() {
    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 1
    docker exec -ti $BF_CONT_NAME bash -c \
        "find $FE_SRC_DIR -maxdepth 1 -mindepth 1 -not -name 'build*' -exec rm -rf {} \;"
}


get_fe_ver() {
    echo "$FRONTEND_BRANCH"
}

get_fe_git_ver() {
    check_cont $BF_CONT_NAME > /dev/null
    [ $? -ne 0 ] \
        && echo "Backend/frontend container isn't ready" \
        && return 1

    docker exec -ti $BF_CONT_NAME bash -c "[ -e $FE_SRC_DIR.git_branch ] && echo -n 'Git branch: ' && cat $FE_SRC_DIR.git_branch; [ -e $FE_SRC_DIR.git_commit ] && echo -n 'Git commit: ' && cat $FE_SRC_DIR.git_commit && echo"
}
### Update ### 20180405 ### 08fad #### end ####

### Frontend #### end ####


### Misc ### begin ###

get_versions() {
    echo
    echo "Quick Start version: $VERSION"
    echo
    echo "Backend: "
    get_be_version
    get_be_git_ver
    echo "Frontend: "
    echo -n "Version: "
    get_fe_ver
    get_fe_git_ver
    echo "Golang version: $GOLANG_VER"
    echo
    echo "Initial apps URLs:"
    get_initial_apps_urls
    echo
    echo "Demo apps URLs:"
    get_demo_apps_urls
    echo
}

check_num_param() {
    [ -z "$1" ] && echo "The number of clients/backends is not set" && exit 100
    [ $1 -gt $MAX_NUM_OF_NODES ] \
        && echo "The maximum number of clients/backends is $MAX_NUM_OF_NODES" \
        && exit 101
}

save_install_params() {
    (
        update_global_home_var
        run_as_orig_user "[ -e \"$HOME/.apla_quick_start\" ] && rm \"$HOME/.apla_quick_start\""
        run_as_orig_user "echo \"$@\" > \"$HOME/.genesis_quick_start\""
    )
}

show_install_params() {
    (
        update_global_home_var
        if [ -e "$HOME/.genesis_quick_start" ]; then
            cat "$HOME/.genesis_quick_start"
        elif [ -e "$HOME/.apla_quick_start" ]; then
            cat "$HOME/.apla_quick_start"
        else
            echo "No install parameters found."
        fi
    )
}

read_install_params() {
    (
        update_global_home_var
        if [ -e "$HOME/.genesis_quick_start" ]; then
            cat "$HOME/.genesis_quick_start"
        elif [ -e "$HOME/.apla_quick_start" ]; then
            cat "$HOME/.apla_quick_start"
        fi
    )
}

read_install_params_to_vars() {
    # Please define variables 'num', 'wps', 'cps', 'dbp' before run this function"
    local params param cnt
    params="$(read_install_params)"
    [ -z "$params" ] \
        && echo "No install parameters found. Please start install first" \
        && return 1

    cnt=0
    for param in $params; do
        case $cnt in
            0) num=$param ;;
            1) wps=$param ;;
            2) cps=$param ;;
            3) dbp=$param ;;
            4) blexp=$param ;;
        esac
        cnt=$(expr $cnt + 1)
    done
}

test_install_params() {
    echo "Reading params: '$@'"
    echo "arg1: $1"
    echo "arg2: $2"
    echo "arg3: $3"
    echo "arg4: $4"
}

clear_install_params() {
    (
        update_global_home_var
        [ -e "$HOME/.apla_quick_start" ] && rm "$HOME/.apla_quick_start"
        [ -e "$HOME/.genesis_quick_start" ] && rm "$HOME/.genesis_quick_start"
    )
}

delete_install() {
    stop_clients
    remove_cont $BF_CONT_NAME
    remove_cont $CF_CONT_NAME
    remove_cont $DB_CONT_NAME
    remove_cont $RQ_CONT_NAME
    remove_cont $BLEX_CONT_NAME
}

### Update ### 20180405 ### 08fad ### begin ###

start_update_full_nodes() {
    local priv_key api_url key_ids api_urls tcp_addrs pub_keys

    copy_update_sys_params_scripts || return $?

    priv_key="$(get_priv_key 1)"
    
    api_url="$(get_int_api_url 1)"
    
    key_ids=$(get_key_ids | sed -E 's/([0-9]+): (.*)$/--node-key-id=\2/' | tr -d '\r' | tr '\n' ' ')
    
    api_urls=$(get_int_api_urls | sed -E 's/([0-9]+): (.*)$/--node-api-url=\2/' | tr -d '\r' | tr '\n' ' ')
    
    tcp_addrs=$(get_int_tcp_addrs | sed -E 's/([0-9]+): (.*)$/--node-tcp-addr=\2/' | tr -d '\r' | tr '\n' ' ')
    
    pub_keys=$(get_node_pub_keys | sed -E 's/([0-9]+): (.*)$/--node-pub-key=\2/' | tr -d '\r' | tr '\n' ' ')
    
    echo "Starting full nodes update ..."
    docker exec -t $BF_CONT_NAME sh -c "PYTHONPATH=$SCRIPTS_DIR python3 $SCRIPTS_DIR/update_full_nodes.py --call-priv-key=$priv_key --call-api-url=$api_url $key_ids $api_urls $tcp_addrs $pub_keys --max-tries=150 --timeout-secs=150"
    [ $? -ne 0 ] \
        && echo "Full nodes voting isn't completed" && return 3
    return 0
}

start_update_full_nodes_by_voting() {
    local priv_keys keys_ids pub_keys int_api_urls api_urls tcp_addrs
    local num int_tcp_addrs

    num=$1
    ([ -z "$num" ] || [ $num -lt 1 ]) \
        && echo "The number of backends is not set or wrong: '$num'" \
        && return 1

    copy_update_sys_params_scripts || return $?

    priv_keys=$(get_priv_keys | sed -E 's/([0-9]+): (.*)$/APLA_NODE\1_OWNER_PRIV_KEY=\2/' | tr -d '\r' | tr '\n' ' ')
    
    key_ids=$(get_key_ids | sed -E 's/([0-9]+): (.*)$/APLA_NODE\1_OWNER_KEY_ID=\2/' | tr -d '\r' | tr '\n' ' ')
    
    pub_keys=$(get_node_pub_keys | sed -E 's/([0-9]+): (.*)$/APLA_NODE\1_OWNER_PUB_KEY=\2/' | tr -d '\r' | tr '\n' ' ')
    
    int_api_urls=$(get_int_api_urls | sed -E 's/([0-9]+): (.*)$/APLA_NODE\1_INT_API_URL=\2/' | tr -d '\r' | tr '\n' ' ')
    
    api_urls=$(get_int_api_urls | sed -E 's/([0-9]+): (.*)$/APLA_NODE\1_API_URL=\2/' | tr -d '\r' | tr '\n' ' ')

    tcp_addrs=$(get_int_tcp_addrs | sed -E 's/([0-9]+): (.*)$/APLA_NODE\1_TCP_ADDR=\2/' | tr -d '\r' | tr '\n' ' ')

    int_tcp_addrs=$(get_int_tcp_addrs | sed -E 's/([0-9]+): (.*)$/APLA_NODE\1_INT_TCP_ADDR=\2/' | tr -d '\r' | tr '\n' ' ')

    echo "Starting full nodes voting ..."
    docker exec -t $BF_CONT_NAME sh -c "PYTHONPATH=$SCRIPTS_DIR NUM_OF_NODES=$num $priv_keys $key_ids $pub_keys $int_api_urls $api_urls $int_tcp_addrs python3 $SCRIPTS_DIR/full_nodes_voting.py"
    [ $? -ne 0 ] \
        && echo "Full nodes voting isn't completed" && return 3
    return 0
}

start_sys_params_tweaks() {
    local api_url priv_key gen_time gap cnt max_tries _stop result
    local num wps cps dbp blexp
    read_install_params_to_vars || return 2

    copy_update_sys_params_scripts || return $?

    priv_key="$(get_priv_key 1)"
    api_url="$(get_int_api_url 1)"

    cnt=1
    max_tries=5
    _stop=1
    while [ $_stop -eq 1 ]; do
        echo -n "Updating core system parameters"
        [ $cnt -gt 1 ] && echo ", try $cnt/$max_tries ..." || echo " ..."
        [ $cnt -ge $max_tries ] && _stop=0
        result=1
        echo "Setting up max block generation time to $MAX_BLOCK_GENERATION_TIME ..." \
            && docker exec -t $BF_CONT_NAME sh -c "PYTHONPATH=$SCRIPTS_DIR python3 $SCRIPTS_DIR/update_sys_params.py --priv-key=$priv_key --api-url=$api_url --timeout-secs=30 --max-tries=30 --name=max_block_generation_time --value=$MAX_BLOCK_GENERATION_TIME" \
            && echo "Setting up gap between blocks to $GAP_BETWEEN_BLOCKS ..." \
            && docker exec -t $BF_CONT_NAME sh -c "PYTHONPATH=$SCRIPTS_DIR python3 $SCRIPTS_DIR/update_sys_params.py --priv-key=$priv_key --api-url=$api_url --timeout-secs=30 --max-tries=30 --name=gap_between_blocks --value=$GAP_BETWEEN_BLOCKS" && result=0
        [ $result -eq 0 ] && _stop=0
        #|| keep_restart_be_apps_on_error $num 503 10
        cnt="$(expr $cnt + 1)"
    done

}

start_update_keys() {
    local first_n rmt_path priv_key api_url key_ids pub_keys amount
    read_install_params_to_vars || return 2

    first_n="$1"

    copy_update_keys_scripts || return $?

    priv_key="$(get_priv_key 1)"
    
    api_url="$(get_int_api_url 1)"
    
    pub_keys=$(get_first_n_pub_keys $first_n |  tail -n +2 | sed -E 's/([0-9]+): (.*)$/--pub-key=\2/' | tr -d '\r' | tr '\n' ' ')
    
    amounts=$(get_first_n_pub_keys $first_n |  tail -n +2 | sed -E 's/([0-9]+): (.*)$/--amount=1000000000000000000000/' | tr -d '\r' | tr '\n' ' ')

    if [ -n "$pub_keys" ]; then
        echo "Starting keys update ..."
        docker exec -t $BF_CONT_NAME sh -c "PYTHONPATH=$SCRIPTS_DIR python3 $SCRIPTS_DIR/new_users.py --priv-key=$priv_key --api-url=$api_url $pub_keys $amounts --max-tries=150 --timeout-secs=150"
    fi
}


### Update ### 20180405 ### 08fad #### end ####

get_demo_apps_url_from_dockerfile() {
    local df_path; df_path="$SCRIPT_DIR/$BF_CONT_BUILD_DIR/Dockerfile"
    [ ! -e "$df_path" ] && return 1
    local url; url="$($SED_E -n 's/^ENV DEMO_APPS_URL (.*)$/\1/p' "$df_path" | tail -n 1)"
    [ -n "$url" ] && echo "$url" || return 2
}

### Update ### 20180405 ### 08fad ### begin ###
copy_import_demo_apps_scripts() {

    local srcs; local dsts;

    srcs[0]="$SCRIPT_DIR/$BF_CONT_BUILD_DIR$SCRIPTS_DIR/requirements.txt"
    dsts[0]="$SCRIPTS_DIR/requirements.txt"

    srcs[1]="$SCRIPT_DIR/$BF_CONT_BUILD_DIR$SCRIPTS_DIR/import_dapp_from_file.py"
    dsts[1]="$SCRIPTS_DIR/import_dapp_from_file.py"


    local do_copy

    for i in $(seq 0 $(expr ${#srcs[@]} - 1)); do
        do_copy="no"
        docker exec -t $BF_CONT_NAME bash -c "[ -e '${dsts[$i]}' ]" 
        if [ $? -ne 0 ]; then
            do_copy="yes"
        fi
        if [ "$do_copy" = "yes" ] \
            || [ "$FORCE_COPY_IMPORT_DEMO_APPS_SCRIPTS" = "yes" ]; then

            if [ -e "${srcs[$i]}" ]; then
                echo "Copying '${srcs[$i]}' to '${dsts[$i]}' @ '$BF_CONT_NAME' ..."
                docker cp "${srcs[$i]}" $BF_CONT_NAME:${dsts[$i]}
            else
                echo "No '${srcs[$i]}' @ host system. Please create it first." \
                    && return 1
            fi
        fi
    done

    if [ $FORCE_REQUIREMENTS_INSTALL == "yes" ]; then
        #docker exec -ti $BF_CONT_NAME sh -c 'apt-get update -y && apt-get install -y --no-install-recommends python3 python3-pip'
        docker exec -ti $BF_CONT_NAME sh -c 'pip3 install -U pip'
        docker exec -ti $BF_CONT_NAME sh -c 'pip3 install wheel'
        docker exec -ti $BF_CONT_NAME sh -c 'pip3 uninstall -y genesis-blockchain-tools'
        docker exec -ti $BF_CONT_NAME sh -c 'pip3 uninstall -y genesis-blockchain-api-client'
        docker exec -ti $BF_CONT_NAME sh -c "pip3 install -r '${dsts[0]}'" 
    fi
}

copy_update_sys_params_scripts() {

    local srcs; local dsts;

    srcs[0]="$SCRIPT_DIR/$BF_CONT_BUILD_DIR$SCRIPTS_DIR/requirements.txt"
    dsts[0]="$SCRIPTS_DIR/requirements.txt"

    srcs[1]="$SCRIPT_DIR/$BF_CONT_BUILD_DIR$SCRIPTS_DIR/update_sys_params.py"
    dsts[1]="$SCRIPTS_DIR/update_sys_params.py"

    local do_copy

    for i in $(seq 0 $(expr ${#srcs[@]} - 1)); do
        do_copy="no"
        docker exec -t $BF_CONT_NAME bash -c "[ -e '${dsts[$i]}' ]" 
        if [ $? -ne 0 ]; then
            do_copy="yes"
        fi
        if [ "$do_copy" = "yes" ] \
            || [ "$FORCE_COPY_UPDATE_SYS_PARAMS_SCRIPTS" = "yes" ]; then

            if [ -e "${srcs[$i]}" ]; then
                echo "Copying '${srcs[$i]}' to '${dsts[$i]}' @ '$BF_CONT_NAME' ..."
                docker cp "${srcs[$i]}" $BF_CONT_NAME:${dsts[$i]}
            else
                echo "No '${srcs[$i]}' @ host system. Please create it first." \
                    && return 1
            fi
        fi
    done
    if [ $FORCE_REQUIREMENTS_INSTALL == "yes" ]; then
        #docker exec -ti $BF_CONT_NAME sh -c 'apt-get update -y && apt-get install -y --no-install-recommends python3 python3-pip'
        docker exec -ti $BF_CONT_NAME sh -c 'pip3 install -U pip'
        docker exec -ti $BF_CONT_NAME sh -c 'pip3 install wheel'
        docker exec -ti $BF_CONT_NAME sh -c 'pip3 uninstall -y genesis-blockchain-tools'
        docker exec -ti $BF_CONT_NAME sh -c 'pip3 uninstall -y genesis-blockchain-api-client'
        docker exec -ti $BF_CONT_NAME sh -c "pip3 install -r '${dsts[0]}'" 
    fi
}

copy_update_keys_scripts() {

    local srcs; local dsts;

    srcs[0]="$SCRIPT_DIR/$BF_CONT_BUILD_DIR$SCRIPTS_DIR/requirements.txt"
    dsts[0]="$SCRIPTS_DIR/requirements.txt"

    srcs[1]="$SCRIPT_DIR/$BF_CONT_BUILD_DIR$SCRIPTS_DIR/new_users.py"
    dsts[1]="$SCRIPTS_DIR/new_users.py"

    local do_copy

    for i in $(seq 0 $(expr ${#srcs[@]} - 1)); do
        do_copy="no"
        docker exec -t $BF_CONT_NAME bash -c "[ -e '${dsts[$i]}' ]" 
        if [ $? -ne 0 ]; then
            do_copy="yes"
        fi
        if [ "$do_copy" = "yes" ] \
            || [ "$FORCE_COPY_UPDATE_KEYS_SCRIPTS" = "yes" ]; then

            if [ -e "${srcs[$i]}" ]; then
                echo "Copying '${srcs[$i]}' to '${dsts[$i]}' @ '$BF_CONT_NAME' ..."
                docker cp "${srcs[$i]}" $BF_CONT_NAME:${dsts[$i]}
            else
                echo "No '${srcs[$i]}' @ host system. Please create it first." \
                    && return 1
            fi
        fi
    done
    if [ $FORCE_REQUIREMENTS_INSTALL == "yes" ]; then
        #docker exec -ti $BF_CONT_NAME sh -c 'apt-get update -y && apt-get install -y --no-install-recommends python3 python3-pip'
        docker exec -ti $BF_CONT_NAME sh -c 'pip3 install -U pip'
        docker exec -ti $BF_CONT_NAME sh -c 'pip3 install wheel'
        docker exec -ti $BF_CONT_NAME sh -c 'pip3 uninstall -y genesis-blockchain-tools'
        docker exec -ti $BF_CONT_NAME sh -c 'pip3 uninstall -y genesis-blockchain-api-client'
        docker exec -ti $BF_CONT_NAME sh -c "pip3 install -r '${dsts[0]}'" 
    fi
}

import_from_file() {
    echo "Preparing for importing ..."
    check_cont "$BF_CONT_NAME" > /dev/null; [ $? -ne 0 ] \
        && echo "Container '$BF_CONT_NAME' isn't available " && return 1

    local loc_path rmt_path timeout
    loc_path="$1"
    [ ! -e "$loc_path" ] && echo "Path '$loc_path' doesn't exist" && return 2
    [ -n "$2" ] && timeout_secs="$2" || timeout_secs="350"
    [ -n "$3" ] && max_tries="$3" || max_tries="350"

    copy_import_demo_apps_scripts || return 3

    rmt_path="$(docker exec -ti "$BF_CONT_NAME" sh -c "mktemp")"
    docker exec -ti "$BF_CONT_NAME" sh -c "echo 'test' > $rmt_path"
    [ $? -ne 0 ] && echo "Can't write to '$rmt_path'" && return 5
    echo "Copying '$loc_path' to '$rmt_path' @ '$BF_CONT_NAME' container ..."
    docker cp "$loc_path" "$BF_CONT_NAME:$rmt_path"
    [ $? -ne 0 ] && echo "Can't copy '$loc_path' to '$rmt_path'" && return 6

    run_mbs_cmd import-from-file2 "$rmt_path" "$timeout_secs" "$max_tries"
}

import_from_url() {
    echo "Preparing for importing ..."
    check_cont "$BF_CONT_NAME" > /dev/null; [ $? -ne 0 ] \
        && echo "Container '$BF_CONT_NAME' isn't available " && return 1

    local url
    url="$1"
    [ -z "$url" ] && echo "URL isn't set" && return 2
    [ -n "$2" ] && timeout_secs="$2" || timeout_secs="350"
    [ -n "$3" ] && max_tries="$3" || max_tries="350"

    copy_import_demo_apps_scripts || return 3

    run_mbs_cmd import-from-url2 "$url" "$timeout_secs" "$max_tries"
}

get_initial_apps_urls() {
    for i in $(seq 0 $(expr ${#INITIAL_APPS_URLS[@]} - 1)); do 
        echo "${INITIAL_APPS_URLS[$i]}"
    done
}

start_import_initial_apps() {
    local i cnt max_tries _stop result
    echo "Importing initial apps ..."

    for i in $(seq 0 $(expr ${#INITIAL_APPS_URLS[@]} - 1)); do 
        cnt=1
        max_tries=5
        _stop=1
        while [ $_stop -eq 1 ]; do
            echo -n "Importing initial app ${INITIAL_APPS_URLS[$i]}"
            [ $cnt -gt 1 ] && echo ", try $cnt/$max_tries ..." || echo " ..."
            [ $cnt -ge $max_tries ] && _stop=0
            result=1
            run_mbs_cmd import-from-url2 "${INITIAL_APPS_URLS[$i]}" "${INITIAL_APPS_IMPORT_TIMEOUT_SECS[$i]}" "${INITIAL_APPS_IMPORT_MAX_TRIES[$i]}" && result=0
            [ $result -eq 0 ] && _stop=0
            #|| keep_restart_be_apps_on_error $num 503 10
            cnt="$(expr $cnt + 1)"
        done
        [ $result -ne 0 ] \
		&& echo "Error: can't import ${INITIAL_APPS_URLS[$i]}" \
            	&& return 2
    done
    echo "Initial apps have been successfully imported"
}

get_demo_apps_urls() {
    for i in $(seq 0 $(expr ${#APPS_URLS[@]} - 1)); do 
        echo "${APPS_URLS[$i]}"
    done
}

start_import_demo_apps() {
    local i cnt max_tries _stop result
    echo "Importing demo apps ..."

    for i in $(seq 0 $(expr ${#APPS_URLS[@]} - 1)); do 
        cnt=1
        max_tries=5
        _stop=1
        while [ $_stop -eq 1 ]; do
            echo -n "Importing demo app ${APPS_URLS[$i]}"
            [ $cnt -gt 1 ] && echo ", try $cnt/$max_tries ..." || echo " ..."
            [ $cnt -ge $max_tries ] && _stop=0
            result=1
            run_mbs_cmd import-from-url2 "${APPS_URLS[$i]}" "${APPS_IMPORT_TIMEOUT_SECS[$i]}" "${APPS_IMPORT_MAX_TRIES[$i]}" && result=0
            [ $result -eq 0 ] && _stop=0
            #|| keep_restart_be_apps_on_error $num 503 10
            cnt="$(expr $cnt + 1)"
        done
        [ $result -ne 0 ] && echo "Error: can't import ${APPS_URLS[$i]}" \
            && return 2
    done
    echo "Demo apps have been successfully imported"
}

start_import_crediting() {
    echo "Importing P2P Loans app ..."
    local i
    i=0
    run_mbs_cmd import-from-url2 "${ES_APPS_URLS[$i]}" "${ES_APPS_IMPORT_TIMEOUT_SECS[$i]}" "${ES_APPS_IMPORT_MAX_TRIES[$i]}"
}

setup_crediting() {
    local api_url priv_key
    read_install_params_to_vars || return 2

    copy_update_sys_params_scripts || return $?

    priv_key="$(get_priv_key 1)"
    api_url="$(get_int_api_url 1)"

    echo "Installing P2P Loans app roles ... "
    docker exec -t $BF_CONT_NAME sh -c "PYTHONPATH=$SCRIPTS_DIR python3 $SCRIPTS_DIR/call_contract.py --priv-key=$priv_key --api-url=$api_url --timeout-secs=350 --max-tries=350 --contract=RolesInstall" || return $? 
    echo "Setting up P2P Loans app ..."
    docker exec -t $BF_CONT_NAME sh -c "PYTHONPATH=$SCRIPTS_DIR python3 $SCRIPTS_DIR/call_contract.py --priv-key=$priv_key --api-url=$api_url --timeout-secs=350 --max-tries=350 --contract=CreditingInstall" || return $?
    restart_running_clients
}

start_import_land_reg() {
    echo "Importing Land Registry app ..."
    local i
    i=1
    run_mbs_cmd import-from-url2 "${ES_APPS_URLS[$i]}" "${ES_APPS_IMPORT_TIMEOUT_SECS[$i]}" "${ES_APPS_IMPORT_MAX_TRIES[$i]}"
    restart_running_clients
}

start_import_token_sale() {
    echo "Importing Token Sale app ..."
    local i
    i=2
    run_mbs_cmd import-from-url2 "${ES_APPS_URLS[$i]}" "${ES_APPS_IMPORT_TIMEOUT_SECS[$i]}" "${ES_APPS_IMPORT_MAX_TRIES[$i]}" || return 1
    restart_running_clients
}

start_import_es_apps() {
    echo "Importing Ecosystem apps ..."

    for i in $(seq 0 $(expr ${#ES_APPS_URLS[@]} - 1)); do
        run_mbs_cmd import-from-url2 "${ES_APPS_URLS[$i]}" "${ES_APPS_IMPORT_TIMEOUT_SECS[$i]}" "${ES_APPS_IMPORT_MAX_TRIES[$i]}" || return 1
    done
    setup_crediting
}

get_demo_apps_ver() {
    check_cont "$BF_CONT_NAME" > /dev/null; [ $? -ne 0 ] \
        && echo "Container '$BF_CONT_NAME' isn't available " && return 1

    local dau_path; dau_path="$APPS_DIR/demo_apps.url"
    docker exec -t $BF_CONT_NAME bash -c \
        "[ -f '$dau_path' ] && cat '$dau_path'"
    [ $? -ne 0 ] \
        && echo "No or inaccessible '$dau_path' @ $BF_CONT_NAME" && return 2
}

### Update ### 20180405 ### 08fad #### end ####

start_post_install_actions() {
    local num wps cps dbp blexp
    read_install_params_to_vars || return 1

    start_import_initial_apps || return 2
    echo

    start_sys_params_tweaks || return 3
    echo

    keep_restart_be_apps_on_error $num 503 10 || return 4

    start_update_keys # || return 5
    echo

    start_update_full_nodes || return 6
    echo

    keep_restart_be_apps_on_error $num 503 10 || return 7

    start_import_demo_apps || return 9
    echo
}

start_install() {
    local num; num=$1
    local wps; wps=$2
    local cps; cps=$3
    local dbp; dbp=$4
    local cfp; cfp=$CF_PORT # FIXME: change to argument
    local blexp; blexp=$BLEX_PORT # FIXME: change to argument

    local tot_cont_res; tot_cont_res=0

    local db_cont_res; check_cont $DB_CONT_NAME > /dev/null; db_cont_res=$? 
    [ $db_cont_res -ne 1 ] \
        && echo "DB container already exists. " \
        && tot_cont_res=1

    local cf_cont_res; check_cont $CF_CONT_NAME > /dev/null; cf_cont_res=$? 
    [ $cf_cont_res -ne 1 ] \
        && echo "Centrifugo container already exists. " \
        && tot_cont_res=1

    local rq_cont_res; check_cont $RQ_CONT_NAME > /dev/null; rq_cont_res=$? 
    [ $cf_cont_res -ne 1 ] \
        && echo "Redis queue container already exists. " \
        && tot_cont_res=1

    local blex_cont_res; check_cont $BLEX_CONT_NAME > /dev/null; blex_cont_res=$? 
    [ $blex_cont_res -ne 1 ] \
        && echo "Block explorer container already exists. " \
        && tot_cont_res=1

    local bf_cont_res; check_cont $BF_CONT_NAME > /dev/null; bf_cont_res=$? 
    [ $bf_cont_res -ne 1 ] \
        && echo "Backend/Frontend container already exists. " \
        && tot_cont_res=1

    if [ $tot_cont_res -ne 0 ]; then
        echo -n "Do you want to stop all running clients, delete containers and start a new installation? [y/N] "
        local stop; stop=0
        while [ $stop -eq 0 ]; do
            read -n 1 answ
            case $answ in
                y|Y)
                    echo
                    echo "OK, stopping clients, removing container ..."
                    delete_install
                    stop=1
                    ;;
                n|N)
                    echo
                    echo "OK, stopping installation ..."
                    return 5
                    ;;
            esac
        done
    fi
    
    start_db_cont $dbp

    wait_cont_proc $DB_CONT_NAME postgres 45
    [ $? -ne 0 ] \
        && echo "Postgres process isn't available" && return 10 \
        || echo "Postgres ready"

    wait_db_exists postgres 45
    [ $? -ne 0 ] \
        && echo "postgres database isn't available" && return 11 \
        || echo "postgres database ready"

    wait_db_exists template0 45
    [ $? -ne 0 ] \
        && echo "template0 database isn't available" && return 12 \
        || echo "template0 database ready"

    wait_db_exists template1 45
    [ $? -ne 0 ] \
        && echo "template1 database isn't available" && return 13 \
        || echo "template1 database ready"

    echo

    create_dbs $num 45
    [ $? -ne 0 ] \
        && echo "Backend databases creation failed" && return 14 \
        || echo "Backend databases creation compete"

    wait_dbs $num 45
    [ $? -ne 0 ] \
        && echo "Backend databases ant't available" && return 14 \
        || echo "Backend databases ready"
    echo

    start_cf_cont $cfp

    wait_cont_proc $CF_CONT_NAME centrifugo 10
    [ $? -ne 0 ] \
        && echo "Centrifugo process isn't available" && return 21 \
        || echo "Centrifugo ready"
    echo

    wait_centrifugo_status || return 21
    echo

    start_bf_cont $num $wps $cps

    wait_cont_proc $BF_CONT_NAME supervisord 15
    [ $? -ne 0 ] \
        && echo "Backend's supervisord isn't available" && return 21 \
        || echo "Backend's supervisord ready"

    wait_cont_proc $BF_CONT_NAME nginx 15
    [ $? -ne 0 ] \
        && echo "Frontend's nginx isn't available" && return 22 \
        || echo "Frontend's nginx ready"
    echo

    start_rq_cont

    wait_cont_proc $RQ_CONT_NAME redis-server 15
    [ $? -ne 0 ] \
        && echo "Redis server isn't available" && return 21 \
        || echo "Redis server ready"

    start_blex_cont $blexp

    wait_cont_proc $BLEX_CONT_NAME supervisord 15
    [ $? -ne 0 ] \
        && echo "Block explorer's supervisord isn't available" && return 21 \
        || echo "Block explorer's supervisord ready"

    setup_blex $num
    [ $? -ne 0 ] \
        && echo "Block explorer setup isn't completed" && return 23 \
        || echo "Block explorer setup is completed"
    echo
    stop_blex &

    ### Update ### 20180405 ### 08fad ### begin ###

    setup_be_apps $num $cps
    [ $? -ne 0 ] \
        && echo "Backend applications setup isn't completed" && return 23 \
        || echo "Backend applications setup is completed"
    echo

    ### Update ### 20180405 ### 08fad #### end ####

    start_be_apps $num $cps
    [ $? -ne 0 ] \
        && echo "Backend applications arn't available" && return 23 \
        || echo "Backend applications ready"
    echo

    setup_fe_apps $num $cps
    [ $? -ne 0 ] \
        && echo "Fronend applications setup isn't completed" && return 24 \
        || echo "Fronend applications setup is completed"
    echo

    start_fe_apps $num $cps
    [ $? -ne 0 ] \
        && echo "Fronend applications arn't available" && return 24 \
        || echo "Fronend applications are ready"
    echo

    #echo "Sleeping for 10 seconds ..."
    #sleep 10

    stop_be_apps $num
    start_be_apps $num $cps
    [ $? -ne 0 ] \
        && echo "Backend applications arn't available" && return 23 \
        || echo "Backend applications ready"
    echo
    start_post_install_actions || return 26

    #stop_be_apps $num
    #start_be_apps $num $cps
    #[ $? -ne 0 ] \
    #    && echo "Backend applications arn't available" && return 23 \
    #    || echo "Backend applications ready"
    #echo

    #echo "Starting Block Explorer ..."
    #start_blex
    #echo

    echo "Comparing backends 1_keys ..."
    cmp_keys $num || return 28
    echo

    echo "Comparing backends first blocks ..."
    cmp_first_blocks $num || return 29
    echo

    check_host_side $num $wps $cps $dbp
    stop_clients
    [ $? -ne 2 ] && start_clients $num $wps $cps
    # FIXME: add cfp
}

prep_fast_install_data() {
    local num; num=$1
    local wps; wps=$2
    local cps; cps=$3
    local dbp; dbp=$4
    local cfp; cfp=$CF_PORT # FIXME: change to argument
    local blexp; blexp=$BLEX_PORT # FIXME: change to argument

    local tot_cont_res; tot_cont_res=0

    local db_cont_res; check_cont $DB_CONT_NAME > /dev/null; db_cont_res=$? 
    [ $db_cont_res -ne 1 ] \
        && echo "DB container already exists. " \
        && tot_cont_res=1

    local cf_cont_res; check_cont $CF_CONT_NAME > /dev/null; cf_cont_res=$? 
    [ $cf_cont_res -ne 1 ] \
        && echo "Centrifugo container already exists. " \
        && tot_cont_res=1

    local rq_cont_res; check_cont $RQ_CONT_NAME > /dev/null; rq_cont_res=$? 
    [ $cf_cont_res -ne 1 ] \
        && echo "Redis queue container already exists. " \
        && tot_cont_res=1

    local blex_cont_res; check_cont $BLEX_CONT_NAME > /dev/null; blex_cont_res=$? 
    [ $blex_cont_res -ne 1 ] \
        && echo "Block explorer container already exists. " \
        && tot_cont_res=1

    local bf_cont_res; check_cont $BF_CONT_NAME > /dev/null; bf_cont_res=$? 
    [ $bf_cont_res -ne 1 ] \
        && echo "Backend/Frontend container already exists. " \
        && tot_cont_res=1

    if [ $tot_cont_res -ne 0 ]; then
        echo -n "Do you want to stop all running clients, delete containers and start a new installation? [y/N] "
        local stop; stop=0
        while [ $stop -eq 0 ]; do
            read -n 1 answ
            case $answ in
                y|Y)
                    echo
                    echo "OK, stopping clients, removing container ..."
                    delete_install
                    stop=1
                    ;;
                n|N)
                    echo
                    echo "OK, stopping installation ..."
                    return 5
                    ;;
            esac
        done
    fi
    
    start_db_cont $dbp

    wait_cont_proc $DB_CONT_NAME postgres 45
    [ $? -ne 0 ] \
        && echo "Postgres process isn't available" && return 10 \
        || echo "Postgres ready"

    wait_db_exists postgres 45
    [ $? -ne 0 ] \
        && echo "postgres database isn't available" && return 11 \
        || echo "postgres database ready"

    wait_db_exists template0 45
    [ $? -ne 0 ] \
        && echo "template0 database isn't available" && return 12 \
        || echo "template0 database ready"

    wait_db_exists template1 45
    [ $? -ne 0 ] \
        && echo "template1 database isn't available" && return 13 \
        || echo "template1 database ready"

    echo

    create_dbs $num 45
    [ $? -ne 0 ] \
        && echo "Backend databases creation failed" && return 14 \
        || echo "Backend databases creation compete"

    wait_dbs $num 45
    [ $? -ne 0 ] \
        && echo "Backend databases ant't available" && return 14 \
        || echo "Backend databases ready"
    echo

    start_cf_cont $cfp

    wait_cont_proc $CF_CONT_NAME centrifugo 10
    [ $? -ne 0 ] \
        && echo "Centrifugo process isn't available" && return 21 \
        || echo "Centrifugo ready"
    echo

    wait_centrifugo_status || return 21
    echo

    start_bf_cont $num $wps $cps

    wait_cont_proc $BF_CONT_NAME supervisord 15
    [ $? -ne 0 ] \
        && echo "Backend's supervisord isn't available" && return 21 \
        || echo "Backend's supervisord ready"

    wait_cont_proc $BF_CONT_NAME nginx 15
    [ $? -ne 0 ] \
        && echo "Frontend's nginx isn't available" && return 22 \
        || echo "Frontend's nginx ready"
    echo

    start_rq_cont

    wait_cont_proc $RQ_CONT_NAME redis-server 15
    [ $? -ne 0 ] \
        && echo "Redis server isn't available" && return 21 \
        || echo "Redis server ready"

    start_blex_cont $blexp

    wait_cont_proc $BLEX_CONT_NAME supervisord 15
    [ $? -ne 0 ] \
        && echo "Block explorer's supervisord isn't available" && return 21 \
        || echo "Block explorer's supervisord ready"

    setup_blex $num
    [ $? -ne 0 ] \
        && echo "Block explorer setup isn't completed" && return 23 \
        || echo "Block explorer setup is completed"
    echo
    stop_blex &

    ### Update ### 20180405 ### 08fad ### begin ###

    setup_be_apps $num $cps
    [ $? -ne 0 ] \
        && echo "Backend applications setup isn't completed" && return 23 \
        || echo "Backend applications setup is completed"
    echo

    ### Update ### 20180405 ### 08fad #### end ####

    start_be_apps $num $cps
    [ $? -ne 0 ] \
        && echo "Backend applications arn't available" && return 23 \
        || echo "Backend applications ready"
    echo

    setup_fe_apps $num $cps
    [ $? -ne 0 ] \
        && echo "Fronend applications setup isn't completed" && return 24 \
        || echo "Fronend applications setup is completed"
    echo

    start_fe_apps $num $cps
    [ $? -ne 0 ] \
        && echo "Fronend applications arn't available" && return 24 \
        || echo "Fronend applications are ready"
    echo

    stop_be_apps $num
    start_be_apps $num $cps
    [ $? -ne 0 ] \
        && echo "Backend applications arn't available" && return 23 \
        || echo "Backend applications ready"
    echo

    #start_update_keys # || return 5
    #echo

    #start_update_full_nodes || return 6
    #echo

    #keep_restart_be_apps_on_error $num 503 10 || return 7

    #start_import_demo_apps || return 9
    #echo

    #echo "Comparing backends 1_keys ..."
    #cmp_keys $num || return 28
    #echo

    #echo "Comparing backends first blocks ..."
    #cmp_first_blocks $num || return 29
    #echo

    #check_host_side $num $wps $cps $dbp
    #stop_clients
    #[ $? -ne 2 ] && start_clients $num $wps $cps
    ## FIXME: add cfp
}

find_first_dbs_dumps() {
    local dir
    [ -z "$1" ] && dir="$SCRIPT_DIR" || dir="$1"
    db_dumps="$(cd "$dir" && find . -mindepth 1 -maxdepth 1 -name 'dbs-and-data-dirs-*' | tail -1)"
    [ -n "$db_dumps" ] && echo "$db_dumps"
}

prep_fast_install_data_set() {
    local i src_dir session

    delete_install
    clear_install_params
    save_install_params $MAX_NUM_OF_NODES

    prep_fast_install_data $MAX_NUM_OF_NODES || return 1
    start_import_initial_apps || return 2
    start_sys_params_tweaks || return 3
    keep_restart_be_apps_on_error $MAX_NUM_OF_NODES 503 10 || return 4

    safe_dump_be_dbs_and_data_dirs_non_inter
    src_dir="$(find_first_dbs_dumps)" || return 5
    safe_restore_be_dbs_and_data_dirs_non_inter "$src_dir"

    session="$(date '+%Y%m%d%H%M%S')"

    for i in $(seq $MAX_NUM_OF_NODES 1); do
        delete_install
        clear_install_params
        save_install_params $i
        prep_fast_install_data $i || return 6
        keep_restart_be_apps_on_error $i 503 10 || return 7
        restore_fast_install_data "$src_dir" || return 8
 
        start_update_keys || return 9
        start_update_full_nodes || return 10 
        keep_restart_be_apps_on_error $num 503 10 || return 11 
        start_import_demo_apps || return 12 
        dump_fast_install_data $session
    done
    [ ! -e "$src_dir" ] || rm "$src_dir"
    echo "DONE"
}

get_fast_install_data_url() {
    echo "$FAST_INSTALL_DATA_URL" | sed -E "s/(.*)([0-9]+)(-nodes.*)/\1$1\3/g"
}

get_fast_install_data_basename() {
    echo "$FAST_INSTALL_DATA_BASENAME" | sed -E "s/(.*)([0-9]+)(-nodes.*)/\1$1\3/g"
}

get_fast_install_data_path() {
    echo "$SCRIPT_DIR/$(get_fast_install_data_basename $1)"
}

start_fast_install() {
    local num; num=$1
    local wps; wps=$2
    local cps; cps=$3
    local dbp; dbp=$4
    local cfp; cfp=$CF_PORT # FIXME: change to argument
    local blexp; blexp=$BLEX_PORT # FIXME: change to argument

    local tot_cont_res; tot_cont_res=0

    local db_cont_res; check_cont $DB_CONT_NAME > /dev/null; db_cont_res=$? 
    [ $db_cont_res -ne 1 ] \
        && echo "DB container already exists. " \
        && tot_cont_res=1

    local cf_cont_res; check_cont $CF_CONT_NAME > /dev/null; cf_cont_res=$? 
    [ $cf_cont_res -ne 1 ] \
        && echo "Centrifugo container already exists. " \
        && tot_cont_res=1

    local rq_cont_res; check_cont $RQ_CONT_NAME > /dev/null; rq_cont_res=$? 
    [ $cf_cont_res -ne 1 ] \
        && echo "Redis queue container already exists. " \
        && tot_cont_res=1

    local blex_cont_res; check_cont $BLEX_CONT_NAME > /dev/null; blex_cont_res=$? 
    [ $blex_cont_res -ne 1 ] \
        && echo "Block explorer container already exists. " \
        && tot_cont_res=1

    local bf_cont_res; check_cont $BF_CONT_NAME > /dev/null; bf_cont_res=$? 
    [ $bf_cont_res -ne 1 ] \
        && echo "Backend/Frontend container already exists. " \
        && tot_cont_res=1

    if [ $tot_cont_res -ne 0 ]; then
        echo -n "Do you want to stop all running clients, delete containers and start a new installation? [y/N] "
        local stop; stop=0
        while [ $stop -eq 0 ]; do
            read -n 1 answ
            case $answ in
                y|Y)
                    echo
                    echo "OK, stopping clients, removing container ..."
                    delete_install
                    stop=1
                    ;;
                n|N)
                    echo
                    echo "OK, stopping installation ..."
                    return 5
                    ;;
            esac
        done
    fi
    
    start_db_cont $dbp

    wait_cont_proc $DB_CONT_NAME postgres 45
    [ $? -ne 0 ] \
        && echo "Postgres process isn't available" && return 10 \
        || echo "Postgres ready"

    wait_db_exists postgres 45
    [ $? -ne 0 ] \
        && echo "postgres database isn't available" && return 11 \
        || echo "postgres database ready"

    wait_db_exists template0 45
    [ $? -ne 0 ] \
        && echo "template0 database isn't available" && return 12 \
        || echo "template0 database ready"

    wait_db_exists template1 45
    [ $? -ne 0 ] \
        && echo "template1 database isn't available" && return 13 \
        || echo "template1 database ready"

    echo

    create_dbs $num 45
    [ $? -ne 0 ] \
        && echo "Backend databases creation failed" && return 14 \
        || echo "Backend databases creation compete"

    wait_dbs $num 45
    [ $? -ne 0 ] \
        && echo "Backend databases ant't available" && return 14 \
        || echo "Backend databases ready"
    echo

    start_cf_cont $cfp

    wait_cont_proc $CF_CONT_NAME centrifugo 10
    [ $? -ne 0 ] \
        && echo "Centrifugo process isn't available" && return 21 \
        || echo "Centrifugo ready"
    echo

    wait_centrifugo_status || return 21
    echo

    start_bf_cont $num $wps $cps

    wait_cont_proc $BF_CONT_NAME supervisord 15
    [ $? -ne 0 ] \
        && echo "Backend's supervisord isn't available" && return 21 \
        || echo "Backend's supervisord ready"

    wait_cont_proc $BF_CONT_NAME nginx 15
    [ $? -ne 0 ] \
        && echo "Frontend's nginx isn't available" && return 22 \
        || echo "Frontend's nginx ready"
    echo

    start_rq_cont

    wait_cont_proc $RQ_CONT_NAME redis-server 15
    [ $? -ne 0 ] \
        && echo "Redis server isn't available" && return 21 \
        || echo "Redis server ready"

    start_blex_cont $blexp

    wait_cont_proc $BLEX_CONT_NAME supervisord 15
    [ $? -ne 0 ] \
        && echo "Block explorer's supervisord isn't available" && return 21 \
        || echo "Block explorer's supervisord ready"
    stop_blex &

    #setup_blex $num
    #[ $? -ne 0 ] \
    #    && echo "Block explorer setup isn't completed" && return 23 \
    #    || echo "Block explorer setup is completed"
    #echo
    #stop_blex &

    ### Update ### 20180405 ### 08fad ### begin ###

    #setup_be_apps $num $cps
    #[ $? -ne 0 ] \
    #    && echo "Backend applications setup isn't completed" && return 23 \
    #    || echo "Backend applications setup is completed"
    #echo

    ### Update ### 20180405 ### 08fad #### end ####

    #start_be_apps $num $cps
    #[ $? -ne 0 ] \
    #    && echo "Backend applications arn't available" && return 23 \
    #    || echo "Backend applications ready"
    #echo

    #echo "Sleeping for 10 seconds ..."
    #sleep 10

    #stop_be_apps $num

    setup_be_apps $num $cps
    [ $? -ne 0 ] \
        && echo "Backend applications setup isn't completed" && return 23 \
        || echo "Backend applications setup is completed"
    echo

    #start_post_install_actions || return 26
    local data_path data_url result
    data_url="$(get_fast_install_data_url $num)"
    data_basename="$(get_fast_install_data_basename $num)"
    data_path="$(get_fast_install_data_path $num)"
    download_fast_install_data "$data_url" "$data_path" || return 28
    restore_fast_install_data "$data_path" || return 26
    [ ! -e "$data_path" ] || rm "$data_path"

    setup_fe_apps $num $cps
    [ $? -ne 0 ] \
        && echo "Fronend applications setup isn't completed" && return 24 \
        || echo "Fronend applications setup is completed"
    echo

    start_fe_apps $num $cps
    [ $? -ne 0 ] \
        && echo "Fronend applications arn't available" && return 24 \
        || echo "Fronend applications are ready"
    echo

    #start_be_apps $num $cps
    #[ $? -ne 0 ] \
    #    && echo "Backend applications arn't available" && return 23 \
    #    || echo "Backend applications ready"
    #echo

    setup_blex $num
    [ $? -ne 0 ] \
        && echo "Block explorer setup isn't completed" && return 23 \
        || echo "Block explorer setup is completed"
    echo
    start_blex

    echo "Comparing backends 1_keys ..."
    cmp_keys $num || return 28
    echo

    echo "Comparing backends first blocks ..."
    cmp_first_blocks $num || return 29
    echo

    check_host_side $num $wps $cps $dbp
    stop_clients
    [ $? -ne 2 ] && start_clients $num $wps $cps
    # FIXME: add cfp
}

stop_all() {
    stop_clients
    check_cont $BF_CONT_NAME > /dev/null
    [ $? -eq 0 ] \
        && echo "Stopping $BF_CONT_NAME ..." && docker stop $BF_CONT_NAME
    check_cont $CF_CONT_NAME > /dev/null
    [ $? -eq 0 ] \
        && echo "Stopping $CF_CONT_NAME ..." && docker stop $CF_CONT_NAME
    check_cont $RQ_CONT_NAME > /dev/null
    [ $? -eq 0 ] \
        && echo "Stopping $RQ_CONT_NAME ..." && docker stop $RQ_CONT_NAME
    check_cont $BLEX_CONT_NAME > /dev/null
    [ $? -eq 0 ] \
        && echo "Stopping $BLEX_CONT_NAME ..." && docker stop $BLEX_CONT_NAME
    check_cont $DB_CONT_NAME > /dev/null
    [ $? -eq 0 ] \
        && echo "Stopping $DB_CONT_NAME ..." && docker stop $DB_CONT_NAME
}

get_conts_dates() {

    echo -n "Date @ $DB_CONT_NAME: " \
        && (cont_exec $DB_CONT_NAME date -u || echo "absent") 

    echo -n "Date @ $BF_CONT_NAME: " \
        && (cont_exec $BF_CONT_NAME date -u || echo "absent")

    echo -n "Date @ $CF_CONT_NAME: " \
        && (cont_exec $CF_CONT_NAME date -u || echo "absent")

    echo -n "Date @ $RQ_CONT_NAME: " \
        && (cont_exec $RQ_CONT_NAME date -u || echo "absent")

    echo -n "Date @ $BLEX_CONT_NAME: " \
        && (cont_exec $BLEX_CONT_NAME date -u || echo "absent")

}

start_all() {
    local num
    local wps
    local cps
    local dbp
    local cfp; cfp=$CF_PORT # FIXME: Change to argument
    local blexp; blexp=$BLEX_PORT # FIXME: Change to argument

    read_install_params_to_vars || return 1

    start_db_cont $dbp

    wait_cont_proc $DB_CONT_NAME postgres 35
    [ $? -ne 0 ] \
        && echo "Postgres process isn't available" && return 10 \
        || echo "Postgres ready"

    wait_db_exists postgres 35
    [ $? -ne 0 ] \
        && echo "postgres database isn't available" && return 11 \
        || echo "postgres database ready"

    wait_db_exists template0 35
    [ $? -ne 0 ] \
        && echo "template0 database isn't available" && return 12 \
        || echo "template0 database ready"

    wait_db_exists template1 35
    [ $? -ne 0 ] \
        && echo "template1 database isn't available" && return 13 \
        || echo "template1 database ready"

    echo

    wait_dbs $num 35
    [ $? -ne 0 ] \
        && echo "Backend databases ant't available" && return 14 \
        || echo "Backend databases ready"
    echo

    start_cf_cont $cfp

    wait_cont_proc $CF_CONT_NAME centrifugo 10
    [ $? -ne 0 ] \
        && echo "Centrifugo process isn't available" && return 21 \
        || echo "Centrifugo ready"
    echo

    wait_centrifugo_status || return 5
    echo

    start_bf_cont $num $wps $cps

    wait_cont_proc $BF_CONT_NAME supervisord 15
    [ $? -ne 0 ] \
        && echo "Backend's supervisord isn't available" && return 21 \
        || echo "Backend's supervisord ready"

    wait_cont_proc $BF_CONT_NAME nginx 15
    [ $? -ne 0 ] \
        && echo "Backend's nginx isn't available" && return 22 \
        || echo "Backend's nginx ready"
    echo

    start_rq_cont

    wait_cont_proc $RQ_CONT_NAME redis-server 15
    [ $? -ne 0 ] \
        && echo "Redis server isn't available" && return 21 \
        || echo "Redis server ready"

    start_blex_cont $blexp

    wait_cont_proc $BLEX_CONT_NAME supervisord 15
    [ $? -ne 0 ] \
        && echo "Block explorer's supervisord isn't available" && return 21 \
        || echo "Block explorer's supervisord ready"

    setup_blex $num
    [ $? -ne 0 ] \
        && echo "Block explorer setup isn't completed" && return 23 \
        || echo "Block explorer setup is completed"
    echo
    stop_blex &

    keep_restart_be_apps_on_error $num 503 10 || return 2
    echo 

    wait_backend_apps_status $num || return 2
    echo

    wait_frontend_apps_status $num || return 3
    echo

    echo "Restarting Block Explorer ..."
    restart_blex
    echo

    check_host_side $num $wps $cps $dbp
    [ $? -ne 2 ] && start_clients $num $wps $cps
    # FIXME: Add $cfp param
}

show_status() {
    local num
    local wps
    local cps
    local dbp
    local blexp

    read_install_params_to_vars || return 1


    local cont_status; cont_status=0
    echo
    echo -n "Dababase container status: "
    get_cont_status $DB_CONT_NAME; cont_status=$?
    echo -n "Centrifugo container status: "
    get_cont_status $CF_CONT_NAME; cont_status=$?
    echo -n "Redis queue container status: "
    get_cont_status $RQ_CONT_NAME; cont_status=$?
    echo -n "Block explorer container status: "
    get_cont_status $BLEX_CONT_NAME; cont_status=$?
    echo -n "Backends/Frontends container status: "
    get_cont_status $BF_CONT_NAME; cont_status=$?
    echo

    [ $cont_status -ne 0 ] \
        && echo "Containers status: FAILED" \
        && return 2

    check_centrifugo_status
    echo

    check_backend_apps_status $num
    echo

    check_frontend_apps_status $num
    echo

    check_host_side $num $wps $cps $dbp
}

### Docker Images ### begin ###

show_all_docker_images() {
    local img_name
    for img_name in ${BF_CONT_IMAGE%%:*} ${DB_CONT_IMAGE%%:*} ${RQ_CONT_IMAGE%%:*} ${CF_CONT_IMAGE%%:*} ${BLEX_CONT_IMAGE%%:*}; do
        echo "img_name: $img_name"
        docker images -f reference="$img_name:*" --format '{{.ID}} {{.Repository}} {{.Tag}}'
    done
}

show_docker_images() {
    local img_name
    for img_name in ${BF_CONT_IMAGE} ${DB_CONT_IMAGE} ${RQ_CONT_IMAGE} ${CF_CONT_IMAGE} ${BLEX_CONT_IMAGE}; do
        docker images -f reference="$img_name" --format '{{.ID}} {{.Repository}} {{.Tag}}'
    done
}

show_prev_docker_images() {
    local img_name
    for img_name in ${BF_CONT_PREV_IMAGE} ${DB_CONT_PREV_IMAGE} ${RQ_CONT_IMAGE} ${CF_CONT_PREV_IMAGE} ${BLEX_CONT_PREV_IMAGE}; do
        docker images -f reference="$img_name" --format '{{.ID}} {{.Repository}} {{.Tag}}'
    done
}

### Docker Images #### end ####


### Scripts Config ### begin ###

update_scripts_config_content() {
    local cf os_type sed_i_cmd val_esc sed_cmd
    [ -z "$1" ] \
        && echo "Path to scripts config isn't set" && return 1 \
        || cf="$1"

    os_type="$(get_os_type)"
    case $os_type in
        linux) sed_i_cmd="$SED_E -i" ;;
        mac) sed_i_cmd="$SED_E -i .bak" ;;
        *)
            echo "Sorry, but $os_type is not supported yet"
            exit 23
            ;;
    esac

    val_esc="$(echo "$PRODUCT_BRAND_NAME" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/(PRODUCT_BRAND_NAME=)([^ ]+)[ ]*$/\1\"$val_esc\"/' $cf"
    eval "$sed_cmd"

    val_esc="$(echo "$BLEX_DB_NAME_PREFIX" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/^(BLEX_DB_NAME_PREFIX=)([^ ]+)[ ]*$/\1\"$val_esc\"/' $cf"
    eval "$sed_cmd"

    val_esc="$(echo "$DB_NAME_PREFIX" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/^(DB_NAME_PREFIX=)([^ ]+)[ ]*$/\1\"$val_esc\"/' $cf"
    eval "$sed_cmd"

    val_esc="$(echo "$BLEX_REDIS_URL" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/^(BLEX_REDIS_URL=)([^ ]+)[ ]*$/\1\"$val_esc\"/' $cf"
    eval "$sed_cmd"

    val_esc="$(echo "$DB_USER" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/(DB_USER=)([^ ]+)[ ]*$/\1\"$val_esc\"/' $cf"
    eval "$sed_cmd"

    val_esc="$(echo "$DB_HOST" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/(DB_HOST=)([^ ]+)[ ]*$/\1\"$val_esc\"/' $cf"
    eval "$sed_cmd"

    val_esc="$(echo "$BE_API_URL_PREFIX" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/(BE_API_URL_PREFIX=)([^ ]+)[ ]*$/\1\"$val_esc\"/' $cf"
    eval "$sed_cmd"

    val_esc="$(echo "$DB_PASSWORD" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/(DB_PASSWORD=)([^ ]+)[ ]*$/\1\"$val_esc\"/' $cf"
    eval "$sed_cmd"

    val_esc="$(echo "$CENT_URL" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/(CENT_URL=)([^ ]+)[ ]*$/\1\"$val_esc\"/' $cf"
    eval "$sed_cmd"

    val_esc="$(echo "$BLEX_REPO_URL" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/(BLEX_REPO_URL=)([^ ]+)[ ]*$/\1\"$val_esc\"/' $cf"
    eval "$sed_cmd"

    val_esc="$(echo "$BLEX_BRANCH" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/(BLEX_BRANCH=)([^ ]+)[ ]*$/\1\"$val_esc\"/' $cf"
    eval "$sed_cmd"
}

update_be_scripts_config() {
    update_scripts_config_content "$SCRIPT_DIR/$BE_CONT_BUILD_DIR/scripts.config.sh"
}

update_bf_scripts_config() {
    update_scripts_config_content "$SCRIPT_DIR/$BF_CONT_BUILD_DIR/scripts.config.sh"
}

update_blex_scripts_config() {
    update_scripts_config_content "$SCRIPT_DIR/$BLEX_CONT_BUILD_DIR/scripts.config.sh"
}

### Scripts Config #### end ####


### Dockerfile ### begin ###

update_fe_dockerfile_content() {
    local df os_type sed_i_cmd sed_cmd be_br_esc demo_apps_url_esc
    local fe_repo_url_esc fe_br_esc njss_url_esc
    [ -z "$1" ] \
        &&  echo "Path to Dockerfile isn't set" && return 1 \
        || df="$1"
    [ ! -e "$df" ] \
           && echo "No '$df' file. Please create it first" && return 1

    os_type="$(get_os_type)"
    case $os_type in
        linux) sed_i_cmd="$SED_E -i" ;;
        mac) sed_i_cmd="$SED_E -i .bak" ;;
        *)
            echo "Sorry, but $os_type is not supported yet"
            exit 23
            ;;
    esac

    fe_repo_url_esc="$(echo "$FRONTEND_REPO_URL" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/(ENV[ ]+FRONTEND_REPO_URL[ ]+)([^ ]+)[ ]*$/\1$fe_repo_url_esc/' $df"
    eval "$sed_cmd"

    fe_br_esc="$(echo "$FRONTEND_BRANCH" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/(ENV[ ]+FRONTEND_BRANCH[ ]+)([^ ]+)[ ]*$/\1$fe_br_esc/' $df"
    eval "$sed_cmd"

    njss_url_esc="$(echo "$NODEJS_SETUP_SCRIPT_URL" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/(ENV[ ]+NODEJS_SETUP_SCRIPT_URL[ ]+)([^ ]+)[ ]*$/\1$njss_url_esc/' $df"
    eval "$sed_cmd"
}

update_be_dockerfile_content() {
    local df os_type sed_i_cmd sed_cmd be_br_esc demo_apps_url_esc
    local be_go_url_esc be_br_esc sc_repo_url_esc sc_br_esc
    [ -z "$1" ] \
        &&  echo "Path to Dockerfile isn't set" && return 1 \
        || df="$1"
    [ ! -e "$df" ] \
           && echo "No '$df' file. Please create it first" && return 1

    os_type="$(get_os_type)"
    case $os_type in
        linux) sed_i_cmd="$SED_E -i" ;;
        mac) sed_i_cmd="$SED_E -i .bak" ;;
        *)
            echo "Sorry, but $os_type is not supported yet"
            exit 23
            ;;
    esac

    sed_cmd="$sed_i_cmd 's/(ENV[ ]+GOLANG_VER[ ]+)([0-9a-zA-Z\.\-]+)$/\1$GOLANG_VER/' $df"
    eval "$sed_cmd"

    be_go_url_esc="$(echo "$BACKEND_GO_URL" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/(ENV[ ]+BACKEND_GO_URL[ ]+)([^ ]+)[ ]*$/\1$be_go_url_esc/' $df"
    eval "$sed_cmd"

    be_br_esc="$(echo "$BACKEND_BRANCH" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/(ENV[ ]+BACKEND_BRANCH[ ]+)([^ ]+)[ ]*$/\1$be_br_esc/' $df"
    eval "$sed_cmd"

    be_bin_bn_esc="$(echo "$BE_BIN_BASENAME" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/(ENV[ ]+BE_BIN_BASENAME[ ]+)([^ ]+)[ ]*$/\1$be_bin_bn_esc/' $df"
    eval "$sed_cmd"

    sc_repo_url_esc="$(echo "$SCRIPTS_REPO_URL" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/(ENV[ ]+SCRIPTS_REPO_URL[ ]+)([^ ]+)[ ]*$/\1$sc_repo_url_esc/' $df"
    eval "$sed_cmd"

    sc_br_esc="$(echo "$SCRIPTS_BRANCH" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/(ENV[ ]+SCRIPTS_BRANCH[ ]+)([^ ]+)[ ]*$/\1$sc_br_esc/' $df"
    eval "$sed_cmd"

    demo_apps_url_esc="$(echo "$DEMO_APPS_URL" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd 's/(ENV[ ]+DEMO_APPS_URL[ ]+)([^ ]+)[ ]*$/\1$demo_apps_url_esc/' $df"
    eval "$sed_cmd"
}

update_blex_dockerfile_content() {
    local df os_type sed_i_cmd sed_cmd be_br_esc demo_apps_url_esc
    local blex_repo_url_esc blex_br_esc sc_repo_url_esc sc_br_esc
    [ -z "$1" ] \
        &&  echo "Path to Dockerfile isn't set" && return 1 \
        || df="$1"
    [ ! -e "$df" ] \
           && echo "No '$df' file. Please create it first" && return 1

    os_type="$(get_os_type)"
    case $os_type in
        linux) sed_i_cmd="$SED_E -i" ;;
        mac) sed_i_cmd="$SED_E -i .bak" ;;
        *)
            echo "Sorry, but $os_type is not supported yet"
            exit 23
            ;;
    esac

    blex_repo_url_esc="$(echo "$BLEX_REPO_URL" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/(ENV[ ]+BLEX_REPO_URL[ ]+)([^ ]+)[ ]*$/\1$blex_repo_url_esc/' $df"
    eval "$sed_cmd"

    blex_br_esc="$(echo "$BLEX_BRANCH" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/(ENV[ ]+BLEX_BRANCH[ ]+)([^ ]+)[ ]*$/\1$blex_br_esc/' $df"
    eval "$sed_cmd"

    sc_repo_url_esc="$(echo "$SCRIPTS_REPO_URL" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/(ENV[ ]+SCRIPTS_REPO_URL[ ]+)([^ ]+)[ ]*$/\1$sc_repo_url_esc/' $df"
    eval "$sed_cmd"

    sc_br_esc="$(echo "$SCRIPTS_BRANCH" | $SED_E 's/\//\\\//g')"
    sed_cmd="$sed_i_cmd -e 's/(ENV[ ]+SCRIPTS_BRANCH[ ]+)([^ ]+)[ ]*$/\1$sc_br_esc/' $df"
    eval "$sed_cmd"

}

update_be_dockerfile() {
    update_be_dockerfile_content "$SCRIPT_DIR/$BE_CONT_BUILD_DIR/Dockerfile"
}

update_fe_dockerfile() {
    update_fe_dockerfile_content "$SCRIPT_DIR/$FE_CONT_BUILD_DIR/Dockerfile"
}

update_blex_dockerfile() {
    update_blex_dockerfile_content "$SCRIPT_DIR/$BLEX_CONT_BUILD_DIR/Dockerfile"
}

update_bf_dockerfile() {
    update_be_dockerfile_content "$SCRIPT_DIR/$BF_CONT_BUILD_DIR/Dockerfile"
    update_fe_dockerfile_content "$SCRIPT_DIR/$BF_CONT_BUILD_DIR/Dockerfile"
}

### Dockerfile #### end ####


### Help ### begin ###

### Update ### 20180405 ### 08fad ### begin ###
show_brief_help() {
    echo
    echo "Usage help: $(basename "$0") <command> <parameter>"
    echo
    echo "  Commands:"
    echo
    echo "  help"
    echo "   Show detailed help"
    echo
    echo "  install NUM [WPS] [CPS] [DBP]"
    echo "    Install Docker, Client, database and backend containers"
    echo "      NUM - number of clients/backends (mandatory)"
    echo "      WPS - web port shift (optional, default: $WEB_PORT_SHIFT)"
    echo "      CPS - client port shift (optional, default: $CLIENT_PORT_SHIFT)"
    echo "      DBP - database host port (optional, default: $DB_PORT)"
    echo "    Example:"
    echo "      $(basename "$0") install 3 8000 17000"
    echo "      will install Docker, Client, start database container,"
    echo "      start container with 3 frontends (web ports 8001, 8002, 8003)"
    echo "      and 3 backends (client ports 17001, 17002, 17003),"
    echo "      setup database for them and finally start 3 clients"
    echo
    echo "  reinstall"
    echo "    Stop clients, remove existing containers and start a new installation"
    echo "    with the last installation parameters"
    echo
    echo "  params"
    echo "    Show install params"
    echo
    echo "  start"
    echo "    Start containers, apps and clients"
    echo
    echo "  stop"
    echo "    Stop clients and containers"
    echo
    echo "  status"
    echo "    Show status of containers, databases, backends and frontends"
    echo
    echo "  start-clients"
    echo "    Start clients with latest installation parameters"
    echo 
    echo "  stop-clients"
    echo "    Stop clients"
    echo 
    echo "  restart-clients"
    echo "    Restart clients"
    echo 
    echo "  delete"
    echo "    Stop clients and delete all ${USE_PRODUCT}-related docker containers"
    echo
    echo "  delete-all"
    echo "    Stop clients and delete all ${USE_PRODUCT}-related docker containers and images"
    echo
    echo "  uninstall-docker"
    echo "    Docker unintaller for macOS"
    echo
    echo "  uninstall-client"
    echo "    Client unintaller for macOS"
    echo
    echo "  founder-key"
    echo "    Show founder's (1st backend) private key"
}

show_detailed_help() {
    show_brief_help
    echo "  priv-key [BE_NUM]"
    echo "    Show appropriate backend's private key"
    echo
    echo "  be-apps-ctl [CMD]"
    echo "    Control backend applications."
    echo "    CMD - command, available: status, start, stop, restart"
    echo 
    echo "  block-chain-count"
    echo "    Show the number of records in each backend's block_chain table"
    echo 
    echo "  db-shell [BE_NUM]"
    echo "    Run database shell (psql) connected to backend's database"
    echo "    BE_NUM - backend's number"
    echo
    echo "  db-query [BE_NUM]"
    echo "    Run SQL-query at backend's database"
    echo "    BE_NUM - backend's number"
    echo
    echo "  uninstall-docker"
    echo "    Docker unintaller for macOS"
    echo
    echo "  uninstall-client"
    echo "    Client unintaller for macOS"
    echo
    echo "  build-images"
    echo "    Build all (database and backend/frontend) container images"
    echo
    echo "  build-bf-image"
    echo "    Build backend/frontend container image"
    echo
    echo "  build-db-image"
    echo "    Build database container image"
    echo
    echo "  build-cf-image"
    echo "    Build centrifugo container image"
    echo
    echo "  build-rq-image"
    echo "    Build redis queue container image"
    echo
    echo "  build-blex-image"
    echo "    Build block explorer container image"
    echo
}

### Update ### 20180405 ### 08fad #### end ####

### Help #### end ####


### Run ### begin ###

pre_command() {
    check_requirements
}

[ "$0" = "$BASH_SOURCE" ] && pre_command && case $1 in

    ### OS ### begin ###

    is-root)
        is_root
        ;;

    as-user)
        shift 1
        run_as_orig_user $@
        ;;

    create-dl-dir)
        create_downloads_dir
        ;;

    homedir)
        shift 1
        get_orig_user_homedir
        ;;

    os-type)
        get_os_type
        ;;

    linux-dist)
        get_linux_dist
        ;;

    check-min-req)
        check_min_req
        ;;

    ### OS #### end ####


    ### Disk, FS ### begin ###

    dev-by-path)
        get_mnt_dev_by_path "$2"
        ;;

    fs-by-path)
        get_fs_type_by_path "$2"
        ;;

    ### Disk, FS #### end ####


    ### Docker ### begin ###

    uninstall-docker)
        uninstall_docker
        ;;

    install-docker)
        check_run_as_root
        install_mac_docker_directly
        ;;

    check-docker-proc)
        check_proc docker
        ;;

    wait-docker-proc)
        wait_proc docker
        ;;

    check-docker-ready)
        check_docker_ready_status
        ;;

    wait-docker-ready)
        wait_docker_ready_status
        ;;

    download-client)
        download_and_check_dmg "$CLIENT_DMG_DL_URL" "$CLIENT_DMG_BASENAME"
        echo "res: $?"
        ;;

    fast-install-data-url|fi-url)
        data_url="$(get_fast_install_data_url $2)"
        echo "data_url: $data_url"
        ;;

    fast-install-data-path|fi-path)
        data_path="$(get_fast_install_data_path $2)"
        echo "data_path: $data_path"
        ;;


    download-fast-install-data|dl-fi-data)
        download_fast_install_data "$FAST_INSTALL_DATA_URL" "$FAST_INSTALL_DATA_BASENAME"
        echo "res: $?"
        ;;

    install-client)
        check_run_as_root
        install_mac_client_directly
        ;;

    uninstall-client)
        stop_clients
        uninstall_client
        ;;

    start-docker)
        check_run_as_root
        start_docker
        ;;

    check-mac-docker-proc)
        check_mac_docker_proc
        ;;

    ### Docker #### end ####


    ### Common Container ### begin ###

    wait-cont-proc)
        wait_cont_proc $2 $3 $4 && echo "OK"
        ;;

    delete-all-docker-cont*)
        docker ps -a --format '{{.ID}}' | xargs docker rm -f
        ;;

    ### Common Container #### end ####


    ### Common Volume ### begin ###

    delete-all-docker-volumes)
        docker volume ls --format '{{.Name}}' | xargs docker volume rm
        ;;

    ### Common Volume #### end ####


    ### Common Images ### begin ###

    delete-all-docker-images)
        docker ps -a --format '{{.ID}}' | xargs docker rm -f
        docker images -a --format '{{.ID}}' | xargs docker rmi -f
        ;;

    ### Common Images #### end ####


    ### Host ports ### begin ###

    host-port-proc)
        get_host_port_proc $2
        ;;

    check-host-ports)
        check_host_ports $2 $3 $4 $5 $6
        ;;

    check-host-side)
        check_host_side $2 $3 $4 $5 $6
        ;;

    ### Host ports #### end ####


    ### Clients ### begin ###

    install-client)
        install_linux_client_directly
        ;;

    start-clients)
        params="$(read_install_params)"
        [ -z "$params" ] \
            && echo "No install parameters found. Please start install first" \
            && exit 50
        start_clients $params
        ;;

    stop-clients)
        stop_clients
        ;;

    clients-running)
        are_clients_running
        ;;

    clients-pids)
        get_mac_clients_pids
        ;;

    restart-clients)
        stop_clients
        params="$(read_install_params)"
        [ -z "$params" ] \
            && echo "No install parameters found. Please start install first" \
            && exit 50
        start_clients $params
        ;;

    restart-running-clients)
        restart_running_clients
        ;;

    ### Clients #### end ####


    ### DB container ### begin ###

    prep-db-cont)
        check_run_as_root
        prep_cont_for_inspect $DB_CONT_NAME
        ;;

    db-cont-bash|db-cont-sh|db-cont-shell)
        check_run_as_root
        cont_bash $DB_CONT_NAME
        ;;

    start-db-cont)
        check_run_as_root
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        start_db_cont $dbp
        ;;

    stop-db-cont)
        check_run_as_root
        docker stop $DB_CONT_NAME
        ;;

    delete-db-cont)
        check_run_as_root
        remove_cont $DB_CONT_NAME
        ;;

        
    ### DB Container #### end ####


    ### DB Image ### begin ###

    delete-db-image)
        check_run_as_root
        docker rmi -f $DB_CONT_IMAGE
        ;;

    build-db-image)
        check_run_as_root
        (cd "$SCRIPT_DIR" \
            && docker build -t $DB_CONT_NAME -f $DB_CONT_BUILD_DIR/Dockerfile $DB_CONT_BUILD_DIR/.)
        ;;

    delete-prev-db-image)
        check_run_as_root
        docker rmi -f $DB_CONT_PREV_IMAGE
        ;;

    pull-db-image)
        check_run_as_root
        docker pull $DB_CONT_IMAGE
        ;;
        
    pull-prev-db-image)
        check_run_as_root
        docker pull $DB_CONT_PREV_IMAGE
        ;;

    tag-local-db-image)
        check_run_as_root
        docker tag $DB_CONT_NAME $DB_CONT_IMAGE
        ;;

    tag-prev-db-image)
        check_run_as_root
        docker tag $DB_CONT_PREV_IMAGE $DB_CONT_IMAGE
        ;;

    push-db-image)
        check_run_as_root
        docker push $DB_CONT_IMAGE
        ;;

    up-prev-db-image)
        check_run_as_root
        docker pull $DB_CONT_PREV_IMAGE
        docker tag $DB_CONT_PREV_IMAGE $DB_CONT_IMAGE
        echo
        echo -n "Are you sure to push '$DB_CONT_IMAGE' image to docker hub [y/n]? "
        read -n 1 answ
        case $answ in
            y|Y) docker push $DB_CONT_IMAGE ;;
            *) echo; echo "OK, skipping the pushing ..." ;;
        esac
        ;;

    ### DB Image #### end ####


    ### BF container ### begin ###

    start-bf-cont)
        check_run_as_root
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        start_bf_cont $num $wps $cps
        ;;

    stop-bf-cont)
        check_run_as_root
        docker stop $BF_CONT_NAME
        ;;

    restart-bf-cont)
        check_run_as_root
        docker stop $BF_CONT_NAME
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        start_bf_cont $num $wps $cps
        ;;

    prep-bf-cont)
        check_run_as_root
        prep_cont_for_inspect $BF_CONT_NAME
        ;;

    bf-cont-bash|bf-cont-sh|bf-cont-shell)
        check_run_as_root
        cont_bash $BF_CONT_NAME
        ;;

    delete-bf-cont)
        check_run_as_root
        remove_cont $BF_CONT_NAME
        ;;
        
    ### BF Container #### end ####


    ### Scripts Config ### begin ###

    up-be-scf|update-be-scripts-config)
        update_be_scripts_config
        ;;

    up-bf-scf|update-bf-scripts-config)
        update_bf_scripts_config
        ;;

    up-blex-scf|update-blex-scripts-config)
        update_blex_scripts_config
        ;;

    up-scfs|update-scripts-configs)
        update_be_scripts_config \
            && update_bf_scripts_config \
            && update_blex_scripts_config
        ;;

    ### Scripts Config #### end ####

    
    ### Dockerfile ### begin ###

    up-be-df|up-be-dockerfile|update-be-dockerfile)
        update_be_dockerfile || exit 41
        ;;

    up-fe-df|up-fe-dockerfile|update-be-dockerfile)
        update_fe_dockerfile || exit 41
        ;;

    up-blex-df|up-blex-dockerfile|update-blex-dockerfile)
        update_blex_dockerfile || exit 41
        ;;

    up-bf-df|up-bf-dockerfile|update-bf-dockerfile)
        update_bf_dockerfile || exit 41
        ;;

    up-dfs|up-dockerfiles|update-dockerfiles)
        update_be_dockerfile \
            && update_fe_dockerfile \
            && update_blex_dockerfile \
            && update_bf_dockerfile || exit 41
        ;;

    ### Dockerfile #### end ####




    ### FE Image ### begin ###

    build-fe-image)
        check_run_as_root
        update_fe_dockerfile || exit 41
        (cd "$script_dir" \
            && docker build -t $FE_CONT_NAME -f $FE_CONT_BUILD_DIR/Dockerfile $FE_CONT_BUILD_DIR/.)
        ;;

    ### FE Image #### end ####


    ### BE container ### begin ###

    start-be-cont)
        check_run_as_root
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        start_be_cont $num $wps $cps
        ;;

    stop-be-cont)
        check_run_as_root
        docker stop $BE_CONT_NAME
        ;;

    restart-be-cont)
        check_run_as_root
        docker stop $BE_CONT_NAME
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        start_be_cont $num $wps $cps
        ;;

    prep-be-cont)
        check_run_as_root
        prep_cont_for_inspect $BE_CONT_NAME
        ;;

    be-cont-bash|be-cont-sh|be-cont-shell)
        check_run_as_root
        cont_bash $BE_CONT_NAME
        ;;

    delete-be-cont)
        check_run_as_root
        remove_cont $BE_CONT_NAME
        ;;
        
    ### BE Container #### end ####


    ### BE Dockerfile ### begin ###

    up-be-dockerfile)
        update_be_dockerfile || exit 41
        ;;

    ### BE Dockerfile #### end ####


    ### BE Image ### begin ###

    build-be-image)
        check_run_as_root
        update_be_dockerfile || exit 41
        (cd "$script_dir" \
            && docker build -t $BE_CONT_NAME -f $BE_CONT_BUILD_DIR/Dockerfile $BE_CONT_BUILD_DIR/.)
        ;;

    ### BE Image #### end ####


    ### BF Image ### begin ###

    build-bf-image)
        check_run_as_root
        update_bf_dockerfile || exit 41
        (cd "$script_dir" \
            && docker build -t $BF_CONT_NAME -f $BF_CONT_BUILD_DIR/Dockerfile $BF_CONT_BUILD_DIR/.)
        ;;

    delete-bf-image)
        check_run_as_root
        docker rmi -f $BF_CONT_IMAGE
        ;;

    delete-prev-bf-image)
        check_run_as_root
        docker rmi -f $BF_CONT_PREV_IMAGE
        ;;

    pull-bf-image)
        check_run_as_root
        docker pull $BF_CONT_IMAGE
        ;;
        
    pull-prev-bf-image)
        check_run_as_root
        docker pull $BF_CONT_PREV_IMAGE
        ;;

    tag-local-bf-image)
        check_run_as_root
        docker tag $BF_CONT_NAME $BF_CONT_IMAGE
        ;;

    tag-prev-bf-image)
        check_run_as_root
        docker tag $BF_CONT_PREV_IMAGE $BF_CONT_IMAGE
        ;;

    push-bf-image)
        check_run_as_root
        docker push $BF_CONT_IMAGE
        ;;

    up-prev-bf-image)
        check_run_as_root
        docker pull $BF_CONT_PREV_IMAGE
        docker tag $BF_CONT_PREV_IMAGE $BF_CONT_IMAGE
        echo
        echo -n "Are you sure to push '$BF_CONT_IMAGE' image to docker hub [y/n]? "
        read -n 1 answ
        case $answ in
            y|Y) docker push $BF_CONT_IMAGE ;;
            *) echo; echo "OK, skipping the pushing ..." ;;
        esac
        ;;

    ### BF Image #### end ####


    ### CF container ### begin ###

    start-cf-cont)
        check_run_as_root
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        start_cf_cont
        ;;

    stop-cf-cont)
        check_run_as_root
        docker stop $CF_CONT_NAME
        ;;

    restart-cf-cont)
        check_run_as_root
        docker stop $CF_CONT_NAME
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        start_cf_cont $num $wps $cps
        ;;

    prep-cf-cont)
        check_run_as_root
        prep_cont_for_inspect_centos7 $CF_CONT_NAME
        ;;

    cf-cont-bash|cf-cont-sh|cf-cont-shell)
        check_run_as_root
        cont_bash $CF_CONT_NAME
        ;;

    delete-cf-cont)
        check_run_as_root
        remove_cont $CF_CONT_NAME
        ;;
        
    ### CF Container #### end ####


    ### CF Image ### begin ###

    build-cf-image)
        check_run_as_root
        (cd "$SCRIPT_DIR" \
            && docker build -t $CF_CONT_NAME -f $CF_CONT_BUILD_DIR/Dockerfile $CF_CONT_BUILD_DIR/.)
        ;;

    delete-cf-image)
        check_run_as_root
        docker rmi -f $CF_CONT_IMAGE
        ;;

    delete-prev-cf-image)
        check_run_as_root
        docker rmi -f $CF_CONT_PREV_IMAGE
        ;;

    pull-cf-image)
        check_run_as_root
        docker pull $CF_CONT_IMAGE
        ;;
        
    pull-prev-cf-image)
        check_run_as_root
        docker pull $CF_CONT_PREV_IMAGE
        ;;

    tag-local-cf-image)
        check_run_as_root
        docker tag $CF_CONT_NAME $CF_CONT_IMAGE
        ;;

    tag-prev-cf-image)
        check_run_as_root
        docker tag $CF_CONT_PREV_IMAGE $CF_CONT_IMAGE
        ;;

    push-cf-image)
        check_run_as_root
        docker push $CF_CONT_IMAGE
        ;;

    up-prev-cf-image)
        check_run_as_root
        docker pull $CF_CONT_PREV_IMAGE
        docker tag $CF_CONT_PREV_IMAGE $CF_CONT_IMAGE
        echo
        echo -n "Are you sure to push '$CF_CONT_IMAGE' image to docker hub? [y/n] "
        read -n 1 answ
        case $answ in
            y|Y) docker push $CF_CONT_IMAGE ;;
            *) echo; echo "OK, skipping the pushing ..." ;;
        esac
        ;;

    ### CF Image #### end ####


    ### RQ container ### begin ###

    start-rq-cont)
        check_run_as_root
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        start_rq_cont
        ;;

    stop-rq-cont)
        check_run_as_root
        docker stop $RQ_CONT_NAME
        ;;

    restart-rq-cont)
        check_run_as_root
        docker stop $RQ_CONT_NAME
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        start_rq_cont $num $wps $cps
        ;;

    prep-rq-cont)
        check_run_as_root
        prep_cont_for_inspect_centos7 $RQ_CONT_NAME
        ;;

    rq-cont-bash|rq-cont-sh|rq-cont-shell)
        check_run_as_root
        cont_bash $RQ_CONT_NAME
        ;;

    delete-rq-cont)
        check_run_as_root
        remove_cont $RQ_CONT_NAME
        ;;
        
    ### RQ Container #### end ####


    ### RQ Image ### begin ###

    build-rq-image)
        check_run_as_root
        (cd "$SCRIPT_DIR" \
            && docker build -t $RQ_CONT_NAME -f $RQ_CONT_BUILD_DIR/Dockerfile $RQ_CONT_BUILD_DIR/.)
        ;;

    delete-rq-image)
        check_run_as_root
        docker rmi -f $RQ_CONT_IMAGE
        ;;

    delete-prev-rq-image)
        check_run_as_root
        docker rmi -f $RQ_CONT_PREV_IMAGE
        ;;

    pull-rq-image)
        check_run_as_root
        docker pull $RQ_CONT_IMAGE
        ;;
        
    pull-prev-rq-image)
        check_run_as_root
        docker pull $RQ_CONT_PREV_IMAGE
        ;;

    tag-local-rq-image)
        check_run_as_root
        docker tag $RQ_CONT_NAME $RQ_CONT_IMAGE
        ;;

    tag-prev-rq-image)
        check_run_as_root
        docker tag $RQ_CONT_PREV_IMAGE $RQ_CONT_IMAGE
        ;;

    push-rq-image)
        check_run_as_root
        docker push $RQ_CONT_IMAGE
        ;;

    up-prev-rq-image)
        check_run_as_root
        docker pull $RQ_CONT_PREV_IMAGE
        docker tag $RQ_CONT_PREV_IMAGE $RQ_CONT_IMAGE
        echo
        echo -n "Are you sure to push '$RQ_CONT_IMAGE' image to docker hub? [y/n] "
        read -n 1 answ
        case $answ in
            y|Y) docker push $RQ_CONT_IMAGE ;;
            *) echo; echo "OK, skipping the pushing ..." ;;
        esac
        ;;

    ### RQ Image #### end ####


    ### BLEX container ### begin ###

    start-blex-cont)
        check_run_as_root
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        start_blex_cont $blexp
        ;;

    stop-blex-cont)
        check_run_as_root
        docker stop $BLEX_CONT_NAME
        ;;

    restart-blex-cont)
        check_run_as_root
        docker stop $BLEX_CONT_NAME
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        restart_blex_cont $blexp
        ;;

    prep-blex-cont)
        check_run_as_root
        prep_cont_for_inspect $BLEX_CONT_NAME
        ;;

    blex-cont-bash|blex-cont-sh|blex-cont-shell)
        check_run_as_root
        cont_bash $BLEX_CONT_NAME
        ;;

    delete-blex-cont)
        check_run_as_root
        remove_cont $BLEX_CONT_NAME
        ;;
        
    ### BLEX Container #### end ####


    ### BLEX Image ### begin ###

    build-blex-image)
        check_run_as_root
        update_blex_dockerfile || exit 41
        (cd "$SCRIPT_DIR" \
            && docker build -t $BLEX_CONT_NAME -f $BLEX_CONT_BUILD_DIR/Dockerfile $BLEX_CONT_BUILD_DIR/.)
        ;;

    delete-blex-image)
        check_run_as_root
        docker rmi -f $BLEX_CONT_IMAGE
        ;;

    delete-prev-blex-image)
        check_run_as_root
        docker rmi -f $BLEX_CONT_PREV_IMAGE
        ;;

    pull-blex-image)
        check_run_as_root
        docker pull $BLEX_CONT_IMAGE
        ;;
        
    pull-prev-blex-image)
        check_run_as_root
        docker pull $BLEX_CONT_PREV_IMAGE
        ;;

    tag-local-blex-image)
        check_run_as_root
        docker tag $BLEX_CONT_NAME $BLEX_CONT_IMAGE
        ;;

    tag-prev-blex-image)
        check_run_as_root
        docker tag $BLEX_CONT_PREV_IMAGE $BLEX_CONT_IMAGE
        ;;

    push-blex-image)
        check_run_as_root
        docker push $BLEX_CONT_IMAGE
        ;;

    up-prev-blex-image)
        check_run_as_root
        docker pull $BLEX_CONT_PREV_IMAGE
        docker tag $BLEX_CONT_PREV_IMAGE $BLEX_CONT_IMAGE
        echo
        echo -n "Are you sure to push '$BLEX_CONT_IMAGE' image to docker hub? [y/n] "
        read -n 1 answ
        case $answ in
            y|Y) docker push $BLEX_CONT_IMAGE ;;
            *) echo; echo "OK, skipping the pushing ..." ;;
        esac
        ;;

    ### BLEX Image #### end ####

    
    ### Common Image ### begin ###

    pull-images)
        check_run_as_root
        docker pull $DB_CONT_IMAGE
        docker pull $CF_CONT_IMAGE
        docker pull $BF_CONT_IMAGE
        docker pull $BLEX_CONT_IMAGE
        ;;

    pull-prev-images)
        check_run_as_root
        docker pull $DB_CONT_PREV_IMAGE
        docker pull $CF_CONT_PREV_IMAGE
        docker pull $BF_CONT_PREV_IMAGE
        docker pull $BLEX_CONT_PREV_IMAGE
        ;;

    ### Common Image #### end ####


    ### Database ### begin ###

    create-dbs)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        create_dbs $num
        ;;

    init-be-dbs)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        init_be_dbs $num
        ;;

    db-shell)
        run_db_shell $2
        ;;

    db-query)
        do_db_query comn $2 $3
        ;;

    block-chain-count)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        block_chain_count $num
        ;;

    first-blocks)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        get_first_blocks $num
        ;;
        
    cmp-first-blocks)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        cmp_first_blocks $num
        ;;

    keys)
        [ -z "$2" ] && echo "Backend number isn't set" && exit 58
        do_db_query comn $2 "select \* from \"1_keys\" order by id;"
        ;;

    cmp-keys)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        cmp_keys $num
        ;;

    wait-keys)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        wait_keys_sync $num
        ;;

    pg-ver)
        get_pg_major_ver_from_dockerfile
        ;;

    pgdata)
        get_pgdata_var_value_from_dockerfile
        ;;

    restart-db-server|restart-db-srv)
        restart_db_server
        ;;

    ### Database #### end ####


    ### BLEX ### begin ###

    create-blex-dbs)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 19
        create_blex_dbs $num
        ;;

    setup-blex)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 19
        setup_blex $num
        ;;

    setop-blex)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        start_blex
        ;;


    start-blex)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        start_blex
        ;;

    stop-blex)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        stop_blex
        ;;

    restart-blex)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        restart_blex
        ;;

    ### BLEX #### end ####


    ### Backend ### begin ###

    touch-file)
        docker exec -ti $BF_CONT_NAME bash -c 'touch /BBBB'
        ;;

    rm-file)
        docker exec -ti $BF_CONT_NAME bash -c '[ -e /BBBB ] && rm /BBBB'
        ;;

    check-file)
        docker exec -ti $BF_CONT_NAME bash -c '[ -e /BBBB ] && echo "exists" || echo "does not exist"'
        ;;

    check-be-apps)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 16
        check_backend_apps_status $num
        ;;

    be-apps-ctl)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 17
        backend_apps_ctl $num $2
        ;;

    be-app-ctl)
        backend_app_ctl $2 $3
        ;;

    http-priv-key)
        [ -z "$2" ] \
            && echo "The index number of a backend isn't set" \
            && exit 30
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 18
        get_http_priv_key "http://127.0.0.1:PORT/keys/PrivateKey" $2 200 64 $wps
        ;;

    priv-key)
        get_priv_key $2
        ;;

    founder-key)
        get_priv_key 1
        ;;

    priv-keys)
        get_priv_keys $2
        ;;

    key-id)
        get_key_id $2
        ;;

    key-ids)
        get_key_ids $2
        ;;

    pub-key)
        get_pub_key $2
        ;;

    pub-keys)
        get_pub_keys $2
        ;;

    n-pub-keys)
        get_first_n_pub_keys $2
        ;;


    node-pub-keys)
        get_node_pub_keys $2
        ;;

    api-url)
        get_api_url $2
        ;;

    api-urls)
        get_api_urls $2
        ;;

    api-int-url|int-api-url)
        get_int_api_url $2
        ;;

    api-int-urls|int-api-urls)
        get_int_api_urls $2
        ;;

    tcp-int-addr|int-tcp-addr)
        get_int_tcp_addr $2
        ;;

    tcp-int-addrs|int-tcp-addrs)
        get_int_tcp_addrs $2
        ;;

    setup-be-apps)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 19
        setup_be_apps $num
        ;;


    start-be-apps)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 19
        start_be_apps $num $cps
        ;;

    keep-restart-be-apps-on-error)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 19
        keep_restart_be_apps_on_error $num 503 3
        ;;

    stop-be-apps)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 19
        stop_be_apps $num
        ;;

    wait-be-apps)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 19
        wait_backend_apps_status $num || exit 19
        ;;

    check-priv-key)
        [ -z "$2" ] \
            && echo "The index number of a backend isn't set" \
            && exit 32
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 19
        check_http_priv_key "http://127.0.0.1:PORT/keys/PrivateKey" $2 200 64 $wps
        ;;

    wait-priv-key)
        [ -z "$2" ] \
            && echo "The index number of a backend isn't set" \
            && exit 33
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 20
        wait_http_priv_key "http://127.0.0.1:PORT/keys/PrivateKey" $2 200 64 20 $wps
        ;;

    check-uid)
        [ -z "$2" ] \
            && echo "The index number of a backend isn't set" \
            && exit 33
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 21
        [ -z "$cps" ] && cps=$CLIENT_PORT_SHIFT
        c_port=$(expr $cps + $2)
        check_http_len http://127.0.0.1:$c_port/api/v2/getuid 200,201 100
        ;;

    uid)
        [ -z "$2" ] \
            && echo "The index number of a backend isn't set" \
            && exit 33
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 21
        [ -z "$cps" ] && cps=$CLIENT_PORT_SHIFT
        c_port=$(expr $cps + $2)
        get_http_len http://127.0.0.1:$c_port/api/v2/getuid 200,201 100
        ;;

    tail-be-log)
        tail_be_log $2
        ;;

    cp-be-log)
        cp_be_log $2 $3
        ;;

    cp-be-logs)
        cp_be_logs $2
        ;;

    null-be-log)
        null_be_log $2
        ;;

    null-be-logs)
        null_be_logs
        ;;

    dump-be-db)
        dump_be_db $2
        ;;

    safe-dump-be-db)
        safe_dump_be_db $2 $3
        ;;

    safe-dump-be-dbs)
        safe_dump_be_dbs $2
        ;;

    fast-safe-dump-be-dbs|fdump)
        fast_safe_dump_be_dbs $2
        ;;

    drop-blex-db)
        drop_blex_db $2
        ;;

    drop-blex-dbs)
        drop_blex_dbs
        ;;

    create-blex-db)
        create_blex_db $2
        ;;

    create-blex-dbs)
        create_blex_dbs
        ;;

    drop-be-db)
        drop_be_db $2
        ;;

    drop-be-dbs)
        drop_be_dbs
        ;;

    create-be-db)
        create_be_db $2
        ;;

    create-be-dbs)
        create_be_dbs
        ;;

    safe-recreate-be-db)
        safe_recreate_be_db $2
        ;;

    restore-be-db)
        restore_be_db $2 $3
        ;;

    safe-restore-be-db)
        safe_restore_be_db $2 $3
        ;;

    restore-be-dbs)
        restore_be_dbs $2
        ;;

    safe-restore-be-dbs)
        safe_restore_be_dbs $2
        ;;

    fast-safe-restore-be-dbs|frest)
        fast_safe_restore_be_dbs $2
        ;;

    dump-be-data-dir)
        dump_be_data_dir $2 $3
        ;;

    restore-be-data-dir)
        restore_be_data_dir $2 $3
        ;;

    safe-restore-be-data-dir)
        safe_restore_be_data_dir $2 $3
        ;;
        
    dump-be-data-dirs)
        dump_be_data_dirs $2
        ;;

    safe-restore-be-data-dirs)
        safe_restore_be_data_dirs $2
        ;;

    dump-be-all)
        safe_dump_be_dbs_and_data_dirs $2
        ;;

    restore-be-all)
        safe_restore_be_dbs_and_data_dirs $2
        ;;

    dump-fast-install-data|dump-fi-data)
        dump_fast_install_data $2
        ;;

    prep-fi-ds)    
        prep_fast_install_data_set
        ;;

    find-first-dbs-dump)
        find_first_dbs_dumps .
        ;;

    restore-fast-install-data|rest-fi-data)
        restore_fast_install_data $2
        ;;

    update-keys)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 21
        start_update_keys $2
        ;;

    sys-tweaks)
        start_sys_params_tweaks
        ;;

    update-full-nodes)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 21
        start_update_full_nodes $num
        ;;

    demo-page-url)
        get_demo_page_url_from_dockerfile
        ;;

    post-install-actions)
        start_post_install_actions
        ;;

    import-init-apps|import-initial-aps)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 21
        start_import_initial_apps
        ;;

    import-demo-apps)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 21
        start_import_demo_apps
        ;;

    import-es-apps)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 21
        start_import_es_apps
        ;;

    import-crediting)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 21
        start_import_crediting
        setup_crediting
        ;;

    setup-crediting)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 21
        setup_crediting
        ;;

    import-land-reg)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 21
        start_import_land_reg
        ;;

    import-token-sale)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 21
        start_import_token_sale
        ;;

    import-from-file)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 21
        import_from_file "$2" $3 $4
        ;;

    import-from-url)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 21
        import_from_url "$2" $3 $4
        ;;

    demo-apps-ver)
        get_demo_apps_ver || exit 63
        ;;

    build-be)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 21
        build_be $num || exit 61
        ;;

    dev-build-be)
        num=""; wps=""; cps=""; dbp=""; blexp=""
        read_install_params_to_vars || exit 21
        dev_build_be $num || exit 61
        ;;

    clean-be-build)
        clean_be_build || exit 61
        ;;

    be-ver|be-version)
        get_be_version || exit 61
        ;;

    be-git-ver|be-git-version)
        get_be_git_ver || exit 61
        ;;

    mbs)
        shift 1
        run_mbs_cmd $@
        ;;

    mblex)
        shift 1
        run_mblex_cmd $@
        ;;

    ### Backend #### end ####


    ### Frontend ### begin ###

    setup-fe-apps)
        shift 1
        setup_fe_apps $@
        ;;

    start-fe-apps)
        shift 1
        start_fe_apps $@
        ;;

    build-fe)
        build_fe || exit 62
        ;;

    clean-fe-build)
        clean_fe_build || exit 62
        ;;

    fe-ver|fe-version)
        get_fe_ver || exit 63
        ;;

    fe-git-ver|fe-git-version)
        get_fe_git_ver || exit 63
        ;;

    ### Frontend #### end ####


    ### Main #### begin ###

    install)
        check_run_as_root
        check_num_param $2
        start_docker
        check_host_ports $2 $3 $4 $5 $6
        [ $? -ne 0 ] \
            && echo "Please free busy ports first or customize ports shifts" \
            && exit 100
        echo
        save_install_params $2 $3 $4 $5 $6
        start_install $2 $3 $4 $5 $6
        ;;

    fast-install|finstall)
        check_run_as_root
        check_num_param $2
        start_docker
        check_host_ports $2 $3 $4 $5 $6
        [ $? -ne 0 ] \
            && echo "Please free busy ports first or customize ports shifts" \
            && exit 100
        echo
        save_install_params $2 $3 $4 $5 $6
        start_fast_install $2 $3 $4 $5 $6
        ;;


    set-params)
        echo "Saving install parameters ..."
        check_num_param $2
        save_install_params $2 $3 $4 $5 $6
        ;;

    del-params)
        echo "Removing install parameters ..."
        clear_install_params
        ;;

    params)
        show_install_params
        ;;

    reinstall)
        check_run_as_root
        params="$(read_install_params)"
        [ -z "$params" ] \
            && echo "No install parameters found. Please start install first" \
            && exit 50
        delete_install
        start_install $(read_install_params) 
        ;;

    fast-reinstall|freinstall)
        check_run_as_root
        params="$(read_install_params)"
        [ -z "$params" ] \
            && echo "No install parameters found. Please start install first" \
            && exit 50
        delete_install
        start_fast_install $(read_install_params) 
        ;;

    stop)
        check_run_as_root
        stop_all
        ;;

    start)
        check_run_as_root
        start_all
        ;;

    status)
        check_run_as_root
        show_status
        ;;

    build-images)
        check_run_as_root
        (cd "$SCRIPT_DIR" \
            && docker build -t $DB_CONT_NAME -f $DB_CONT_BUILD_DIR/Dockerfile $DB_CONT_BUILD_DIR/.)
        (cd "$SCRIPT_DIR" \
            && docker build -t $CF_CONT_NAME -f $CF_CONT_BUILD_DIR/Dockerfile $CF_CONT_BUILD_DIR/.)
        (cd "$SCRIPT_DIR" \
            && docker build -t $RQ_CONT_NAME -f $RQ_CONT_BUILD_DIR/Dockerfile $RQ_CONT_BUILD_DIR/.)
        (cd "$SCRIPT_DIR" \
            && docker build -t $DB_CONT_NAME -f $DB_CONT_BUILD_DIR/Dockerfile $DB_CONT_BUILD_DIR/.)
        (cd "$SCRIPT_DIR" \
            && docker build -t $BLEX_CONT_NAME -f $BLEX_CONT_BUILD_DIR/Dockerfile $BLEX_CONT_BUILD_DIR/.)
        ;;

    delete)
        check_run_as_root
        delete_install
        clear_install_params
        ;;

    images)
        show_docker_images
        ;;

    prev-images)
        show_prev_docker_images
        ;;

    all-images)
        show_all_docker_images
        ;;

    delete-all)
        check_run_as_root
        stop_clients
        stop_all
        delete_install
        clear_install_params
        show_all_docker_images | while read line; do
            image_id="$(echo "$line" | awk '{print $1}')"
            docker rmi -f $image_id
        done
        ;;

    build-tag-push-all-images)
        "$0" build-cf-image \
            && "$0" tag-local-cf-image \
            && "$0" push-cf-image \
        && "$0" build-db-image \
            && "$0" tag-local-db-image \
            && "$0" push-db-image \
        && "$0" build-rq-image \
            && "$0" tag-local-rq-image \
            && "$0" push-rq-image \
        && "$0" build-blex-image \
            && "$0" tag-local-blex-image \
            && "$0" push-blex-image \
        && "$0" build-bf-image \
            && "$0" tag-local-bf-image \
            && "$0" push-bf-image \
        update_be_dockerfile \
        update_bf_dockerfile \
        update_blex_dockerfile \
        update_fe_dockerfile
        ;;

    dates)
        get_conts_dates
        ;;

    product)
        echo "$USE_PRODUCT"
        ;;

    version)
        echo "$VERSION"
        ;;

    versions)
        get_versions
        ;;

    help)
        show_detailed_help
        ;;

    *)
        show_brief_help
        ;;
esac

### Run #### end ####
