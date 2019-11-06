PRODUCT_BRAND_NAME="Apla"
DB_HOST="apla-db"
DB_NAME_PREFIX="apla"
DB_USER="postgres"
DB_PASSWORD="apla"
CENT_URL="http://apla-cf:8000"
BLEX_REPO_URL="https://github.com/AplaProject/blockexplorer"
BLEX_BRANCH="v0.3.3"

ENV_VARS_PREFIX="GENESIS"

BE_BIN_BASENAME="go-apla"
BE_ROOT_LOG_DIR="/var/log/$BE_BIN_BASENAME"
BE_BIN_DIR="$BE_ROOT/bin"
BE_BIN_PATH="$BE_BIN_DIR/$BE_BIN_BASENAME"

SUPERVISOR_BASE_CONF_DIR="/etc/supervisor"
SUPERVISOR_CONF_D_DIR="$SUPERVISOR_BASE_CONF_DIR/conf.d"
SUPERVISOR_CONF_PATH="$SUPERVISOR_BASE_CONF_DIR/supervisord.conf"
SUPERVISOR_BE_NODE1_CONF_PATH="$SUPERVISOR_CONF_D_DIR/$BE_BIN_BASENAME.conf"

read -r -d '' SUPERVISOR_BE_NODE1_CONF << EOM
[program:$BE_BIN_BASENAME]
command=$BE_BIN_PATH start --config=$BE_ROOT_DATA_DIR/node1/config.toml
user = root
stdout_events_enabled = true
stderr_events_enabled = true
autorestart = true
EOM
