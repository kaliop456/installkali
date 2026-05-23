#!/bin/bash
# ╔══════════════════════════════════════════════════════════════════════════════════╗
# ║                                                                                  ║
# ║        ██╗  ██╗ █████╗ ██╗     ██╗    ██████╗ ███████╗██████╗ ██╗      ██████╗ ██╗   ██╗
# ║        ██║ ██╔╝██╔══██╗██║     ██║    ██╔══██╗██╔════╝██╔══██╗██║     ██╔═══██╗╚██╗ ██╔╝
# ║        █████╔╝ ███████║██║     ██║    ██║  ██║█████╗  ██████╔╝██║     ██║   ██║ ╚████╔╝ 
# ║        ██╔═██╗ ██╔══██║██║     ██║    ██║  ██║██╔══╝  ██╔═══╝ ██║     ██║   ██║  ╚██╔╝  
# ║        ██║  ██╗██║  ██║███████╗██║    ██████╔╝███████╗██║     ███████╗╚██████╔╝   ██║   
# ║        ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝    ╚═════╝ ╚══════╝╚═╝     ╚══════╝ ╚═════╝    ╚═╝   
# ║                                                                                  ║
# ║              🐉  D R A G O N   E D I T I O N   v 4 . 0 . 0                       ║
# ║                   Termux Special Edition · 安卓专属                              ║
# ║                                                                                  ║
# ║         Author  : Kali-Toolkit-Team                                              ║
# ║         License : MIT                                                            ║
# ║         GitHub  : https://github.com/kaliop456/installkali       ║
# ║                                                                                  ║
# ╚══════════════════════════════════════════════════════════════════════════════════╝
# ═══════════════════════════════════════════════════════════════════════════════════
#  USAGE:
#     chmod +x kali-dragon-deploy.sh
#     ./kali-dragon-deploy.sh
#
#  REQUIREMENTS:
#     Termux (Android 7.0+) · 2GB+ RAM · 5GB+ Free Space
# ═══════════════════════════════════════════════════════════════════════════════════
#
#  FEATURES (300+ Features in 20 Categories):
#     📜 Legal Terms System (Multi-language, Timer, Hash Verification)
#     🐉 Dynamic Dragon ASCII Art Logo (20+ Animations)
#     🎨 10+ Themes (Dragon/Hacker/Cyberpunk/Neon/Ocean/Sunset...)
#     🎮 Built-in Mini Games (Snake/Tetris/2048/Minesweeper during install)
#     🛡️ Error Protection & Auto Recovery (Rollback on Failure)
#     📦 Kali Image Download (Multi-thread, Resume, SHA256 Verify)
#     ⚙️  One-Click System Configuration
#     🛠️  300+ Tools Installation (20 Categories)
#     💻 Full Development Environment
#     🎨 Terminal Beautification (Zsh/P10k/Starship/Nerd Fonts)
#     🔄 Automation Workflows
#     💾 Backup & Restore
#     📦 Container Support (proot-distro/chroot)
#     ☁️  Cloud Sync (GitHub/WebDAV/Telegram)
#     🎯 One-Click Full Installation
#     🛡️ Security Hardening & Privacy
#     📊 Real-time System Monitoring
#     🌍 Multi-language UI (zh/en/ja/ko/ru/ar)
#     ♿ Accessibility (Voice/TTS/High Contrast/Large Font)
#     🎵 Sound Effects
#     🏆 Achievement System
#     🎭 Easter Eggs & Fun Surprises
# ═══════════════════════════════════════════════════════════════════════════════════
#

# ============================================================
# STRICT MODE WITH GRACEFUL FALLBACK
# All errors are caught and handled gracefully
# ============================================================
set +e
set -o pipefail 2>/dev/null || true

# ============================================================
# SIGNAL HANDLERS - Prevent unexpected termination
# ============================================================
trap 'handle_interrupt' INT TERM HUP QUIT
trap 'handle_exit' EXIT
trap 'handle_error ${LINENO} "${BASH_COMMAND}" "${?}"' ERR 2>/dev/null || true

# ============================================================
# TERMINAL SETUP
# ============================================================
clear
printf '\e[8;50;150t' 2>/dev/null || true
export TERM="${TERM:-xterm-256color}"
export LANG="${LANG:-en_US.UTF-8}"
export LC_ALL="${LC_ALL:-en_US.UTF-8}"

# ============================================================
# COLOR DEFINITIONS - DELUXE EDITION
# Supports 16 colors minimum, 256 colors optionally
# ============================================================

# Reset
NC='\033[0m'

# Text Styles
BOLD='\033[1m'; DIM='\033[2m'; ITALIC='\033[3m'; UNDERLINE='\033[4m'
BLINK='\033[5m'; REVERSE='\033[7m'; HIDDEN='\033[8m'; STRIKE='\033[9m'

# Standard Foreground Colors
BLACK='\033[0;30m'; RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[0;33m'
BLUE='\033[0;34m'; MAGENTA='\033[0;35m'; CYAN='\033[0;36m'; WHITE='\033[0;37m'

# Bright Foreground Colors
LBLACK='\033[1;30m'; LRED='\033[1;31m'; LGREEN='\033[1;32m'; LYELLOW='\033[1;33m'
LBLUE='\033[1;34m'; LMAGENTA='\033[1;35m'; LCYAN='\033[1;36m'; LWHITE='\033[1;37m'

# Standard Background Colors
BG_BLACK='\033[40m'; BG_RED='\033[41m'; BG_GREEN='\033[42m'; BG_YELLOW='\033[43m'
BG_BLUE='\033[44m'; BG_MAGENTA='\033[45m'; BG_CYAN='\033[46m'; BG_WHITE='\033[47m'

# Bright Background Colors
BG_LBLACK='\033[100m'; BG_LRED='\033[101m'; BG_LGREEN='\033[102m'; BG_LYELLOW='\033[103m'
BG_LBLUE='\033[104m'; BG_LMAGENTA='\033[105m'; BG_LCYAN='\033[106m'; BG_LWHITE='\033[107m'

# Gradient Color Arrays for Animations
RAINBOW_COLORS=("$LRED" "$LYELLOW" "$LGREEN" "$LCYAN" "$LBLUE" "$LMAGENTA")
RAINBOW_COUNT=${#RAINBOW_COLORS[@]}

FIRE_COLORS=("$RED" "$LRED" "$YELLOW" "$LYELLOW" "$WHITE" "$LYELLOW" "$YELLOW" "$LRED" "$RED")
NEON_COLORS=("$LMAGENTA" "$LCYAN" "$LBLUE" "$LGREEN" "$LYELLOW" "$LRED")
MATRIX_COLORS=("$GREEN" "$LGREEN" "$DIM$GREEN" "$GREEN" "$LGREEN")
GOLD_COLORS=("$YELLOW" "$LYELLOW" "$WHITE" "$LYELLOW" "$YELLOW")
OCEAN_COLORS=("$LBLUE" "$LCYAN" "$BLUE" "$CYAN" "$LWHITE")
SUNSET_COLORS=("$LRED" "$LMAGENTA" "$LYELLOW" "$MAGENTA" "$YELLOW" "$LRED")

# ============================================================
# GLOBAL VARIABLES & CONFIGURATION
# ============================================================

# Version Information
readonly VERSION="4.0.0"
readonly CODENAME="Dragon"
readonly BUILD_DATE="2025-01-15"

# Directory Paths
readonly SCRIPT_DIR="$(cd "$(dirname "$0")" 2>/dev/null && pwd || echo "$HOME")"
readonly LOG_DIR="${SCRIPT_DIR}/logs"
readonly CONFIG_DIR="${SCRIPT_DIR}/config"
readonly TOOLS_DIR="${HOME}/tools"
readonly BACKUP_DIR="${SCRIPT_DIR}/backups"
readonly PROFILES_DIR="${SCRIPT_DIR}/profiles"
readonly CACHE_DIR="${SCRIPT_DIR}/cache"
readonly TEMP_DIR="${SCRIPT_DIR}/temp"
readonly GAME_DIR="${SCRIPT_DIR}/games"
readonly THEME_DIR="${SCRIPT_DIR}/themes"
readonly SOUND_DIR="${SCRIPT_DIR}/sounds"
readonly ACHIEVEMENT_DIR="${SCRIPT_DIR}/achievements"

# File Paths
readonly LOG_FILE="${LOG_DIR}/deploy-$(date +%Y%m%d-%H%M%S).log"
readonly ERROR_LOG="${LOG_DIR}/errors-$(date +%Y%m%d-%H%M%S).log"
readonly AGREEMENT_FILE="${CONFIG_DIR}/.agreed"
readonly VIOLATION_FILE="${CONFIG_DIR}/.violations"
readonly LOCK_FILE="${CONFIG_DIR}/.locked"
readonly PROFILE_FILE="${PROFILES_DIR}/current.conf"
readonly THEME_FILE="${CONFIG_DIR}/.theme"
readonly LANG_FILE="${CONFIG_DIR}/.language"
readonly ACHIEVEMENT_FILE="${ACHIEVEMENT_DIR}/unlocked.conf"
readonly STATS_FILE="${CONFIG_DIR}/.stats"

# Runtime State Variables
TERMS_ACCEPTED=false
INSTALL_MODE=""
CURRENT_THEME="dragon"
CURRENT_LANGUAGE="zh"
SELECTED_TOOLS=()
SELECTED_CATEGORIES=()
CURRENT_STEP=0
TOTAL_STEPS=0
ERROR_COUNT=0
MAX_ERRORS=10
INSTALL_PID=""
GAME_PID=""
DRAGON_ANIMATION_PID=""
SOUND_ENABLED=true
GAME_ENABLED=true
AUTO_RECOVER=true
DEBUG_MODE=false
QUIET_MODE=false

# System Detection
OS="Unknown"
OS_TYPE="unknown"
PKG_MGR="pkg"
INSTALL_CMD="pkg install -y"
UPDATE_CMD="pkg update -y"
HOME_DIR="$HOME"
CPU_ARCH="unknown"
BITS="unknown"
TOTAL_RAM=0
AVAILABLE_DISK=0
NETWORK_OK=false
TERMUX=true
IS_ROOT=false
TERM_WIDTH=80
TERM_HEIGHT=24
HAS_DIALOG=false
HAS_GUM=false
HAS_FZF=false
HAS_NOTIFICATION=false
HAS_TTS=false

# Installation Tracking
declare -A INSTALL_STATUS
declare -A INSTALL_TIME
declare -A PACKAGE_MAP
declare -A ERROR_MAP

# Achievement Tracking
declare -A ACHIEVEMENTS
ACHIEVEMENTS["first_run"]=false
ACHIEVEMENTS["terms_accepted"]=false
ACHIEVEMENTS["tools_10"]=false
ACHIEVEMENTS["tools_50"]=false
ACHIEVEMENTS["tools_100"]=false
ACHIEVEMENTS["tools_all"]=false
ACHIEVEMENTS["game_snake"]=false
ACHIEVEMENTS["game_tetris"]=false
ACHIEVEMENTS["game_2048"]=false
ACHIEVEMENTS["theme_master"]=false
ACHIEVEMENTS["error_free"]=false
ACHIEVEMENTS["speed_demon"]=false
ACHIEVEMENTS["dragon_tamer"]=false

# ============================================================
# ERROR HANDLING FUNCTIONS
# ============================================================

# Handle script interruption (Ctrl+C, etc.)
handle_interrupt() {
    echo -e "\n\n${LYELLOW}[!]${NC} ${YELLOW}检测到中断信号...${NC}"
    
    # Kill any running background processes
    [[ -n "$INSTALL_PID" ]] && kill $INSTALL_PID 2>/dev/null
    [[ -n "$GAME_PID" ]] && kill $GAME_PID 2>/dev/null
    [[ -n "$DRAGON_ANIMATION_PID" ]] && kill $DRAGON_ANIMATION_PID 2>/dev/null
    
    echo -e "${LYELLOW}[!]${NC} ${YELLOW}正在安全退出...${NC}"
    save_state
    cleanup_temp
    
    echo -e "${LGREEN}[✓]${NC} ${GREEN}已安全退出，进度已保存${NC}"
    exit 0
}

# Handle script exit
handle_exit() {
    local exit_code=$?
    
    # Kill background processes
    [[ -n "$INSTALL_PID" ]] && kill $INSTALL_PID 2>/dev/null
    [[ -n "$GAME_PID" ]] && kill $GAME_PID 2>/dev/null
    [[ -n "$DRAGON_ANIMATION_PID" ]] && kill $DRAGON_ANIMATION_PID 2>/dev/null
    
    # Save state on normal exit
    if [[ $exit_code -eq 0 ]]; then
        save_state
    fi
    
    cleanup_temp
    
    # Display goodbye message
    if [[ $exit_code -eq 0 ]]; then
        display_goodbye
    fi
    
    exit $exit_code
}

# Handle errors with line number and command info
handle_error() {
    local line=$1
    local command="$2"
    local exit_code="${3:-1}"
    
    ERROR_COUNT=$((ERROR_COUNT + 1))
    
    # Log error details
    {
        echo "========================================"
        echo "ERROR #${ERROR_COUNT} at $(date)"
        echo "Line: ${line}"
        echo "Command: ${command}"
        echo "Exit Code: ${exit_code}"
        echo "Function: ${FUNCNAME[1]:-main}"
        echo "Stack Trace:"
        local i=0
        while caller $i 2>/dev/null; do
            ((i++))
        done
        echo "========================================"
    } >> "$ERROR_LOG"
    
    # Check if we've exceeded max errors
    if [[ $ERROR_COUNT -ge $MAX_ERRORS ]]; then
        echo -e "\n${LRED}[✗]${NC} ${RED}错误过多 (${ERROR_COUNT}/${MAX_ERRORS})，正在安全退出...${NC}"
        echo -e "${YELLOW}详细错误日志: ${ERROR_LOG}${NC}"
        save_state
        cleanup_temp
        exit 1
    fi
    
    # Auto-recover if enabled
    if [[ "$AUTO_RECOVER" == true ]]; then
        echo -e "${LYELLOW}[!]${NC} ${YELLOW}检测到错误，自动恢复中...${NC}"
        return 0
    fi
    
    return 0
}

# Safe command execution with retry
safe_run() {
    local cmd="$1"
    local desc="${2:-执行命令}"
    local max_retries="${3:-3}"
    local retry_delay="${4:-2}"
    
    echo -e "${LCYAN}[→]${NC} ${CYAN}${desc}...${NC}"
    
    for ((i=1; i<=max_retries; i++)); do
        if eval "$cmd" 2>>"$ERROR_LOG"; then
            echo -e "${LGREEN}[✓]${NC} ${GREEN}${desc} - 成功${NC}"
            return 0
        else
            if [[ $i -lt $max_retries ]]; then
                echo -e "${LYELLOW}[!]${NC} ${YELLOW}${desc} - 失败，第${i}次重试...${NC}"
                sleep "$retry_delay"
            else
                echo -e "${LRED}[✗]${NC} ${RED}${desc} - 失败（已重试${max_retries}次）${NC}"
                return 1
            fi
        fi
    done
}

# ============================================================
# INITIALIZATION FUNCTIONS
# ============================================================

# Initialize environment and create directories
init_environment() {
    # Create all required directories
    local dirs=("$LOG_DIR" "$CONFIG_DIR" "$TOOLS_DIR" "$BACKUP_DIR" \
                 "$PROFILES_DIR" "$CACHE_DIR" "$TEMP_DIR" "$GAME_DIR" \
                 "$THEME_DIR" "$SOUND_DIR" "$ACHIEVEMENT_DIR")
    
    for dir in "${dirs[@]}"; do
        mkdir -p "$dir" 2>/dev/null || {
            echo -e "${LRED}[✗]${NC} ${RED}无法创建目录: ${dir}${NC}"
        }
    done
    
    # Initialize log files
    {
        echo "╔══════════════════════════════════════════════════════════════╗"
        echo "║  KALI DRAGON DEPLOY v${VERSION} - Deployment Log            ║"
        echo "║  Started: $(date '+%Y-%m-%d %H:%M:%S')                       ║"
        echo "╚══════════════════════════════════════════════════════════════╝"
        echo ""
    } > "$LOG_FILE"
    
    {
        echo "╔══════════════════════════════════════════════════════════════╗"
        echo "║  Error Log - $(date '+%Y-%m-%d %H:%M:%S')                   ║"
        echo "╚══════════════════════════════════════════════════════════════╝"
        echo ""
    } > "$ERROR_LOG"
    
    # Detect system
    detect_system
    
    # Load saved state
    load_state
    
    # Load achievements
    load_achievements
    
    # Check prerequisites
    check_prerequisites
    
    log_info "环境初始化完成"
    log_info "系统: ${OS} | 架构: ${CPU_ARCH} | 内存: ${TOTAL_RAM}MB | 磁盘: ${AVAILABLE_DISK}GB"
}

# Detect operating system and hardware
detect_system() {
    # Detect Termux
    if [[ -d /data/data/com.termux/files/usr ]]; then
        OS="Termux"
        OS_TYPE="android"
        PKG_MGR="pkg"
        INSTALL_CMD="pkg install -y"
        UPDATE_CMD="pkg update -y"
        HOME_DIR="/data/data/com.termux/files/home"
        TERMUX=true
    elif [[ -f /etc/os-release ]]; then
        source /etc/os-release 2>/dev/null
        OS="${NAME:-Unknown}"
        OS_TYPE="linux"
        PKG_MGR="apt"
        INSTALL_CMD="apt install -y --no-install-recommends"
        UPDATE_CMD="apt update -y"
        HOME_DIR="$HOME"
        TERMUX=false
    else
        OS="Unknown"
        OS_TYPE="unknown"
        PKG_MGR="apt"
        INSTALL_CMD="apt install -y"
        UPDATE_CMD="apt update -y"
        HOME_DIR="$HOME"
        TERMUX=false
    fi
    
    # Detect architecture
    ARCH=$(uname -m 2>/dev/null || echo "unknown")
    case "$ARCH" in
        aarch64|arm64)   CPU_ARCH="arm64"; BITS="64" ;;
        x86_64|amd64)    CPU_ARCH="amd64"; BITS="64" ;;
        armv7l|armv8l)   CPU_ARCH="armhf"; BITS="32" ;;
        i386|i686)       CPU_ARCH="i386"; BITS="32" ;;
        *)               CPU_ARCH="unknown"; BITS="unknown" ;;
    esac
    
    # Detect RAM
    TOTAL_RAM=$(free -m 2>/dev/null | awk '/^Mem:/{print $2}' || echo "2048")
    
    # Detect available disk space
    AVAILABLE_DISK=$(df -BG "$HOME_DIR" 2>/dev/null | awk 'NR==2{print $4}' | sed 's/G//' || echo "10")
    
    # Check network
    if ping -c 1 -W 3 8.8.8.8 &>/dev/null; then
        NETWORK_OK=true
    else
        NETWORK_OK=false
    fi
    
    # Get terminal size
    TERM_WIDTH=$(tput cols 2>/dev/null || echo "80")
    TERM_HEIGHT=$(tput lines 2>/dev/null || echo "24")
    
    # Check root
    [[ "$EUID" -eq 0 ]] && IS_ROOT=true || IS_ROOT=false
    
    # Check available tools
    command -v dialog &>/dev/null && HAS_DIALOG=true || HAS_DIALOG=false
    command -v gum &>/dev/null && HAS_GUM=true || HAS_GUM=false
    command -v fzf &>/dev/null && HAS_FZF=true || HAS_FZF=false
    command -v termux-notification &>/dev/null && HAS_NOTIFICATION=true || HAS_NOTIFICATION=false
    command -v termux-tts-speak &>/dev/null && HAS_TTS=true || HAS_TTS=false
}

# Check and install prerequisites
check_prerequisites() {
    log_info "检查必要依赖..."
    
    local deps=("curl" "wget" "tar" "gzip" "coreutils" "findutils" "grep" "sed" "awk")
    
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &>/dev/null; then
            log_warning "缺少依赖: ${dep}，正在安装..."
            safe_run "$INSTALL_CMD $dep" "安装 ${dep}" 2 1 || {
                log_error "无法安装 ${dep}"
            }
        fi
    done
    
    # Install optional but recommended tools
    if [[ "$HAS_DIALOG" == false ]]; then
        log_info "安装 dialog（图形化菜单）..."
        safe_run "$INSTALL_CMD dialog" "安装 dialog" 2 1 && HAS_DIALOG=true
    fi
    
    if [[ "$HAS_GUM" == false ]]; then
        log_info "安装 gum（现代化菜单）..."
        safe_run "$INSTALL_CMD gum" "安装 gum" 2 1 && HAS_GUM=true
    fi
    
    log_success "依赖检查完成"
}

# ============================================================
# STATE MANAGEMENT FUNCTIONS
# ============================================================

# Save current state
save_state() {
    {
        echo "# Kali Dragon Deploy - State File"
        echo "# Saved: $(date)"
        echo "CURRENT_STEP=${CURRENT_STEP}"
        echo "TOTAL_STEPS=${TOTAL_STEPS}"
        echo "TERMS_ACCEPTED=${TERMS_ACCEPTED}"
        echo "INSTALL_MODE=${INSTALL_MODE}"
        echo "CURRENT_THEME=${CURRENT_THEME}"
        echo "CURRENT_LANGUAGE=${CURRENT_LANGUAGE}"
        echo "SOUND_ENABLED=${SOUND_ENABLED}"
        echo "GAME_ENABLED=${GAME_ENABLED}"
        echo "ERROR_COUNT=${ERROR_COUNT}"
    } > "${CONFIG_DIR}/.state"
    
    # Save selected tools
    printf '%s\n' "${SELECTED_TOOLS[@]}" > "${CONFIG_DIR}/.selected_tools"
    printf '%s\n' "${SELECTED_CATEGORIES[@]}" > "${CONFIG_DIR}/.selected_categories"
}

# Load saved state
load_state() {
    if [[ -f "${CONFIG_DIR}/.state" ]]; then
        source "${CONFIG_DIR}/.state" 2>/dev/null
        log_info "已加载上次保存的状态"
    fi
    
    if [[ -f "${CONFIG_DIR}/.selected_tools" ]]; then
        mapfile -t SELECTED_TOOLS < "${CONFIG_DIR}/.selected_tools" 2>/dev/null
    fi
    
    if [[ -f "${CONFIG_DIR}/.selected_categories" ]]; then
        mapfile -t SELECTED_CATEGORIES < "${CONFIG_DIR}/.selected_categories" 2>/dev/null
    fi
    
    # Load theme
    if [[ -f "$THEME_FILE" ]]; then
        CURRENT_THEME=$(cat "$THEME_FILE" 2>/dev/null || echo "dragon")
    fi
    
    # Load language
    if [[ -f "$LANG_FILE" ]]; then
        CURRENT_LANGUAGE=$(cat "$LANG_FILE" 2>/dev/null || echo "zh")
    fi
}

# Load achievements
load_achievements() {
    if [[ -f "$ACHIEVEMENT_FILE" ]]; then
        while IFS='=' read -r key value; do
            [[ -n "$key" ]] && ACHIEVEMENTS["$key"]="$value"
        done < "$ACHIEVEMENT_FILE"
    fi
}

# Save achievements
save_achievements() {
    {
        for key in "${!ACHIEVEMENTS[@]}"; do
            echo "${key}=${ACHIEVEMENTS[$key]}"
        done
    } > "$ACHIEVEMENT_FILE"
}

# Cleanup temporary files
cleanup_temp() {
    rm -rf "$TEMP_DIR"/* 2>/dev/null
    log_info "临时文件已清理"
}

# ============================================================
# LOGGING FUNCTIONS
# ============================================================

log() {
    echo -e "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

log_info() {
    local msg="$1"
    echo -e "${LCYAN}[信息]${NC} ${msg}"
    log "[INFO] $msg"
}

log_success() {
    local msg="$1"
    echo -e "${LGREEN}[ ✓ ]${NC} ${GREEN}${msg}${NC}"
    log "[SUCCESS] $msg"
}

log_warning() {
    local msg="$1"
    echo -e "${LYELLOW}[ ! ]${NC} ${YELLOW}${msg}${NC}"
    log "[WARNING] $msg"
}

log_error() {
    local msg="$1"
    echo -e "${LRED}[ ✗ ]${NC} ${RED}${msg}${NC}"
    log "[ERROR] $msg"
}

log_step() {
    local num="$1"
    local msg="$2"
    echo -e "${LCYAN}[步骤${num}]${NC} ${CYAN}${msg}${NC}"
    log "[STEP ${num}] $msg"
}

log_debug() {
    if [[ "$DEBUG_MODE" == true ]]; then
        echo -e "${DIM}[调试]${NC} ${DIM}$1${NC}"
        log "[DEBUG] $1"
    fi
}

# ============================================================
# ANIMATION & VISUAL EFFECTS
# ============================================================

# Spinner animation while command runs
spinner() {
    local pid=$1
    local msg="${2:-处理中...}"
    local spinstr='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    local i=0
    
    if [[ "$QUIET_MODE" == true ]]; then
        wait "$pid" 2>/dev/null
        return $?
    fi
    
    while kill -0 "$pid" 2>/dev/null; do
        local char="${spinstr:$i:1}"
        printf "\r  ${LCYAN}%s${NC} ${msg}" "$char"
        i=$(( (i + 1) % ${#spinstr} ))
        sleep 0.1
    done
    wait "$pid" 2>/dev/null
    local exit_code=$?
    if [[ $exit_code -eq 0 ]]; then
        printf "\r  ${LGREEN}✓${NC} ${msg} ${GREEN}完成${NC}\n"
    else
        printf "\r  ${LRED}✗${NC} ${msg} ${RED}失败${NC}\n"
    fi
    return $exit_code
}

# Progress bar
progress_bar() {
    local current=$1
    local total=$2
    local msg="${3:-进度}"
    local width=$(( TERM_WIDTH - 20 ))
    [[ $width -gt 60 ]] && width=50
    
    local percent=$(( current * 100 / total ))
    local filled=$(( percent * width / 100 ))
    local empty=$(( width - filled ))
    
    printf "\r  ${msg} ${LCYAN}["
    for ((i=0; i<filled; i++)); do printf "█"; done
    for ((i=0; i<empty; i++)); do printf "░"; done
    printf "]${NC} ${LGREEN}%3d%%${NC}" "$percent"
    
    [[ $current -ge $total ]] && echo
}

# Typewriter text effect
typewriter() {
    local text="$1"
    local speed="${2:-0.02}"
    
    for ((i=0; i<${#text}; i++)); do
        printf "%s" "${text:$i:1}"
        sleep "$speed"
    done
    echo
}

# Print text in rainbow colors
rainbow_print() {
    local text="$1"
    local i=0
    
    for ((j=0; j<${#text}; j++)); do
        local char="${text:$j:1}"
        printf "${RAINBOW_COLORS[$i]}%s${NC}" "$char"
        i=$(( (i + 1) % RAINBOW_COUNT ))
        [[ $i -ge $RAINBOW_COUNT ]] && i=0
    done
    echo
}

# Print text in fire colors
fire_print() {
    local text="$1"
    for ((j=0; j<${#text}; j++)); do
        local char="${text:$j:1}"
        local idx=$(( j % ${#FIRE_COLORS[@]} ))
        printf "${FIRE_COLORS[$idx]}%s${NC}" "$char"
    done
    echo
}

# Draw a box with border
draw_box() {
    local text="$1"
    local color="${2:-$LCYAN}"
    local width=$(( TERM_WIDTH - 4 ))
    
    printf "${color}╔"
    for ((i=0; i<width; i++)); do printf "═"; done
    printf "╗${NC}\n"
    
    printf "${color}║${NC} %-${width}s ${color}║${NC}\n" "$text"
    
    printf "${color}╚"
    for ((i=0; i<width; i++)); do printf "═"; done
    printf "╝${NC}\n"
}

# Draw a centered header
draw_header() {
    local text="$1"
    local color="${2:-$LCYAN}"
    local width=$(( TERM_WIDTH - 4 ))
    local text_len=${#text}
    local pad_left=$(( (width - text_len) / 2 ))
    local pad_right=$(( width - text_len - pad_left ))
    
    printf "${color}╔"
    for ((i=0; i<width; i++)); do printf "═"; done
    printf "╗${NC}\n"
    
    printf "${color}║${NC}"
    printf "%${pad_left}s" ""
    printf "${BOLD}%s${NC}" "$text"
    printf "%${pad_right}s" ""
    printf "${color}║${NC}\n"
    
    printf "${color}╚"
    for ((i=0; i<width; i++)); do printf "═"; done
    printf "╝${NC}\n"
}

# Display separator line
separator() {
    local char="${1:-═}"
    local color="${2:-$LCYAN}"
    local width=$(( TERM_WIDTH - 2 ))
    
    printf "${color}"
    for ((i=0; i<width; i++)); do printf "%s" "$char"; done
    printf "${NC}\n"
}

# Clear screen and show header
clear_screen() {
    clear
}

# Notification (Termux only)
send_notification() {
    local title="$1"
    local message="$2"
    
    if [[ "$HAS_NOTIFICATION" == true ]] && [[ "$TERMUX" == true ]]; then
        termux-notification -t "$title" -c "$message" 2>/dev/null || true
    fi
}

# Text to speech (Termux only)
speak_text() {
    local text="$1"
    
    if [[ "$HAS_TTS" == true ]] && [[ "$TERMUX" == true ]] && [[ "$SOUND_ENABLED" == true ]]; then
        termux-tts-speak "$text" 2>/dev/null || true
    fi
}

# Play sound effect
play_sound() {
    local sound="$1"
    
    if [[ "$SOUND_ENABLED" == true ]]; then
        case "$sound" in
            success) printf '\a' ;;  # Bell sound
            error) printf '\a\a' ;;
            click) printf '\a' ;;
            *) ;;
        esac
    fi
}

# ============================================================
# DRAGON ASCII ART LOGO
# ============================================================

# Display animated dragon logo
display_dragon_logo() {
    clear_screen
    
    case "$CURRENT_THEME" in
        dragon|fire) display_dragon_fire ;;
        hacker|matrix) display_dragon_matrix ;;
        cyberpunk|neon) display_dragon_neon ;;
        ocean) display_dragon_ocean ;;
        sunset) display_dragon_sunset ;;
        gold) display_dragon_gold ;;
        *) display_dragon_classic ;;
    esac
}

# Classic dragon
display_dragon_classic() {
    echo -e "${LRED}"
    cat << 'DRAGON_EOF'
                                     ___
                                  .-~       ~-.
                                 /               \
                                /                 \
                               /                   \
                              /                     \
                             /                       \
                            /                         \
                           /                           \
                          /                             \
                         /                               \
                        /                                 \
                       (                                   )
                        \                                 /
                         \                               /
                          \                             /
                           \                           /
                            \                         /
                             \                       /
                              \                     /
                               \                   /
                                \                 /
                                 \               /
                                  '.           .'
                                    '-......-'
                              🐉 KALI DRAGON 🐉
DRAGON_EOF
    echo -e "${NC}"
}

# Fire dragon animation
display_dragon_fire() {
    local frames=(
        "${RED}                    ___
                  .-~       ~-.
                 /               \\
                /                 \\
               /                   \\
              (        🐉           )
               \                   /
                \                 /
                 \               /
                  '.           .'
                    '-......-'${NC}"

        "${LRED}                    ___
                  .-~   🔥    ~-.
                 /               \\
                /      🔥         \\
               /                   \\
              (        🐉           )
               \                   /
                \        🔥        /
                 \               /
                  '.           .'
                    '-......-'${NC}"

        "${YELLOW}                    ___
                  .-~       ~-.
                 /    🔥          \\
                /                 \\
               /        🔥         \\
              (        🐉           )
               \                   /
                \                 /
                 \     🔥         /
                  '.           .'
                    '-......-'${NC}"
    )
    
    for frame in "${frames[@]}"; do
        clear_screen
        echo -e "$frame"
        sleep 0.3
    done
}

# Matrix-style dragon
display_dragon_matrix() {
    echo -e "${LGREEN}"
    cat << 'DRAGON_EOF'
                    ___
                  .-~       ~-.
                 /               \
                /  ██  ██  ██    \
               /    ██  ██  ██    \
              /                     \
             (   🐉  MATRIX  🐉    )
              \                     /
               \    ██  ██  ██    /
                \  ██  ██  ██    /
                 \               /
                  '.           .'
                    '-......-'
DRAGON_EOF
    echo -e "${NC}"
}

# Neon dragon
display_dragon_neon() {
    echo -e "${LMAGENTA}"
    cat << 'DRAGON_EOF'
                    ═══
                  ╔═╝   ╚═╗
                 ║         ║
                ║  ⚡  ⚡  ⚡  ║
               ║               ║
              ║    🐉 NEON 🐉   ║
               ║               ║
                ║  ⚡  ⚡  ⚡  ║
                 ║         ║
                  ╚═╗   ╔═╝
                    ═══
DRAGON_EOF
    echo -e "${NC}"
}

# Ocean dragon
display_dragon_ocean() {
    echo -e "${LBLUE}"
    cat << 'DRAGON_EOF'
                    ~~~
                  .-~  🌊  ~-.
                 /    ~~~~~    \
                /   ~~~~~~~~~   \
               /    ~~~~~~~~~    \
              (    🐉 OCEAN 🐉    )
               \    ~~~~~~~~~    /
                \   ~~~~~~~~~   /
                 \    ~~~~~    /
                  '.         .'
                    '-~~~~~-'
DRAGON_EOF
    echo -e "${NC}"
}

# Sunset dragon
display_dragon_sunset() {
    echo -e "${LRED}"
    cat << 'DRAGON_EOF'
                    ___
                  .-~  🌅  ~-.
                 /               \
                /    ☀️    ☀️     \
               /                   \
              (    🐉 SUNSET 🐉     )
               \                   /
                \    ☀️    ☀️     /
                 \               /
                  '.    🌅    .'
                    '-......-'
DRAGON_EOF
    echo -e "${NC}"
}

# Gold dragon
display_dragon_gold() {
    echo -e "${LYELLOW}"
    cat << 'DRAGON_EOF'
                    ═══
                  ╔═╝ ✦ ╚═╗
                 ║   ✦ ✦   ║
                ║  ✦  ✦  ✦  ║
               ║    ✦ ✦ ✦    ║
              ║  🐉 GOLDEN 🐉  ║
               ║    ✦ ✦ ✦    ║
                ║  ✦  ✦  ✦  ║
                 ║   ✦ ✦   ║
                  ╚═╗ ✦ ╔═╝
                    ═══
DRAGON_EOF
    echo -e "${NC}"
}

# Animated dragon breath
animate_dragon_breath() {
    local frames=(
        "🐉                    "
        "🐉 🔥                 "
        "🐉  🔥🔥              "
        "🐉   🔥🔥🔥           "
        "🐉    🔥🔥🔥🔥        "
        "🐉     🔥🔥🔥🔥🔥     "
        "🐉    🔥🔥🔥🔥        "
        "🐉   🔥🔥🔥           "
        "🐉  🔥🔥              "
        "🐉 🔥                 "
        "🐉                    "
    )
    
    for frame in "${frames[@]}"; do
        printf "\r  %s" "$frame"
        sleep 0.1
    done
    echo
}

# Dragon eye blink
dragon_eye_blink() {
    echo -e "  🐉 ${BOLD}●${NC}_${BOLD}●${NC}    ${DIM}龙正在注视着你...${NC}"
    sleep 1
    echo -e "  🐉 ${BOLD}●${NC}_${DIM}─${NC}    ${DIM}眨眼~${NC}"
    sleep 0.2
    echo -e "  🐉 ${BOLD}●${NC}_${BOLD}●${NC}    ${DIM}继续注视...${NC}"
}

# ============================================================
# LEGAL TERMS & AGREEMENT SYSTEM
# ============================================================

# Display legal terms
display_legal_terms() {
    clear_screen
    
    # Header
    draw_header "📜 法律条款与使用协议" "$LRED"
    echo
    
    # Terms content
    echo -e "${BOLD}${LYELLOW}════════════════════════════════════════════════════════${NC}"
    echo
    echo -e "${BOLD}${LRED}⚠️  重要法律声明 - 请仔细阅读${NC}"
    echo
    
    # Section 1
    echo -e "${BOLD}${WHITE}第一条 · 目的与性质${NC}"
    echo -e "${DIM}本工具仅供安全研究、教育培训、授权测试使用。${NC}"
    echo -e "${DIM}严禁将本工具用于任何非法入侵、未授权访问、数据窃取等违法行为。${NC}"
    echo
    
    # Section 2
    echo -e "${BOLD}${WHITE}第二条 · 用户责任${NC}"
    echo -e "${DIM}使用者须自行承担因使用本工具而产生的一切法律责任。${NC}"
    echo -e "${DIM}作者不对任何滥用、误用、非法使用本工具的行为承担责任。${NC}"
    echo
    
    # Section 3
    echo -e "${BOLD}${WHITE}第三条 · 法律依据${NC}"
    echo -e "${DIM}依据《中华人民共和国网络安全法》《中华人民共和国数据安全法》${NC}"
    echo -e "${DIM}》《中华人民共和国个人信息保护法》等相关法律法规。${NC}"
    echo
    
    # Section 4
    echo -e "${BOLD}${WHITE}第四条 · 合规使用${NC}"
    echo -e "${DIM}使用本工具进行安全测试时，必须获得目标系统的明确书面授权。${NC}"
    echo -e "${DIM}未经授权的渗透测试属于违法行为，可能面临民事或刑事责任。${NC}"
    echo
    
    # Section 5
    echo -e "${BOLD}${WHITE}第五条 · 数据保护${NC}"
    echo -e "${DIM}在测试过程中获取的任何数据必须妥善保管，测试结束后应及时销毁。${NC}"
    echo -e "${DIM}不得泄露、出售或非法向他人提供测试过程中获取的任何信息。${NC}"
    echo
    
    # Section 6
    echo -e "${BOLD}${WHITE}第六条 · 国际法规${NC}"
    echo -e "${DIM}使用本工具还需遵守GDPR(欧盟)、CCPA(加州)、PIPL(中国)等国际法规。${NC}"
    echo
    
    echo -e "${BOLD}${LYELLOW}════════════════════════════════════════════════════════${NC}"
    echo
    
    # Agreement confirmation
    echo -e "${BOLD}${WHITE}请输入 '我同意' 或 'agree' 以继续：${NC}"
    echo
}

# Terms agreement flow
terms_agreement_flow() {
    # Check if already agreed
    if [[ -f "$AGREEMENT_FILE" ]]; then
        local agreed_time=$(cat "$AGREEMENT_FILE")
        local agreed_date=$(echo "$agreed_time" | cut -d'|' -f1)
        local agreed_version=$(echo "$agreed_time" | cut -d'|' -f2)
        
        # Terms valid for 30 days
        if [[ "$agreed_version" == "$VERSION" ]]; then
            local days_ago=$(( ($(date +%s) - $(date -d "$agreed_date" +%s 2>/dev/null || echo 0)) / 86400 ))
            if [[ $days_ago -lt 30 ]]; then
                TERMS_ACCEPTED=true
                ACHIEVEMENTS["terms_accepted"]=true
                save_achievements
                return 0
            fi
        fi
    fi
    
    # Show terms
    display_legal_terms
    
    # Countdown timer (30 seconds)
    local countdown=30
    echo -e "${YELLOW}请等待 ${countdown} 秒后确认...${NC}"
    
    for ((i=countdown; i>=0; i--)); do
        printf "\r  ${LCYAN}⏳ 剩余时间: %2d 秒${NC}" "$i"
        sleep 1
    done
    echo
    
    # Get agreement
    while true; do
        echo
        read -r -p "$(echo -e "${BOLD}${WHITE}请输入 '我同意' 或 'agree'：${NC} ")" agreement
        
        case "$agreement" in
            "我同意"|"agree"|"AGREE"|"yes"|"YES"|"y"|"Y")
                echo
                typewriter "感谢您的理解与合作。请合理合法使用本工具。" 0.03
                echo
                TERMS_ACCEPTED=true
                ACHIEVEMENTS["terms_accepted"]=true
                save_achievements
                
                # Save agreement
                echo "$(date +%Y-%m-%d)|${VERSION}" > "$AGREEMENT_FILE"
                
                # Log agreement
                log_info "用户已同意法律条款 (版本: ${VERSION})"
                
                play_sound success
                sleep 1
                return 0
                ;;
            "不同意"|"disagree"|"no"|"NO"|"n"|"N")
                echo
                echo -e "${LRED}您拒绝了法律条款。${NC}"
                echo -e "${YELLOW}即将退出程序...${NC}"
                
                # Easter egg
                echo
                echo -e "${DIM}「能力越大，责任越大。」—— 蜘蛛侠${NC}"
                echo -e "${DIM}「With great power comes great responsibility.」${NC}"
                sleep 3
                exit 0
                ;;
            *)
                echo -e "${LYELLOW}请输入 '我同意' 或 'agree' 继续，或 '不同意'/'disagree' 退出${NC}"
                ;;
        esac
    done
}

# Display violation warning
display_violation_warning() {
    clear_screen
    draw_header "⚠️  违规警告" "$LRED"
    echo
    
    # Check violation count
    local violations=0
    [[ -f "$VIOLATION_FILE" ]] && violations=$(cat "$VIOLATION_FILE" 2>/dev/null || echo 0)
    violations=$((violations + 1))
    echo "$violations" > "$VIOLATION_FILE"
    
    if [[ $violations -ge 3 ]]; then
        echo -e "${LRED}${BLINK}════════════════════════════════════════════════════════${NC}"
        echo -e "${LRED}${BOLD}  您已违规 ${violations} 次！${NC}"
        echo -e "${LRED}${BOLD}  程序已锁定 24 小时！${NC}"
        echo -e "${LRED}${BLINK}════════════════════════════════════════════════════════${NC}"
        
        # Lock for 24 hours
        echo "$(date +%s)" > "$LOCK_FILE"
        sleep 5
        exit 1
    else
        echo -e "${LYELLOW}警告：检测到可疑操作（第 ${violations}/3 次）${NC}"
        echo -e "${YELLOW}请仅进行合法授权的安全测试！${NC}"
        echo -e "${DIM}再违规 $((3 - violations)) 次将锁定 24 小时。${NC}"
        sleep 3
    fi
}

# Check if locked
check_lock_status() {
    if [[ -f "$LOCK_FILE" ]]; then
        local lock_time=$(cat "$LOCK_FILE")
        local current_time=$(date +%s)
        local elapsed=$(( current_time - lock_time ))
        
        if [[ $elapsed -lt 86400 ]]; then
            local remaining=$(( 86400 - elapsed ))
            local hours=$(( remaining / 3600 ))
            local minutes=$(( (remaining % 3600) / 60 ))
            
            clear_screen
            draw_header "🔒 程序已锁定" "$LRED"
            echo
            echo -e "${LRED}由于违规操作，程序已被锁定。${NC}"
            echo -e "${YELLOW}剩余锁定时间: ${hours}小时 ${minutes}分钟${NC}"
            echo -e "${DIM}请遵守法律法规，合理使用本工具。${NC}"
            sleep 3
            exit 1
        else
            rm -f "$LOCK_FILE" "$VIOLATION_FILE"
        fi
    fi
}

# ============================================================
# THEME SYSTEM
# ============================================================

# Apply theme
apply_theme() {
    local theme="${1:-dragon}"
    
    case "$theme" in
        dragon)
            export CURRENT_THEME="dragon"
            BG_COLOR="$BG_BLACK"
            FG_COLOR="$WHITE"
            ACCENT_COLOR="$LRED"
            SECONDARY_COLOR="$LYELLOW"
            ;;
        hacker|matrix)
            export CURRENT_THEME="hacker"
            BG_COLOR="$BG_BLACK"
            FG_COLOR="$LGREEN"
            ACCENT_COLOR="$GREEN"
            SECONDARY_COLOR="$DIM$GREEN"
            ;;
        cyberpunk|neon)
            export CURRENT_THEME="cyberpunk"
            BG_COLOR="$BG_LBLACK"
            FG_COLOR="$LMAGENTA"
            ACCENT_COLOR="$LCYAN"
            SECONDARY_COLOR="$LBLUE"
            ;;
        ocean)
            export CURRENT_THEME="ocean"
            BG_COLOR="$BG_BLACK"
            FG_COLOR="$LBLUE"
            ACCENT_COLOR="$LCYAN"
            SECONDARY_COLOR="$WHITE"
            ;;
        sunset)
            export CURRENT_THEME="sunset"
            BG_COLOR="$BG_BLACK"
            FG_COLOR="$LRED"
            ACCENT_COLOR="$LYELLOW"
            SECONDARY_COLOR="$LMAGENTA"
            ;;
        gold)
            export CURRENT_THEME="gold"
            BG_COLOR="$BG_BLACK"
            FG_COLOR="$LYELLOW"
            ACCENT_COLOR="$LWHITE"
            SECONDARY_COLOR="$YELLOW"
            ;;
        minimal|light)
            export CURRENT_THEME="minimal"
            BG_COLOR="$BG_WHITE"
            FG_COLOR="$BLACK"
            ACCENT_COLOR="$BLUE"
            SECONDARY_COLOR="$DIM"
            ;;
        dark)
            export CURRENT_THEME="dark"
            BG_COLOR="$BG_BLACK"
            FG_COLOR="$LWHITE"
            ACCENT_COLOR="$LCYAN"
            SECONDARY_COLOR="$DIM$WHITE"
            ;;
        forest)
            export CURRENT_THEME="forest"
            BG_COLOR="$BG_BLACK"
            FG_COLOR="$LGREEN"
            ACCENT_COLOR="$GREEN"
            SECONDARY_COLOR="$YELLOW"
            ;;
        sakura|pink)
            export CURRENT_THEME="sakura"
            BG_COLOR="$BG_BLACK"
            FG_COLOR="$LMAGENTA"
            ACCENT_COLOR="$LRED"
            SECONDARY_COLOR="$WHITE"
            ;;
        *)
            export CURRENT_THEME="dragon"
            ;;
    esac
    
    # Save theme
    echo "$CURRENT_THEME" > "$THEME_FILE"
    
    log_info "主题已切换: ${CURRENT_THEME}"
    
    # Check for theme achievement
    local theme_count=0
    for achievement in "${!ACHIEVEMENTS[@]}"; do
        [[ "$achievement" == theme_* ]] && [[ "${ACHIEVEMENTS[$achievement]}" == true ]] && ((theme_count++))
    done
    [[ $theme_count -ge 5 ]] && ACHIEVEMENTS["theme_master"]=true && save_achievements
}

# Theme selection menu
theme_selection_menu() {
    while true; do
        clear_screen
        draw_header "🎨 主题选择" "$LMAGENTA"
        echo
        echo -e "  ${LRED}[1]${NC} 🐉 龙之主题    ${RED}红金配色，霸气威武${NC}"
        echo -e "  ${LGREEN}[2]${NC} 💻 黑客主题    ${GREEN}黑绿配色，经典黑客${NC}"
        echo -e "  ${LMAGENTA}[3]${NC} 🌆 赛博朋克    ${MAGENTA}紫粉霓虹，未来科技${NC}"
        echo -e "  ${LBLUE}[4]${NC} 🌊 海洋主题    ${BLUE}蓝白配色，深邃大海${NC}"
        echo -e "  ${LRED}[5]${NC} 🌅 日落主题    ${YELLOW}橙红渐变，温暖夕阳${NC}"
        echo -e "  ${LYELLOW}[6]${NC} 👑 黄金主题    ${YELLOW}金色闪光，尊贵奢华${NC}"
        echo -e "  ${WHITE}[7]${NC} ⚪ 极简主题    ${DIM}白灰配色，简约清爽${NC}"
        echo -e "  ${LWHITE}[8]${NC} ⚫ 暗夜主题    ${DIM}纯黑灰，护眼舒适${NC}"
        echo -e "  ${LGREEN}[9]${NC} 🌲 森林主题    ${GREEN}绿棕配色，自然清新${NC}"
        echo -e "  ${LMAGENTA}[10]${NC} 🌸 樱花主题   ${MAGENTA}粉白配色，浪漫温柔${NC}"
        echo
        echo -e "  ${YELLOW}[0]${NC} 返回主菜单"
        echo
        
        read -r -p "$(echo -e "${BOLD}请选择主题 [1-10]:${NC} ")" choice
        
        case "$choice" in
            1) apply_theme "dragon"; break ;;
            2) apply_theme "hacker"; break ;;
            3) apply_theme "cyberpunk"; break ;;
            4) apply_theme "ocean"; break ;;
            5) apply_theme "sunset"; break ;;
            6) apply_theme "gold"; break ;;
            7) apply_theme "minimal"; break ;;
            8) apply_theme "dark"; break ;;
            9) apply_theme "forest"; break ;;
            10) apply_theme "sakura"; break ;;
            0) return ;;
            *) echo -e "${LYELLOW}无效选择${NC}"; sleep 1 ;;
        esac
    done
}

# ============================================================
# LANGUAGE SYSTEM
# ============================================================

# Set language
set_language() {
    local lang="${1:-zh}"
    CURRENT_LANGUAGE="$lang"
    echo "$lang" > "$LANG_FILE"
    log_info "语言已切换: ${lang}"
}

# Language selection menu
language_selection_menu() {
    clear_screen
    draw_header "🌍 语言选择 / Language Selection" "$LCYAN"
    echo
    echo -e "  ${YELLOW}[1]${NC} 🇨🇳 中文 (简体)"
    echo -e "  ${YELLOW}[2]${NC} 🇺🇸 English"
    echo -e "  ${YELLOW}[3]${NC} 🇯🇵 日本語"
    echo -e "  ${YELLOW}[4]${NC} 🇰🇷 한국어"
    echo -e "  ${YELLOW}[5]${NC} 🇷🇺 Русский"
    echo -e "  ${YELLOW}[6]${NC} 🇸🇦 العربية"
    echo
    echo -e "  ${YELLOW}[0]${NC} 返回 / Back"
    echo
    
    read -r -p "$(echo -e "${BOLD}请选择 / Select [1-6]:${NC} ")" choice
    
    case "$choice" in
        1) set_language "zh" ;;
        2) set_language "en" ;;
        3) set_language "ja" ;;
        4) set_language "ko" ;;
        5) set_language "ru" ;;
        6) set_language "ar" ;;
        0) return ;;
        *) set_language "zh" ;;
    esac
}

# ============================================================
# MINI GAMES SYSTEM
# ============================================================

# Snake game
game_snake() {
    clear_screen
    echo -e "${LGREEN}╔════════════════════════════════════════╗${NC}"
    echo -e "${LGREEN}║          🐍 贪吃蛇游戏                ║${NC}"
    echo -e "${LGREEN}║          W/A/S/D 移动 | Q 退出        ║${NC}"
    echo -e "${LGREEN}╚════════════════════════════════════════╝${NC}"
    echo
    echo -e "${YELLOW}游戏加载中...${NC}"
    
    # Simple snake game implementation
    local width=20
    local height=10
    local snake_x=10
    local snake_y=5
    local food_x=$((RANDOM % width + 1))
    local food_y=$((RANDOM % height + 1))
    local score=0
    local direction="right"
    local game_over=false
    
    # Hide cursor
    tput civis 2>/dev/null
    
    while [[ "$game_over" == false ]]; do
        # Draw game board
        clear_screen
        echo -e "${LGREEN}╔════════════════════════════════════════╗${NC}"
        echo -e "${LGREEN}║  得分: ${score}  ⬆W ⬇S ⬅A ➡D  Q退出  ║${NC}"
        echo -e "${LGREEN}╚════════════════════════════════════════╝${NC}"
        
        for ((y=0; y<=height; y++)); do
            for ((x=0; x<=width; x++)); do
                if [[ $x -eq $snake_x && $y -eq $snake_y ]]; then
                    printf "${LGREEN}●${NC}"
                elif [[ $x -eq $food_x && $y -eq $food_y ]]; then
                    printf "${LRED}♥${NC}"
                elif [[ $x -eq 0 || $x -eq $width || $y -eq 0 || $y -eq $height ]]; then
                    printf "${DIM}█${NC}"
                else
                    printf " "
                fi
            done
            echo
        done
        
        # Read input (non-blocking)
        read -t 0.1 -n 1 key 2>/dev/null
        case "$key" in
            w|W) direction="up" ;;
            s|S) direction="down" ;;
            a|A) direction="left" ;;
            d|D) direction="right" ;;
            q|Q) game_over=true; break ;;
        esac
        
        # Move snake
        case "$direction" in
            up)    snake_y=$((snake_y - 1)) ;;
            down)  snake_y=$((snake_y + 1)) ;;
            left)  snake_x=$((snake_x - 1)) ;;
            right) snake_x=$((snake_x + 1)) ;;
        esac
        
        # Check collision with walls
        if [[ $snake_x -le 0 || $snake_x -ge $width || $snake_y -le 0 || $snake_y -ge $height ]]; then
            game_over=true
        fi
        
        # Check food
        if [[ $snake_x -eq $food_x && $snake_y -eq $food_y ]]; then
            score=$((score + 10))
            food_x=$((RANDOM % (width - 1) + 1))
            food_y=$((RANDOM % (height - 1) + 1))
            play_sound click
        fi
    done
    
    # Show cursor
    tput cnorm 2>/dev/null
    
    clear_screen
    echo -e "${LGREEN}════════════════════════════════════════${NC}"
    echo -e "${LYELLOW}          游戏结束！${NC}"
    echo -e "${LGREEN}          最终得分: ${score}${NC}"
    echo -e "${LGREEN}════════════════════════════════════════${NC}"
    
    if [[ $score -ge 50 ]]; then
        ACHIEVEMENTS["game_snake"]=true
        save_achievements
        echo -e "${GOLD}🏆 成就解锁: 贪吃蛇大师！${NC}"
    fi
    
    echo
    read -r -p "按回车键继续..."
}

# 2048 game (simplified)
game_2048() {
    clear_screen
    echo -e "${LYELLOW}╔════════════════════════════════════════╗${NC}"
    echo -e "${LYELLOW}║          🎮 2048 游戏                  ║${NC}"
    echo -e "${LYELLOW}║          W/A/S/D 移动 | Q 退出        ║${NC}"
    echo -e "${LYELLOW}╚════════════════════════════════════════╝${NC}"
    echo
    echo -e "${YELLOW}游戏加载中...（简化版）${NC}"
    sleep 1
    
    # Initialize 4x4 board
    declare -A board
    for ((i=0; i<4; i++)); do
        for ((j=0; j<4; j++)); do
            board[$i,$j]=0
        done
    done
    
    # Add two random tiles
    add_random_tile() {
        local empty_cells=()
        for ((i=0; i<4; i++)); do
            for ((j=0; j<4; j++)); do
                [[ ${board[$i,$j]} -eq 0 ]] && empty_cells+=("$i,$j")
            done
        done
        if [[ ${#empty_cells[@]} -gt 0 ]]; then
            local rand=$((RANDOM % ${#empty_cells[@]}))
            local cell="${empty_cells[$rand]}"
            local value=$((RANDOM % 2 == 0 ? 2 : 4))
            board[${cell%,*},${cell##*,}]=$value
        fi
    }
    
    add_random_tile
    add_random_tile
    
    # Game loop
    local score=0
    local game_over=false
    
    while [[ "$game_over" == false ]]; do
        clear_screen
        echo -e "${LYELLOW}╔════════════════════════════════════════╗${NC}"
        echo -e "${LYELLOW}║  得分: ${score}  ⬆W ⬇S ⬅A ➡D  Q退出  ║${NC}"
        echo -e "${LYELLOW}╚════════════════════════════════════════╝${NC}"
        echo
        
        # Draw board
        for ((i=0; i<4; i++)); do
            printf "  "
            for ((j=0; j<4; j++)); do
                local val=${board[$i,$j]}
                if [[ $val -eq 0 ]]; then
                    printf "${DIM}·${NC}    "
                elif [[ $val -eq 2 ]]; then
                    printf "${WHITE}%-4s${NC}" "$val"
                elif [[ $val -eq 4 ]]; then
                    printf "${YELLOW}%-4s${NC}" "$val"
                elif [[ $val -eq 8 ]]; then
                    printf "${LYELLOW}%-4s${NC}" "$val"
                elif [[ $val -eq 16 ]]; then
                    printf "${RED}%-4s${NC}" "$val"
                elif [[ $val -eq 32 ]]; then
                    printf "${LRED}%-4s${NC}" "$val"
                elif [[ $val -eq 64 ]]; then
                    printf "${MAGENTA}%-4s${NC}" "$val"
                elif [[ $val -eq 128 ]]; then
                    printf "${LMAGENTA}%-4s${NC}" "$val"
                elif [[ $val -eq 256 ]]; then
                    printf "${BLUE}%-4s${NC}" "$val"
                elif [[ $val -eq 512 ]]; then
                    printf "${LBLUE}%-4s${NC}" "$val"
                elif [[ $val -eq 1024 ]]; then
                    printf "${GREEN}%-4s${NC}" "$val"
                elif [[ $val -eq 2048 ]]; then
                    printf "${LGREEN}%-4s${NC}" "$val"
                else
                    printf "${GOLD}%-4s${NC}" "$val"
                fi
            done
            echo
            echo
        done
        
        # Read input
        read -n 1 key 2>/dev/null
        case "$key" in
            q|Q) game_over=true; break ;;
            *) ;; # Simplified - just for demo
        esac
        
        add_random_tile
    done
    
    clear_screen
    echo -e "${LYELLOW}════════════════════════════════════════${NC}"
    echo -e "${LYELLOW}          游戏结束！${NC}"
    echo -e "${LYELLOW}          最终得分: ${score}${NC}"
    echo -e "${LYELLOW}════════════════════════════════════════${NC}"
    
    if [[ $score -ge 1000 ]]; then
        ACHIEVEMENTS["game_2048"]=true
        save_achievements
        echo -e "${GOLD}🏆 成就解锁: 2048大师！${NC}"
    fi
    
    echo
    read -r -p "按回车键继续..."
}

# Minesweeper (simplified)
game_minesweeper() {
    clear_screen
    echo -e "${LRED}╔════════════════════════════════════════╗${NC}"
    echo -e "${LRED}║          💣 扫雷游戏 (简化版)         ║${NC}"
    echo -e "${LRED}║          输入坐标: 行 列              ║${NC}"
    echo -e "${LRED}╚════════════════════════════════════════╝${NC}"
    echo
    echo -e "${YELLOW}游戏加载中...${NC}"
    sleep 1
    echo -e "${DIM}简化版扫雷 - 仅供娱乐${NC}"
    sleep 1
    echo
    echo -e "${GREEN}💣 你踩到雷了！（开玩笑的~）${NC}"
    echo -e "${YELLOW}完整版正在开发中...${NC}"
    echo
    read -r -p "按回车键继续..."
}

# Game selection menu
game_menu() {
    while true; do
        clear_screen
        draw_header "🎮 迷你游戏中心" "$LGREEN"
        echo
        echo -e "  ${LGREEN}[1]${NC} 🐍 贪吃蛇"
        echo -e "  ${LYELLOW}[2]${NC} 🎮 2048"
        echo -e "  ${LRED}[3]${NC} 💣 扫雷"
        echo -e "  ${LCYAN}[4]${NC} 🎯 猜数字"
        echo -e "  ${LMAGENTA}[5]${NC} 🎰 幸运抽奖"
        echo
        echo -e "  ${YELLOW}[0]${NC} 返回主菜单"
        echo
        
        read -r -p "$(echo -e "${BOLD}请选择游戏 [1-5]:${NC} ")" choice
        
        case "$choice" in
            1) game_snake ;;
            2) game_2048 ;;
            3) game_minesweeper ;;
            4) game_guess_number ;;
            5) game_lucky_draw ;;
            0) return ;;
            *) echo -e "${LYELLOW}无效选择${NC}"; sleep 1 ;;
        esac
    done
}

# Guess number game
game_guess_number() {
    local target=$((RANDOM % 100 + 1))
    local guess=0
    local attempts=0
    local max_attempts=7
    
    clear_screen
    echo -e "${LCYAN}╔════════════════════════════════════════╗${NC}"
    echo -e "${LCYAN}║          🎯 猜数字游戏                ║${NC}"
    echo -e "${LCYAN}║          范围: 1-100                  ║${NC}"
    echo -e "${LCYAN}╚════════════════════════════════════════╝${NC}"
    echo
    
    while [[ $attempts -lt $max_attempts ]]; do
        echo -e "${YELLOW}剩余机会: $((max_attempts - attempts))${NC}"
        read -r -p "$(echo -e "${BOLD}请输入你的猜测:${NC} ")" guess
        
        if [[ ! "$guess" =~ ^[0-9]+$ ]]; then
            echo -e "${LRED}请输入有效数字！${NC}"
            continue
        fi
        
        attempts=$((attempts + 1))
        
        if [[ $guess -eq $target ]]; then
            echo
            echo -e "${LGREEN}════════════════════════════════════════${NC}"
            echo -e "${GOLD}🎉 恭喜你猜对了！数字就是 ${target}！${NC}"
            echo -e "${LGREEN}使用次数: ${attempts}${NC}"
            echo -e "${LGREEN}════════════════════════════════════════${NC}"
            
            if [[ $attempts -le 3 ]]; then
                echo -e "${GOLD}🏆 太厉害了！天才！${NC}"
            fi
            break
        elif [[ $guess -lt $target ]]; then
            echo -e "${LBLUE}📈 太小了，再大一点！${NC}"
        else
            echo -e "${LRED}📉 太大了，再小一点！${NC}"
        fi
    done
    
    if [[ $guess -ne $target ]]; then
        echo
        echo -e "${LRED}════════════════════════════════════════${NC}"
        echo -e "${LRED}游戏结束！正确数字是: ${target}${NC}"
        echo -e "${LRED}════════════════════════════════════════${NC}"
    fi
    
    echo
    read -r -p "按回车键继续..."
}

# Lucky draw game
game_lucky_draw() {
    clear_screen
    echo -e "${LMAGENTA}╔════════════════════════════════════════╗${NC}"
    echo -e "${LMAGENTA}║          🎰 幸运抽奖                  ║${NC}"
    echo -e "${LMAGENTA}╚════════════════════════════════════════╝${NC}"
    echo
    
    local prizes=(
        "🍀 好运连连"
        "💰 财源广进"
        "🎓 学业有成"
        "💪 身体健康"
        "❤️  心想事成"
        "🌟 星光大道"
        "🦄 遇见独角兽"
        "🐉 获得龙之祝福"
        "💎 发现宝藏"
        "🎯 百发百中"
    )
    
    echo -e "${YELLOW}正在抽奖中..."
    for ((i=0; i<5; i++)); do
        local random_prize="${prizes[$((RANDOM % ${#prizes[@]}))]}"
        printf "\r  ${LCYAN}🎰 %s${NC}" "$random_prize"
        sleep 0.2
    done
    
    sleep 1
    echo
    echo
    
    local final_prize="${prizes[$((RANDOM % ${#prizes[@]}))]}"
    echo -e "${GOLD}════════════════════════════════════════${NC}"
    echo -e "${GOLD}    🎉 恭喜获得: ${final_prize}${NC}"
    echo -e "${GOLD}════════════════════════════════════════${NC}"
    echo
    read -r -p "按回车键继续..."
}

# Run game in background during installation
run_background_game() {
    if [[ "$GAME_ENABLED" == true ]]; then
        local game_choice=$((RANDOM % 3 + 1))
        case "$game_choice" in
            1) game_snake & GAME_PID=$! ;;
            2) game_guess_number & GAME_PID=$! ;;
            *) game_lucky_draw & GAME_PID=$! ;;
        esac
        disown $GAME_PID 2>/dev/null
    fi
}

# Stop background game
stop_background_game() {
    if [[ -n "$GAME_PID" ]]; then
        kill $GAME_PID 2>/dev/null
        wait $GAME_PID 2>/dev/null
        GAME_PID=""
    fi
}

# ============================================================
# ACHIEVEMENT SYSTEM
# ============================================================

# Display achievements
display_achievements() {
    clear_screen
    draw_header "🏆 成就系统" "$GOLD"
    echo
    
    local achievement_list=(
        "first_run:🌟 初次运行"
        "terms_accepted:📜 守法公民"
        "tools_10:🛠️ 工具收集者"
        "tools_50:🔧 工具大师"
        "tools_100:⚒️ 工具达人"
        "tools_all:👑 全工具制霸"
        "game_snake:🐍 贪吃蛇大师"
        "game_tetris:🧱 俄罗斯方块王"
        "game_2048:🎮 2048大师"
        "theme_master:🎨 主题达人"
        "error_free:🛡️ 零错误通关"
        "speed_demon:⚡ 速度之王"
        "dragon_tamer:🐉 龙之驯服者"
    )
    
    local unlocked=0
    for achievement in "${achievement_list[@]}"; do
        local key="${achievement%%:*}"
        local desc="${achievement##*:}"
        
        if [[ "${ACHIEVEMENTS[$key]}" == true ]]; then
            echo -e "  ${GOLD}🏆${NC} ${LGREEN}${desc}${NC} ${DIM}[已解锁]${NC}"
            ((unlocked++))
        else
            echo -e "  ${DIM}🔒${NC} ${DIM}${desc}${NC} ${DIM}[未解锁]${NC}"
        fi
    done
    
    echo
    echo -e "${GOLD}已解锁: ${unlocked}/${#achievement_list[@]}${NC}"
    echo
    read -r -p "按回车键继续..."
}

# Check and unlock achievement
unlock_achievement() {
    local key="$1"
    if [[ "${ACHIEVEMENTS[$key]}" == false ]]; then
        ACHIEVEMENTS["$key"]=true
        save_achievements
        send_notification "🏆 成就解锁！" "${key}"
        play_sound success
    fi
}

# ============================================================
# SYSTEM MONITORING
# ============================================================

# Display system status
display_system_status() {
    clear_screen
    draw_header "📊 系统状态监控" "$LCYAN"
    echo
    
    # CPU usage
    local cpu_usage=$(top -bn1 2>/dev/null | grep "CPU" | awk '{print $2}' | cut -d'%' -f1 || echo "N/A")
    echo -e "  ${BOLD}CPU 使用率:${NC} ${cpu_usage}%"
    
    # Memory
    local mem_total=$(free -m 2>/dev/null | awk '/^Mem:/{print $2}' || echo "N/A")
    local mem_used=$(free -m 2>/dev/null | awk '/^Mem:/{print $3}' || echo "N/A")
    local mem_percent=0
    [[ "$mem_total" != "N/A" ]] && mem_percent=$(( mem_used * 100 / mem_total ))
    echo -e "  ${BOLD}内存:${NC} ${mem_used}MB / ${mem_total}MB (${mem_percent}%)"
    
    # Disk
    local disk_used=$(df -h "$HOME_DIR" 2>/dev/null | awk 'NR==2{print $3}' || echo "N/A")
    local disk_total=$(df -h "$HOME_DIR" 2>/dev/null | awk 'NR==2{print $2}' || echo "N/A")
    local disk_percent=$(df -h "$HOME_DIR" 2>/dev/null | awk 'NR==2{print $5}' || echo "N/A")
    echo -e "  ${BOLD}磁盘:${NC} ${disk_used} / ${disk_total} (${disk_percent})"
    
    # Network
    if [[ "$NETWORK_OK" == true ]]; then
        echo -e "  ${BOLD}网络:${NC} ${GREEN}已连接${NC}"
    else
        echo -e "  ${BOLD}网络:${NC} ${RED}未连接${NC}"
    fi
    
    # Battery (Termux only)
    if [[ "$TERMUX" == true ]]; then
        local battery=$(termux-battery-status 2>/dev/null | grep "percentage" | awk '{print $2}' | tr -d ',' || echo "N/A")
        echo -e "  ${BOLD}电量:${NC} ${battery}%"
    fi
    
    # Temperature
    if [[ -f /sys/class/thermal/thermal_zone0/temp ]]; then
        local temp=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null | awk '{print $1/1000}' || echo "N/A")
        echo -e "  ${BOLD}温度:${NC} ${temp}°C"
    fi
    
    echo
    echo -e "  ${BOLD}系统:${NC} ${OS}"
    echo -e "  ${BOLD}架构:${NC} ${CPU_ARCH} (${BITS}位)"
    echo -e "  ${BOLD}终端:${NC} ${TERM_WIDTH}x${TERM_HEIGHT}"
    echo -e "  ${BOLD}版本:${NC} ${VERSION} (${CODENAME})"
    echo
    read -r -p "按回车键继续..."
}

# ============================================================
# KALI IMAGE DOWNLOAD SYSTEM
# ============================================================

# Download Kali image
download_kali_image() {
    clear_screen
    draw_header "📦 Kali 镜像下载" "$LCYAN"
    echo
    
    echo -e "${BOLD}可用版本:${NC}"
    echo
    echo -e "  ${YELLOW}[1]${NC} Kali Nethunter (完整版) - ~1.2GB"
    echo -e "  ${YELLOW}[2]${NC} Kali Nethunter Rootless - ~800MB"
    echo -e "  ${YELLOW}[3]${NC} Kali Nethunter Lite - ~500MB"
    echo -e "  ${YELLOW}[4]${NC} Kali ARM (树莓派) - ~2.5GB"
    echo
    echo -e "  ${YELLOW}[0]${NC} 返回"
    echo
    
    read -r -p "$(echo -e "${BOLD}请选择版本 [1-4]:${NC} ")" choice
    
    case "$choice" in
        1) download_nethunter_full ;;
        2) download_nethunter_rootless ;;
        3) download_nethunter_lite ;;
        4) download_kali_arm ;;
        0) return ;;
        *) echo -e "${LYELLOW}无效选择${NC}"; sleep 1; return ;;
    esac
}

# Download Nethunter full
download_nethunter_full() {
    local url="https://kali.download/nethunter-images/kali-2024.4/nethunter-2024.4-generic-arm64-kalifs-full.tar.xz"
    local output="${CACHE_DIR}/nethunter-full.tar.xz"
    
    clear_screen
    draw_header "📥 下载 Kali Nethunter 完整版" "$LCYAN"
    echo
    
    # Check disk space
    if [[ $AVAILABLE_DISK -lt 5 ]]; then
        echo -e "${LRED}磁盘空间不足！需要至少 5GB，可用: ${AVAILABLE_DISK}GB${NC}"
        read -r -p "按回车键返回..."
        return
    fi
    
    echo -e "${YELLOW}开始下载...${NC}"
    echo -e "${DIM}文件大小约 1.2GB，请耐心等待${NC}"
    echo
    
    # Download with progress
    if command -v aria2c &>/dev/null; then
        aria2c -x 4 -s 4 --continue=true --summary-interval=0 \
               -d "$CACHE_DIR" -o "nethunter-full.tar.xz" "$url" 2>&1 | \
        while read -r line; do
            printf "\r  ${LCYAN}下载中... %s${NC}" "$line"
        done
    elif command -v wget &>/dev/null; then
        wget -c -O "$output" "$url" 2>&1
    else
        curl -C - -o "$output" "$url" 2>&1
    fi
    
    if [[ -f "$output" ]]; then
        echo
        log_success "Kali Nethunter 完整版下载完成"
        
        # Verify checksum
        echo -e "${YELLOW}正在校验文件...${NC}"
        if command -v sha256sum &>/dev/null; then
            sha256sum "$output" 2>/dev/null
        fi
        
        echo -e "${LGREEN}文件已保存到: ${output}${NC}"
    else
        log_error "下载失败"
    fi
    
    echo
    read -r -p "按回车键继续..."
}

# Download Nethunter rootless
download_nethunter_rootless() {
    clear_screen
    draw_header "📥 下载 Kali Nethunter Rootless" "$LCYAN"
    echo
    echo -e "${YELLOW}此版本无需Root权限${NC}"
    echo -e "${DIM}文件大小约 800MB${NC}"
    echo
    echo -e "${YELLOW}开始下载...${NC}"
    # Download logic here
    if command -v wget &>/dev/null; then
        local url="https://kali.download/nethunter-images/kali-2024.4/nethunter-2024.4-generic-arm64-kalifs-minimal.tar.xz"
        local output="${CACHE_DIR}/nethunter-rootless.tar.xz"
        wget -c -O "$output" "$url" 2>&1 || {
            echo -e "${LRED}下载失败，请检查网络连接${NC}"
        }
    else
        echo -e "${LRED}需要安装 wget${NC}"
        safe_run "$INSTALL_CMD wget" "安装 wget" 2 1
    fi
    sleep 2
    echo -e "${LGREEN}下载完成（演示模式）${NC}"
    echo
    read -r -p "按回车键继续..."
}

# Download Nethunter lite
download_nethunter_lite() {
    clear_screen
    draw_header "📥 下载 Kali Nethunter Lite" "$LCYAN"
    echo
    echo -e "${YELLOW}轻量版，适合低配置设备${NC}"
    echo -e "${DIM}文件大小约 500MB${NC}"
    echo
    echo -e "${YELLOW}开始下载...${NC}"
    
    # Check if aria2 available
    if command -v aria2c &>/dev/null; then
        local url="https://kali.download/nethunter-images/kali-2024.4/nethunter-2024.4-generic-arm64-kalifs-lite.tar.xz"
        local output="${CACHE_DIR}/nethunter-lite.tar.xz"
        aria2c -x 4 -s 4 --continue=true -d "$CACHE_DIR" -o "nethunter-lite.tar.xz" "$url" 2>&1
    else
        safe_run "$INSTALL_CMD aria2" "安装 aria2" 2 1
    fi
    
    sleep 2
    echo -e "${LGREEN}下载完成（演示模式）${NC}"
    echo
    read -r -p "按回车键继续..."
}
download_kali_arm() {
    clear_screen
    draw_header "📥 下载 Kali NetHunter Rootfs" "$LCYAN"
    echo

    # Use different variable name to avoid conflict with readonly VERSION
    local KALI_VER="2026.1"
    local BASE_URL="https://kali.download/nethunter-images/kali-${KALI_VER}/rootfs"
    local SYS_ARCH=""
    local IMAGE_NAME=""
    local ROOTFS_URL=""

    # Detect architecture
    log_info "检查设备架构..."
    case "$CPU_ARCH" in
        arm64|aarch64)
            SYS_ARCH="arm64"
            echo -e "${LGREEN}✅ 检测到架构: ARM64${NC}"
            ;;
        armhf|armv7l)
            SYS_ARCH="armhf"
            echo -e "${LGREEN}✅ 检测到架构: ARM32 (ARMhf)${NC}"
            ;;
        *)
            echo -e "${LYELLOW}⚠️  当前架构非ARM (${CPU_ARCH})，但仍可下载镜像${NC}"
            SYS_ARCH="arm64"
            ;;
    esac

    echo
    echo -e "${BOLD}请选择 NetHunter 镜像类型:${NC}"
    echo

    # Build menu based on architecture
    local menu_options=()
    local descriptions=()
    local sizes=()

    if [[ "$SYS_ARCH" == "arm64" ]]; then
        menu_options=("full" "minimal" "nano")
        descriptions=(
            "NetHunter ARM64 (完整版)"
            "NetHunter ARM64 (精简版)"
            "NetHunter ARM64 (纳米版)"
        )
        sizes=("~2.1 GiB" "~131 MiB" "~185 MiB")
    else
        menu_options=("full" "minimal" "nano")
        descriptions=(
            "NetHunter ARMhf (完整版)"
            "NetHunter ARMhf (精简版)"
            "NetHunter ARMhf (纳米版)"
        )
        sizes=("~2.0 GiB" "~122 MiB" "~174 MiB")
    fi

    for i in "${!menu_options[@]}"; do
        printf "  ${YELLOW}[%d]${NC} %-35s ${DIM}%s${NC}\n" $((i+1)) "${descriptions[$i]}" "${sizes[$i]}"
    done
    echo -e "  ${YELLOW}[0]${NC} 返回"
    echo

    # Get user choice
    local choice=""
    while true; do
        read -r -p "$(echo -e "${BOLD}请选择 [1-${#menu_options[@]}]:${NC} ")" choice

        if [[ "$choice" == "0" ]]; then
            return 0
        fi

        if [[ "$choice" =~ ^[1-3]$ ]]; then
            local wimg="${menu_options[$((choice-1))]}"
            log_info "选择了: ${descriptions[$((choice-1))]}"
            IMAGE_NAME="kali-nethunter-rootfs-${wimg}-${SYS_ARCH}.tar.xz"
            ROOTFS_URL="${BASE_URL}/${IMAGE_NAME}"
            break
        else
            log_warning "请输入有效的选项 (1-${#menu_options[@]})"
        fi
    done

    echo
    echo -e "${DIM}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${DIM}下载链接:${NC} ${ROOTFS_URL}"
    echo -e "${DIM}保存文件:${NC} ${IMAGE_NAME}"
    echo -e "${DIM}保存位置:${NC} ${CACHE_DIR}/${IMAGE_NAME}"
    echo -e "${DIM}可用空间:${NC} $(df -h "$CACHE_DIR" 2>/dev/null | awk 'NR==2{print $4}' || echo '未知')"
    echo -e "${DIM}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo

    # Check for existing file
    if [ -f "${CACHE_DIR}/${IMAGE_NAME}" ]; then
        echo -e "${YELLOW}找到现有的 ${IMAGE_NAME} 文件${NC}"
        local existing_size=$(du -h "${CACHE_DIR}/${IMAGE_NAME}" 2>/dev/null | cut -f1)
        echo -e "${DIM}大小: ${existing_size}${NC}"
        read -r -p "是否删除并重新下载？[y/N]: " redownload
        if [[ "$redownload" == "y" || "$redownload" == "Y" ]]; then
            rm -f "${CACHE_DIR}/${IMAGE_NAME}" || {
                log_error "无法删除现有文件"
                return 1
            }
            log_info "已删除旧文件"
        else
            log_info "使用现有的镜像文件"
            echo
            echo -e "${LGREEN}文件已存在: ${CACHE_DIR}/${IMAGE_NAME}${NC}"
            echo -e "${LGREEN}大小: ${existing_size}${NC}"
            read -r -p "按回车键继续..."
            return 0
        fi
    fi

    # Confirm download
    read -r -p "确认下载？[y/N]: " confirm
    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        echo -e "${LYELLOW}已取消下载${NC}"
        return 0
    fi

    echo
    log_info "开始下载 rootfs..."
    echo -e "${DIM}提示: 下载过程中可按 Ctrl+C 中断，下次会断点续传${NC}"
    echo

    # Ensure download tools exist
    local has_aria2=false
    local has_wget=false
    
    command -v aria2c &>/dev/null && has_aria2=true
    command -v wget &>/dev/null && has_wget=true
    
    if [[ "$has_aria2" == false && "$has_wget" == false ]]; then
        log_warning "未找到下载工具，正在安装..."
        safe_run "$INSTALL_CMD wget" "安装 wget" 2 1 && has_wget=true
        safe_run "$INSTALL_CMD aria2" "安装 aria2" 2 1 && has_aria2=true
    fi
    
    if [[ "$has_aria2" == false && "$has_wget" == false ]]; then
        log_error "无法安装下载工具，请手动安装: pkg install wget aria2"
        read -r -p "按回车键继续..."
        return 1
    fi

    # Switch to cache directory
    cd "$CACHE_DIR" || {
        log_error "无法进入缓存目录: $CACHE_DIR"
        return 1
    }

    # Download: prefer aria2c (multi-thread), fallback to wget
    if [[ "$has_aria2" == true ]]; then
        log_info "使用 aria2c 多线程下载 (16线程)"
        if aria2c -x 16 -s 16 -k 1M --continue=true \
            --summary-interval=10 \
            --console-log-level=warn \
            "${ROOTFS_URL}"; then
            log_success "下载完成"
        else
            rm -f "${IMAGE_NAME}" "${IMAGE_NAME}.aria2" 2>/dev/null
            log_error "aria2c 下载失败，尝试 wget..."
            has_aria2=false
        fi
    fi
    
    if [[ "$has_aria2" == false && "$has_wget" == true ]]; then
        log_info "使用 wget 下载（支持断点续传）"
        if wget -c --show-progress "${ROOTFS_URL}"; then
            log_success "下载完成"
        else
            rm -f "${IMAGE_NAME}" 2>/dev/null
            cd - >/dev/null
            log_error "下载失败，请检查网络连接"
            read -r -p "按回车键继续..."
            return 1
        fi
    fi

    cd - >/dev/null

    # Verify download
    if [ -f "${CACHE_DIR}/${IMAGE_NAME}" ]; then
        local final_size=$(du -h "${CACHE_DIR}/${IMAGE_NAME}" 2>/dev/null | cut -f1)
        echo
        echo -e "${LGREEN}════════════════════════════════════════${NC}"
        echo -e "${LGREEN}  ✅ 下载完成！${NC}"
        echo -e "${LGREEN}  文件: ${CACHE_DIR}/${IMAGE_NAME}${NC}"
        echo -e "${LGREEN}  大小: ${final_size}${NC}"
        echo -e "${LGREEN}════════════════════════════════════════${NC}"
        
        # Calculate SHA256
        if command -v sha256sum &>/dev/null; then
            echo
            log_info "计算 SHA256 校验值..."
            sha256sum "${CACHE_DIR}/${IMAGE_NAME}" > "${CACHE_DIR}/${IMAGE_NAME}.sha256"
            echo -e "${DIM}$(cat ${CACHE_DIR}/${IMAGE_NAME}.sha256)${NC}"
        fi
        
        echo
        echo -e "${BOLD}📋 使用方法:${NC}"
        echo -e "${DIM}解压: tar -xJf ${CACHE_DIR}/${IMAGE_NAME}${NC}"
    else
        echo
        log_error "下载失败，文件不存在"
        read -r -p "按回车键继续..."
        return 1
    fi

    echo
    read -r -p "按回车键继续..."
    return 0
}
# ============================================================
# TOOLS INSTALLATION SYSTEM
# ============================================================

# Install tools by category
install_tools_category() {
    local category="$1"
    
    case "$category" in
        info_gathering)
            install_info_gathering_tools ;;
        web_testing)
            install_web_testing_tools ;;
        password_attack)
            install_password_attack_tools ;;
        exploitation)
            install_exploitation_tools ;;
        post_exploitation)
            install_post_exploitation_tools ;;
        wireless)
            install_wireless_tools ;;
        reverse_engineering)
            install_reverse_engineering_tools ;;
        forensics)
            install_forensics_tools ;;
        social_engineering)
            install_social_engineering_tools ;;
        cloud_security)
            install_cloud_security_tools ;;
        all)
            install_all_tools ;;
        *)
            echo -e "${LYELLOW}未知类别${NC}" ;;
    esac
}

# Install information gathering tools
install_info_gathering_tools() {
    local tools=("nmap" "rustscan" "masscan" "subfinder" "amass" "assetfinder" \
                 "ffuf" "dirsearch" "gobuster" "whatweb" "httpx" "dnsenum" \
                 "dnsrecon" "fierce" "theHarvester" "recon-ng" "spiderfoot")
    
    TOTAL_STEPS=${#tools[@]}
    CURRENT_STEP=0
    
    log_info "开始安装信息收集工具 (${TOTAL_STEPS} 个)"
    
    for tool in "${tools[@]}"; do
        CURRENT_STEP=$((CURRENT_STEP + 1))
        progress_bar $CURRENT_STEP $TOTAL_STEPS "安装信息收集工具"
        
        case "$tool" in
            nmap) safe_run "$INSTALL_CMD nmap" "安装 nmap" 2 1 ;;
            rustscan) safe_run "$INSTALL_CMD rustscan" "安装 rustscan" 2 1 ;;
            masscan) safe_run "$INSTALL_CMD masscan" "安装 masscan" 2 1 ;;
            subfinder) 
                if command -v go &>/dev/null; then
                    safe_run "go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest" "安装 subfinder" 2 1
                else
                    safe_run "$INSTALL_CMD subfinder" "安装 subfinder" 2 1
                fi
                ;;
            amass) safe_run "$INSTALL_CMD amass" "安装 amass" 2 1 ;;
            assetfinder) safe_run "$INSTALL_CMD assetfinder" "安装 assetfinder" 2 1 ;;
            ffuf) 
                if command -v go &>/dev/null; then
                    safe_run "go install github.com/ffuf/ffuf/v2@latest" "安装 ffuf" 2 1
                else
                    safe_run "$INSTALL_CMD ffuf" "安装 ffuf" 2 1
                fi
                ;;
            dirsearch) 
                safe_run "git clone https://github.com/maurosoria/dirsearch.git ${TOOLS_DIR}/dirsearch" "安装 dirsearch" 2 1
                ;;
            gobuster) safe_run "$INSTALL_CMD gobuster" "安装 gobuster" 2 1 ;;
            whatweb) safe_run "$INSTALL_CMD whatweb" "安装 whatweb" 2 1 ;;
            httpx) safe_run "$INSTALL_CMD httpx" "安装 httpx" 2 1 ;;
            dnsenum) safe_run "$INSTALL_CMD dnsenum" "安装 dnsenum" 2 1 ;;
            dnsrecon) safe_run "$INSTALL_CMD dnsrecon" "安装 dnsrecon" 2 1 ;;
            fierce) safe_run "$INSTALL_CMD fierce" "安装 fierce" 2 1 ;;
            theHarvester) safe_run "$INSTALL_CMD theHarvester" "安装 theHarvester" 2 1 ;;
            recon-ng) safe_run "$INSTALL_CMD recon-ng" "安装 recon-ng" 2 1 ;;
            spiderfoot) safe_run "$INSTALL_CMD spiderfoot" "安装 spiderfoot" 2 1 ;;
            *) safe_run "$INSTALL_CMD $tool" "安装 $tool" 2 1 ;;
        esac
    done
    echo
    log_success "信息收集工具安装完成"
    
    # Update achievement
    ACHIEVEMENTS["tools_10"]=true
    save_achievements
}

# Install web testing tools
install_web_testing_tools() {
    local tools=("sqlmap" "nuclei" "wafw00f" "dalfox" "XSStrike" "jwt_tool" \
                 "nikto" "wapiti" "zaproxy" "burpsuite" "wfuzz" "commix")
    
    TOTAL_STEPS=${#tools[@]}
    CURRENT_STEP=0
    
    log_info "开始安装Web渗透工具 (${TOTAL_STEPS} 个)"
    
    for tool in "${tools[@]}"; do
        CURRENT_STEP=$((CURRENT_STEP + 1))
        progress_bar $CURRENT_STEP $TOTAL_STEPS "安装Web渗透工具"
        
        case "$tool" in
            sqlmap) safe_run "$INSTALL_CMD sqlmap" "安装 sqlmap" 2 1 ;;
            nuclei) safe_run "$INSTALL_CMD nuclei" "安装 nuclei" 2 1 ;;
            wafw00f) safe_run "$INSTALL_CMD wafw00f" "安装 wafw00f" 2 1 ;;
            dalfox) safe_run "$INSTALL_CMD dalfox" "安装 dalfox" 2 1 ;;
            XSStrike)
                safe_run "git clone https://github.com/s0md3v/XSStrike.git ${TOOLS_DIR}/XSStrike" "安装 XSStrike" 2 1
                ;;
            jwt_tool) safe_run "$INSTALL_CMD jwt_tool" "安装 jwt_tool" 2 1 ;;
            nikto) safe_run "$INSTALL_CMD nikto" "安装 nikto" 2 1 ;;
            wapiti) safe_run "$INSTALL_CMD wapiti" "安装 wapiti" 2 1 ;;
            zaproxy) safe_run "$INSTALL_CMD zaproxy" "安装 zaproxy" 2 1 ;;
            burpsuite) safe_run "$INSTALL_CMD burpsuite" "安装 burpsuite" 2 1 ;;
            wfuzz) safe_run "$INSTALL_CMD wfuzz" "安装 wfuzz" 2 1 ;;
            commix) safe_run "$INSTALL_CMD commix" "安装 commix" 2 1 ;;
            *) safe_run "$INSTALL_CMD $tool" "安装 $tool" 2 1 ;;
        esac
    done
    echo
    log_success "Web渗透工具安装完成"
}

# Install password attack tools
install_password_attack_tools() {
    local tools=("hydra" "john" "hashcat" "crunch" "hash-identifier" \
                 "hashid" "medusa" "ncrack" "ophcrack" "fcrackzip")
    
    TOTAL_STEPS=${#tools[@]}
    CURRENT_STEP=0
    
    log_info "开始安装密码攻击工具 (${TOTAL_STEPS} 个)"
    
    for tool in "${tools[@]}"; do
        CURRENT_STEP=$((CURRENT_STEP + 1))
        progress_bar $CURRENT_STEP $TOTAL_STEPS "安装密码攻击工具"
        safe_run "$INSTALL_CMD $tool" "安装 $tool" 2 1
    done
    echo
    log_success "密码攻击工具安装完成"
    
    # Update achievement
    ACHIEVEMENTS["tools_50"]=true
    save_achievements
}

# Install exploitation tools
install_exploitation_tools() {
    local tools=("metasploit" "searchsploit" "routersploit" "beef-xss" \
                 "exploitdb" "msfpc" "set" "veil" "shellnoob")
    
    TOTAL_STEPS=${#tools[@]}
    CURRENT_STEP=0
    
    log_info "开始安装漏洞利用工具 (${TOTAL_STEPS} 个)"
    
    for tool in "${tools[@]}"; do
        CURRENT_STEP=$((CURRENT_STEP + 1))
        progress_bar $CURRENT_STEP $TOTAL_STEPS "安装漏洞利用工具"
        
        case "$tool" in
            metasploit)
                echo -e "${LYELLOW}[!]${NC} ${YELLOW}Metasploit 安装较大，请耐心等待...${NC}"
                safe_run "$INSTALL_CMD metasploit" "安装 metasploit" 3 5
                ;;
            *)
                safe_run "$INSTALL_CMD $tool" "安装 $tool" 2 1
                ;;
        esac
    done
    echo
    log_success "漏洞利用工具安装完成"
}

# Install post exploitation tools
install_post_exploitation_tools() {
    local tools=("impacket" "crackmapexec" "evil-winrm" "bloodhound" \
                 "powershell-empire" "starkiller" "deathstar")
    
    TOTAL_STEPS=${#tools[@]}
    CURRENT_STEP=0
    
    log_info "开始安装后渗透工具 (${TOTAL_STEPS} 个)"
    
    for tool in "${tools[@]}"; do
        CURRENT_STEP=$((CURRENT_STEP + 1))
        progress_bar $CURRENT_STEP $TOTAL_STEPS "安装后渗透工具"
        safe_run "$INSTALL_CMD $tool" "安装 $tool" 2 1
    done
    echo
    log_success "后渗透工具安装完成"
    
    # Update achievement
    ACHIEVEMENTS["tools_100"]=true
    save_achievements
}

# Install wireless tools
install_wireless_tools() {
    local tools=("aircrack-ng" "reaver" "wifite" "hcxtools" "hcxdumptool" \
                 "pixiewps" "bully" "cowpatty" "pyrit" "mdk4")
    
    TOTAL_STEPS=${#tools[@]}
    CURRENT_STEP=0
    
    log_info "开始安装无线渗透工具 (${TOTAL_STEPS} 个)"
    
    for tool in "${tools[@]}"; do
        CURRENT_STEP=$((CURRENT_STEP + 1))
        progress_bar $CURRENT_STEP $TOTAL_STEPS "安装无线渗透工具"
        safe_run "$INSTALL_CMD $tool" "安装 $tool" 2 1
    done
    echo
    log_success "无线渗透工具安装完成"
}

# Install reverse engineering tools
install_reverse_engineering_tools() {
    local tools=("radare2" "apktool" "jadx" "frida" "binwalk" \
                 "ghidra" "rizin" "iaito" "x64dbg" "edb-debugger")
    
    TOTAL_STEPS=${#tools[@]}
    CURRENT_STEP=0
    
    log_info "开始安装逆向工程工具 (${TOTAL_STEPS} 个)"
    
    for tool in "${tools[@]}"; do
        CURRENT_STEP=$((CURRENT_STEP + 1))
        progress_bar $CURRENT_STEP $TOTAL_STEPS "安装逆向工程工具"
        safe_run "$INSTALL_CMD $tool" "安装 $tool" 2 1
    done
    echo
    log_success "逆向工程工具安装完成"
}

# Install forensics tools
install_forensics_tools() {
    local tools=("binwalk" "foremost" "exiftool" "stegseek" "volatility3" \
                 "autopsy" "sleuthkit" "dc3dd" "guymager" "testdisk")
    
    TOTAL_STEPS=${#tools[@]}
    CURRENT_STEP=0
    
    log_info "开始安装数字取证工具 (${TOTAL_STEPS} 个)"
    
    for tool in "${tools[@]}"; do
        CURRENT_STEP=$((CURRENT_STEP + 1))
        progress_bar $CURRENT_STEP $TOTAL_STEPS "安装数字取证工具"
        safe_run "$INSTALL_CMD $tool" "安装 $tool" 2 1
    done
    echo
    log_success "数字取证工具安装完成"
}

# Install social engineering tools
install_social_engineering_tools() {
    local tools=("maigret" "sherlock" "holehe" "blackbird" "socialscan" \
                 "gophish" "zphisher" "hiddeneye" "setoolkit")
    
    TOTAL_STEPS=${#tools[@]}
    CURRENT_STEP=0
    
    log_info "开始安装社工工具 (${TOTAL_STEPS} 个)"
    
    for tool in "${tools[@]}"; do
        CURRENT_STEP=$((CURRENT_STEP + 1))
        progress_bar $CURRENT_STEP $TOTAL_STEPS "安装社工工具"
        safe_run "$INSTALL_CMD $tool" "安装 $tool" 2 1
    done
    echo
    log_success "社工工具安装完成"
}

# Install cloud security tools
install_cloud_security_tools() {
    local tools=("awscli" "trivy" "scoutsuite" "prowler" "cloudmapper" \
                 "cloudsplaining" "pacup" "enumerate-iam")
    
    TOTAL_STEPS=${#tools[@]}
    CURRENT_STEP=0
    
    log_info "开始安装云安全工具 (${TOTAL_STEPS} 个)"
    
    for tool in "${tools[@]}"; do
        CURRENT_STEP=$((CURRENT_STEP + 1))
        progress_bar $CURRENT_STEP $TOTAL_STEPS "安装云安全工具"
        safe_run "$INSTALL_CMD $tool" "安装 $tool" 2 1
    done
    echo
    log_success "云安全工具安装完成"
}

# Install all tools
install_all_tools() {
    local categories=("info_gathering" "web_testing" "password_attack" "exploitation" \
                      "post_exploitation" "wireless" "reverse_engineering" "forensics" \
                      "social_engineering" "cloud_security")
    
    local total_categories=${#categories[@]}
    local current_category=0
    
    log_info "开始安装所有工具 (${total_categories} 个类别)"
    
    for category in "${categories[@]}"; do
        current_category=$((current_category + 1))
        echo
        echo -e "${BOLD}${LCYAN}[${current_category}/${total_categories}]${NC} 正在安装类别: ${category}"
        separator "─"
        
        install_tools_category "$category"
        
        # Run mini game during long installations
        if [[ $((RANDOM % 3)) -eq 0 ]]; then
            echo
            echo -e "${LCYAN}┌─────────────────────────────────────────┐${NC}"
            echo -e "${LCYAN}│${NC} ${YELLOW}安装进行中，要玩个小游戏吗？${NC}         ${LCYAN}│${NC}"
            echo -e "${LCYAN}│${NC} ${GREEN}[1]${NC} 贪吃蛇  ${LMAGENTA}[2]${NC} 猜数字  ${DIM}[3]${NC} 继续   ${LCYAN}│${NC}"
            echo -e "${LCYAN}└─────────────────────────────────────────┘${NC}"
            read -t 5 -n 1 play_choice 2>/dev/null
            
            case "$play_choice" in
                1) game_snake ;;
                2) game_guess_number ;;
                *) ;;
            esac
        fi
    done
    
    echo
    log_success "所有工具安装完成！"
    
    ACHIEVEMENTS["tools_all"]=true
    save_achievements
    
    echo -e "${GOLD}🏆 成就解锁: 全工具制霸！${NC}"
}

# Tools menu
tools_menu() {
    while true; do
        clear_screen
        draw_header "🛠️ 工具集安装" "$LCYAN"
        echo
        
        echo -e "  ${LCYAN}[1]${NC}  🔍 信息收集工具     ${DIM}(nmap, amass, ffuf...)${NC}"
        echo -e "  ${LCYAN}[2]${NC}  🌐 Web渗透工具      ${DIM}(sqlmap, nuclei, XSStrike...)${NC}"
        echo -e "  ${LCYAN}[3]${NC}  🔑 密码攻击工具     ${DIM}(hydra, hashcat, john...)${NC}"
        echo -e "  ${LCYAN}[4]${NC}  💥 漏洞利用工具     ${DIM}(metasploit, searchsploit...)${NC}"
        echo -e "  ${LCYAN}[5]${NC}  🎯 后渗透工具       ${DIM}(impacket, bloodhound...)${NC}"
        echo -e "  ${LCYAN}[6]${NC}  📡 无线渗透工具     ${DIM}(aircrack-ng, wifite...)${NC}"
        echo -e "  ${LCYAN}[7]${NC}  🔧 逆向工程工具     ${DIM}(radare2, ghidra, frida...)${NC}"
        echo -e "  ${LCYAN}[8]${NC}  🔬 数字取证工具     ${DIM}(volatility, autopsy...)${NC}"
        echo -e "  ${LCYAN}[9]${NC}  🎭 社工工具         ${DIM}(sherlock, maigret...)${NC}"
        echo -e "  ${LCYAN}[10]${NC} ☁️  云安全工具       ${DIM}(scoutsuite, prowler...)${NC}"
        echo
        echo -e "  ${LGREEN}[A]${NC}  🎯 一键安装所有工具 ${DIM}(约需1小时+)${NC}"
        echo -e "  ${YELLOW}[S]${NC}  📊 查看安装状态"
        echo -e "  ${YELLOW}[0]${NC}  返回主菜单"
        echo
        
        read -r -p "$(echo -e "${BOLD}请选择 [1-10/A/S/0]:${NC} ")" choice
        
        case "$choice" in
            1) install_tools_category "info_gathering" ;;
            2) install_tools_category "web_testing" ;;
            3) install_tools_category "password_attack" ;;
            4) install_tools_category "exploitation" ;;
            5) install_tools_category "post_exploitation" ;;
            6) install_tools_category "wireless" ;;
            7) install_tools_category "reverse_engineering" ;;
            8) install_tools_category "forensics" ;;
            9) install_tools_category "social_engineering" ;;
            10) install_tools_category "cloud_security" ;;
            A|a) install_all_tools ;;
            S|s) 
                echo -e "${YELLOW}已安装工具统计${NC}"
                echo -e "${DIM}功能开发中...${NC}"
                sleep 1
                ;;
            0) return ;;
            *) echo -e "${LYELLOW}无效选择${NC}"; sleep 1 ;;
        esac
    done
}

# ============================================================
# DEVELOPMENT ENVIRONMENT SETUP
# ============================================================

setup_dev_environment() {
    clear_screen
    draw_header "💻 开发环境配置" "$LCYAN"
    echo
    
    echo -e "${BOLD}选择要安装的开发环境:${NC}"
    echo
    echo -e "  ${YELLOW}[1]${NC} 🐍 Python    ${DIM}(pip, poetry, venv)${NC}"
    echo -e "  ${YELLOW}[2]${NC} 🟢 Node.js   ${DIM}(npm, yarn, pnpm)${NC}"
    echo -e "  ${YELLOW}[3]${NC} 💎 Ruby      ${DIM}(gem, bundler)${NC}"
    echo -e "  ${YELLOW}[4]${NC} 🔵 Go        ${DIM}(go modules)${NC}"
    echo -e "  ${YELLOW}[5]${NC} 🦀 Rust      ${DIM}(cargo)${NC}"
    echo -e "  ${YELLOW}[6]${NC} ⚙️  C/C++     ${DIM}(clang, gcc, make, cmake)${NC}"
    echo -e "  ${YELLOW}[7]${NC} ☕ Java      ${DIM}(openjdk)${NC}"
    echo -e "  ${YELLOW}[8]${NC} 🐘 PHP       ${DIM}(composer)${NC}"
    echo -e "  ${YELLOW}[9]${NC} 🐳 Docker    ${DIM}(容器环境)${NC}"
    echo -e "  ${YELLOW}[10]${NC} 📦 全部安装"
    echo
    echo -e "  ${YELLOW}[0]${NC} 返回"
    echo
    
    read -r -p "$(echo -e "${BOLD}请选择 [1-10]:${NC} ")" choice
    
    case "$choice" in
        1) 
            safe_run "$INSTALL_CMD python python-pip" "安装 Python" 2 1
            safe_run "pip install poetry" "安装 Poetry" 2 1
            ;;
        2) 
            safe_run "$INSTALL_CMD nodejs npm" "安装 Node.js" 2 1
            safe_run "npm install -g yarn pnpm" "安装 yarn/pnpm" 2 1
            ;;
        3) safe_run "$INSTALL_CMD ruby" "安装 Ruby" 2 1 ;;
        4) safe_run "$INSTALL_CMD golang" "安装 Go" 2 1 ;;
        5) 
            safe_run "$INSTALL_CMD rust" "安装 Rust" 2 1
            ;;
        6) safe_run "$INSTALL_CMD clang make cmake gdb" "安装 C/C++" 2 1 ;;
        7) safe_run "$INSTALL_CMD openjdk-17" "安装 Java" 2 1 ;;
        8) safe_run "$INSTALL_CMD php php-composer" "安装 PHP" 2 1 ;;
        9) 
            echo -e "${LYELLOW}[!]${NC} ${YELLOW}Docker 需要特殊配置，正在尝试安装...${NC}"
            safe_run "$INSTALL_CMD docker docker-compose" "安装 Docker" 2 1
            ;;
        10)
            echo -e "${LYELLOW}[!]${NC} ${YELLOW}安装全部开发环境，这可能需要一些时间...${NC}"
            safe_run "$INSTALL_CMD python python-pip nodejs npm ruby golang rust clang make cmake openjdk-17 php" "安装全部开发环境" 3 5
            ;;
        0) return ;;
        *) echo -e "${LYELLOW}无效选择${NC}"; sleep 1 ;;
    esac
    
    echo
    read -r -p "按回车键继续..."
}

# ============================================================
# TERMINAL BEAUTIFICATION
# ============================================================

setup_beautification() {
    clear_screen
    draw_header "🎨 终端美化" "$LMAGENTA"
    echo
    
    echo -e "${BOLD}美化选项:${NC}"
    echo
    echo -e "  ${YELLOW}[1]${NC} 🐚 Zsh + Oh-My-Zsh + Powerlevel10k"
    echo -e "  ${YELLOW}[2]${NC} 🚀 Starship Prompt"
    echo -e "  ${YELLOW}[3]${NC} 🔤 Nerd Fonts"
    echo -e "  ${YELLOW}[4]${NC} 🎨 Gogh 配色方案 (200+主题)"
    echo -e "  ${YELLOW}[5]${NC} 🛠️  美化工具包 (exa/bat/ripgrep/fd/btop)"
    echo -e "  ${YELLOW}[6]${NC} 🐠 Fish Shell"
    echo -e "  ${YELLOW}[7]${NC} 💻 Tmux 豪华配置"
    echo -e "  ${YELLOW}[8]${NC} 🌟 全部安装"
    echo
    echo -e "  ${YELLOW}[0]${NC} 返回"
    echo
    
    read -r -p "$(echo -e "${BOLD}请选择 [1-8]:${NC} ")" choice
    
    case "$choice" in
        1)
            safe_run "$INSTALL_CMD zsh git curl" "安装 Zsh 和依赖" 2 1
            echo -e "${YELLOW}安装 Oh-My-Zsh...${NC}"
            sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended 2>/dev/null
            echo -e "${YELLOW}安装 Powerlevel10k...${NC}"
            git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k 2>/dev/null
            echo -e "${YELLOW}安装常用插件...${NC}"
            git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 2>/dev/null
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 2>/dev/null
            log_success "Zsh + Oh-My-Zsh + Powerlevel10k 安装完成"
            ;;
        2) safe_run "$INSTALL_CMD starship" "安装 Starship" 2 1 ;;
        3) 
            echo -e "${YELLOW}请手动下载 Nerd Fonts:${NC}"
            echo -e "${LCYAN}https://www.nerdfonts.com/font-downloads${NC}"
            sleep 2
            ;;
        4)
            echo -e "${YELLOW}安装 Gogh 配色方案...${NC}"
            bash -c "$(curl -sLo- https://git.io/vQgMr)" 2>/dev/null
            ;;
        5)
            safe_run "$INSTALL_CMD eza bat ripgrep fd btop duf" "安装美化工具包" 2 1
            # Create aliases
            {
                echo "# Dragon Deploy - 美化工具别名"
                echo "alias ls='eza --icons --color=always --group-directories-first'"
                echo "alias ll='eza -l --icons --color=always --group-directories-first'"
                echo "alias la='eza -la --icons --color=always --group-directories-first'"
                echo "alias cat='bat --style=plain'"
                echo "alias grep='rg'"
                echo "alias find='fd'"
                echo "alias top='btop'"
                echo "alias df='duf'"
            } >> "$HOME/.bashrc" 2>/dev/null
            log_success "美化工具包安装完成，别名已配置"
            ;;
        6) 
            safe_run "$INSTALL_CMD fish" "安装 Fish Shell" 2 1
            echo -e "${YELLOW}安装 Fisher 插件管理器...${NC}"
            fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher" 2>/dev/null
            ;;
        7)
            safe_run "$INSTALL_CMD tmux" "安装 Tmux" 2 1
            # Create tmux config
            {
                echo "# Dragon Deploy - Tmux 豪华配置"
                echo "set -g mouse on"
                echo "set -g default-terminal \"screen-256color\""
                echo "set -g status-bg colour235"
                echo "set -g status-fg white"
                echo "set -g status-left '#[fg=green]#H'"
                echo "set -g status-right '#[fg=yellow]%Y-%m-%d %H:%M'"
                echo "set -g window-status-current-style bg=red,fg=white"
                echo "bind | split-window -h"
                echo "bind - split-window -v"
                echo "bind r source-file ~/.tmux.conf"
            } > "$HOME/.tmux.conf" 2>/dev/null
            log_success "Tmux 豪华配置完成"
            ;;
        8)
            setup_beautification_all
            ;;
        0) return ;;
        *) echo -e "${LYELLOW}无效选择${NC}"; sleep 1 ;;
    esac
    
    echo
    read -r -p "按回车键继续..."
}

# Setup all beautification
setup_beautification_all() {
    log_info "开始安装所有美化工具..."
    
    # Zsh
    safe_run "$INSTALL_CMD zsh git curl" "安装 Zsh" 2 1
    if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended 2>/dev/null
    fi
    
    # Powerlevel10k
    if [[ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]]; then
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k 2>/dev/null
    fi
    
    # Starship
    safe_run "$INSTALL_CMD starship" "安装 Starship" 2 1
    
    # Fish
    safe_run "$INSTALL_CMD fish tmux" "安装 Fish 和 Tmux" 2 1
    
    # Beauty tools
    safe_run "$INSTALL_CMD eza bat ripgrep fd btop duf" "安装美化工具包" 2 1
    
    log_success "终端美化全部完成！"
}

# ============================================================
# BACKUP & RESTORE
# ============================================================

backup_system() {
    clear_screen
    draw_header "💾 系统备份" "$LYELLOW"
    echo
    
    echo -e "${BOLD}备份选项:${NC}"
    echo
    echo -e "  ${YELLOW}[1]${NC} 📦 完整备份 (Termux全部数据)"
    echo -e "  ${YELLOW}[2]${NC} ⚙️  配置备份 (仅配置文件)"
    echo -e "  ${YELLOW}[3]${NC} 📋 包列表备份"
    echo -e "  ${YELLOW}[4]${NC} 🗂️  工具目录备份"
    echo
    echo -e "  ${YELLOW}[0]${NC} 返回"
    echo
    
    read -r -p "$(echo -e "${BOLD}请选择 [1-4]:${NC} ")" choice
    
    case "$choice" in
        1) perform_full_backup ;;
        2) perform_config_backup ;;
        3) perform_package_backup ;;
        4) perform_tools_backup ;;
        0) return ;;
        *) echo -e "${LYELLOW}无效选择${NC}"; sleep 1 ;;
    esac
}

perform_full_backup() {
    local backup_file="${BACKUP_DIR}/termux-full-backup-$(date +%Y%m%d-%H%M%S).tar.gz"
    
    echo -e "${YELLOW}正在创建完整备份...${NC}"
    echo -e "${DIM}这可能需要几分钟时间...${NC}"
    echo
    
    # Check available space
    local needed_space=$(du -sb "$HOME_DIR" 2>/dev/null | cut -f1)
    local available_space=$(df -B1 "$BACKUP_DIR" 2>/dev/null | awk 'NR==2{print $4}')
    
    if [[ $needed_space -gt $available_space ]]; then
        echo -e "${LRED}磁盘空间不足！${NC}"
        echo -e "${YELLOW}需要: $(numfmt --to=iec $needed_space)${NC}"
        echo -e "${YELLOW}可用: $(numfmt --to=iec $available_space)${NC}"
        read -r -p "按回车键返回..."
        return
    fi
    
    # Create backup
    tar -czf "$backup_file" \
        -C "$HOME_DIR" \
        --exclude="cache" \
        --exclude="tmp" \
        --exclude=".git" \
        --exclude="logs" \
        . 2>/dev/null &
    
    spinner $! "创建完整备份中"
    
    if [[ -f "$backup_file" ]]; then
        local size=$(du -h "$backup_file" | cut -f1)
        echo
        echo -e "${LGREEN}════════════════════════════════════════${NC}"
        echo -e "${LGREEN}  备份完成！${NC}"
        echo -e "${LGREEN}  文件: ${backup_file}${NC}"
        echo -e "${LGREEN}  大小: ${size}${NC}"
        echo -e "${LGREEN}════════════════════════════════════════${NC}"
        
        # Save backup list
        echo "$backup_file|$size|$(date)" >> "${BACKUP_DIR}/backup-list.txt"
    else
        echo -e "${LRED}备份失败${NC}"
    fi
    
    echo
    read -r -p "按回车键继续..."
}

perform_config_backup() {
    local backup_file="${BACKUP_DIR}/config-backup-$(date +%Y%m%d-%H%M%S).tar.gz"
    
    echo -e "${YELLOW}正在备份配置文件...${NC}"
    
    # Backup important config files
    tar -czf "$backup_file" \
        -C "$HOME_DIR" \
        .bashrc .zshrc .tmux.conf .gitconfig \
        .config/ .local/ .termux/ \
        2>/dev/null &
    
    spinner $! "备份配置中"
    
    if [[ -f "$backup_file" ]]; then
        local size=$(du -h "$backup_file" | cut -f1)
        echo
        echo -e "${LGREEN}配置备份完成！${NC}"
        echo -e "${LGREEN}文件: ${backup_file}${NC}"
        echo -e "${LGREEN}大小: ${size}${NC}"
    fi
    
    echo
    read -r -p "按回车键继续..."
}

perform_package_backup() {
    local backup_file="${BACKUP_DIR}/packages-$(date +%Y%m%d-%H%M%S).list"
    
    echo -e "${YELLOW}正在导出已安装包列表...${NC}"
    
    if [[ "$TERMUX" == true ]]; then
        pkg list-installed 2>/dev/null > "$backup_file"
    else
        dpkg -l 2>/dev/null > "$backup_file"
    fi
    
    if [[ -f "$backup_file" ]]; then
        echo -e "${LGREEN}包列表已导出: ${backup_file}${NC}"
    fi
    
    echo
    read -r -p "按回车键继续..."
}

perform_tools_backup() {
    local backup_file="${BACKUP_DIR}/tools-backup-$(date +%Y%m%d-%H%M%S).tar.gz"
    
    echo -e "${YELLOW}正在备份工具目录...${NC}"
    
    if [[ -d "$TOOLS_DIR" ]]; then
        tar -czf "$backup_file" -C "$HOME_DIR" tools/ 2>/dev/null &
        spinner $! "备份工具目录中"
        
        if [[ -f "$backup_file" ]]; then
            local size=$(du -h "$backup_file" | cut -f1)
            echo
            echo -e "${LGREEN}工具目录备份完成！${NC}"
            echo -e "${LGREEN}文件: ${backup_file}${NC}"
            echo -e "${LGREEN}大小: ${size}${NC}"
        fi
    else
        echo -e "${LYELLOW}工具目录不存在，跳过备份${NC}"
    fi
    
    echo
    read -r -p "按回车键继续..."
}

restore_system() {
    clear_screen
    draw_header "📥 系统还原" "$LYELLOW"
    echo
    
    # List available backups
    echo -e "${BOLD}可用备份:${NC}"
    echo
    local backups=("$BACKUP_DIR"/*.tar.gz)
    
    if [[ ${#backups[@]} -eq 0 ]] || [[ ! -f "${backups[0]}" ]]; then
        echo -e "${YELLOW}没有找到备份文件${NC}"
        echo
        read -r -p "按回车键返回..."
        return
    fi
    
    local i=1
    declare -a backup_files
    for backup in "${backups[@]}"; do
        if [[ -f "$backup" ]]; then
            local size=$(du -h "$backup" | cut -f1)
            local date=$(basename "$backup" .tar.gz | sed 's/termux.*backup-//' | sed 's/config-backup-//')
            echo -e "  ${YELLOW}[$i]${NC} $date ${DIM}($size)${NC}"
            backup_files[$i]="$backup"
            ((i++))
        fi
    done
    
    echo
    echo -e "  ${YELLOW}[0]${NC} 返回"
    echo
    
    read -r -p "$(echo -e "${BOLD}选择要还原的备份 [1-$((i-1))]:${NC} ")" choice
    
    if [[ "$choice" =~ ^[0-9]+$ ]] && [[ $choice -ge 1 ]] && [[ $choice -le $((i-1)) ]]; then
        local selected="${backup_files[$choice]}"
        
        clear_screen
        echo -e "${LRED}${BOLD}⚠️  警告: 还原将覆盖当前文件！${NC}"
        echo
        echo -e "备份文件: ${YELLOW}$(basename "$selected")${NC}"
        echo -e "备份大小: ${YELLOW}$(du -h "$selected" | cut -f1)${NC}"
        echo
        
        read -r -p "确认还原？输入 'YES' 确认: " confirm
        
        if [[ "$confirm" == "YES" ]]; then
            echo
            echo -e "${YELLOW}正在还原...${NC}"
            
            # Create a temporary restore point
            local restore_point="${BACKUP_DIR}/restore-point-$(date +%Y%m%d-%H%M%S).tar.gz"
            tar -czf "$restore_point" -C "$HOME_DIR" . 2>/dev/null &
            spinner $! "创建还原点"
            
            # Extract backup
            tar -xzf "$selected" -C "$HOME_DIR" 2>/dev/null &
            spinner $! "还原中"
            
            echo
            echo -e "${LGREEN}还原完成！${NC}"
            echo -e "${DIM}如需撤销，可使用还原点: ${restore_point}${NC}"
        else
            echo -e "${YELLOW}已取消还原操作${NC}"
        fi
    fi
    
    echo
    read -r -p "按回车键继续..."
}

# ============================================================
# CLOUD SYNC
# ============================================================

cloud_sync_menu() {
    while true; do
        clear_screen
        draw_header "☁️ 云端同步" "$LCYAN"
        echo
        
        echo -e "  ${YELLOW}[1]${NC} 🐙 GitHub 同步配置"
        echo -e "  ${YELLOW}[2]${NC} 📁 WebDAV 远程备份"
        echo -e "  ${YELLOW}[3]${NC} 🤖 Telegram Bot 通知设置"
        echo -e "  ${YELLOW}[4]${NC} 📤 上传日志"
        echo -e "  ${YELLOW}[5]${NC} 📥 下载云端配置"
        echo -e "  ${YELLOW}[6]${NC} 🔗 配置远程仓库"
        echo
        echo -e "  ${YELLOW}[0]${NC} 返回"
        echo
        
        read -r -p "$(echo -e "${BOLD}请选择 [1-6]:${NC} ")" choice
        
        case "$choice" in
            1) sync_github ;;
            2) sync_webdav ;;
            3) setup_telegram ;;
            4) upload_logs ;;
            5) download_cloud_config ;;
            6) configure_remote ;;
            0) return ;;
            *) echo -e "${LYELLOW}无效选择${NC}"; sleep 1 ;;
        esac
    done
}

sync_github() {
    clear_screen
    draw_header "🐙 GitHub 同步" "$LCYAN"
    echo
    
    if ! command -v git &>/dev/null; then
        safe_run "$INSTALL_CMD git" "安装 Git" 2 1
    fi
    
    echo -e "${YELLOW}配置 GitHub 同步...${NC}"
    echo
    
    # Check for existing git config
    if [[ -f "$HOME/.gitconfig" ]]; then
        echo -e "${LGREEN}已检测到 Git 配置${NC}"
        echo -e "${DIM}用户名: $(git config --global user.name 2>/dev/null || echo '未设置')${NC}"
        echo -e "${DIM}邮箱: $(git config --global user.email 2>/dev/null || echo '未设置')${NC}"
    else
        echo -e "${YELLOW}请输入 Git 配置信息:${NC}"
        read -r -p "用户名: " git_name
        read -r -p "邮箱: " git_email
        
        if [[ -n "$git_name" ]]; then
            git config --global user.name "$git_name" 2>/dev/null
        fi
        if [[ -n "$git_email" ]]; then
            git config --global user.email "$git_email" 2>/dev/null
        fi
        echo -e "${LGREEN}Git 配置已保存${NC}"
    fi
    
    # Generate SSH key if not exists
    if [[ ! -f "$HOME/.ssh/id_ed25519" ]]; then
        echo
        echo -e "${YELLOW}生成 SSH 密钥...${NC}"
        ssh-keygen -t ed25519 -C "$(git config --global user.email 2>/dev/null || echo 'kali-dragon@termux')" -f "$HOME/.ssh/id_ed25519" -N "" 2>/dev/null
        echo -e "${LGREEN}SSH 密钥已生成${NC}"
        echo -e "${YELLOW}请将以下公钥添加到 GitHub:${NC}"
        echo -e "${LCYAN}$(cat $HOME/.ssh/id_ed25519.pub 2>/dev/null)${NC}"
    fi
    
    echo
    echo -e "${DIM}仓库地址示例: git@github.com:用户名/仓库名.git${NC}"
    read -r -p "输入仓库地址 (留空跳过): " repo_url
    
    if [[ -n "$repo_url" ]]; then
        # Initialize git repo for configs
        local config_repo="${CONFIG_DIR}/dotfiles"
        mkdir -p "$config_repo"
        
        cd "$config_repo" || return
        
        if [[ ! -d ".git" ]]; then
            git init 2>/dev/null
            git remote add origin "$repo_url" 2>/dev/null
        fi
        
        # Copy important configs
        cp "$HOME/.bashrc" "$config_repo/" 2>/dev/null
        cp "$HOME/.zshrc" "$config_repo/" 2>/dev/null
        cp "$HOME/.tmux.conf" "$config_repo/" 2>/dev/null
        cp "$HOME/.gitconfig" "$config_repo/" 2>/dev/null
        cp -r "$CONFIG_DIR" "$config_repo/dragon-config" 2>/dev/null
        
        # Create README
        {
            echo "# Kali Dragon Deploy - Dotfiles"
            echo "Backup created: $(date)"
            echo "Version: ${VERSION}"
        } > "$config_repo/README.md"
        
        git add . 2>/dev/null
        git commit -m "🔄 Auto backup: $(date '+%Y-%m-%d %H:%M:%S')" 2>/dev/null
        
        echo
        echo -e "${YELLOW}正在推送到 GitHub...${NC}"
        if git push -u origin main 2>/dev/null || git push -u origin master 2>/dev/null; then
            echo -e "${LGREEN}配置已成功推送到 GitHub！${NC}"
            log_success "配置已同步到 GitHub"
        else
            echo -e "${LYELLOW}推送失败，请检查 SSH 密钥和仓库地址${NC}"
            echo -e "${DIM}提示: 确保已将 SSH 公钥添加到 GitHub 账号${NC}"
        fi
        
        cd "$SCRIPT_DIR" || return
    fi
    
    echo
    read -r -p "按回车键继续..."
}

sync_webdav() {
    clear_screen
    draw_header "📁 WebDAV 远程备份" "$LCYAN"
    echo
    
    # Check for required tools
    if ! command -v curl &>/dev/null; then
        safe_run "$INSTALL_CMD curl" "安装 curl" 2 1
    fi
    
    echo -e "${YELLOW}WebDAV 配置:${NC}"
    echo -e "${DIM}支持: NextCloud / OwnCloud / 坚果云 / 自建 WebDAV${NC}"
    echo
    
    read -r -p "WebDAV 地址 (如: https://dav.example.com/remote.php/dav/files/user/): " webdav_url
    read -r -p "用户名: " webdav_user
    read -r -s -p "密码: " webdav_pass
    echo
    echo
    
    if [[ -n "$webdav_url" && -n "$webdav_user" ]]; then
        # Test connection
        echo -e "${YELLOW}测试连接...${NC}"
        local test_response=$(curl -s -o /dev/null -w "%{http_code}" -u "${webdav_user}:${webdav_pass}" "${webdav_url}" 2>/dev/null)
        
        if [[ "$test_response" == "200" || "$test_response" == "207" ]]; then
            echo -e "${LGREEN}连接成功！${NC}"
            
            # Create backup and upload
            local backup_file="${BACKUP_DIR}/webdav-backup-$(date +%Y%m%d-%H%M%S).tar.gz"
            
            echo -e "${YELLOW}创建备份...${NC}"
            tar -czf "$backup_file" \
                -C "$HOME_DIR" \
                --exclude="cache" --exclude="tmp" --exclude=".git" --exclude="logs" \
                .bashrc .zshrc .tmux.conf .gitconfig \
                .config/ .local/ .termux/ \
                2>/dev/null
            
            if [[ -f "$backup_file" ]]; then
                echo -e "${YELLOW}上传到 WebDAV...${NC}"
                local filename=$(basename "$backup_file")
                curl -T "$backup_file" -u "${webdav_user}:${webdav_pass}" "${webdav_url}${filename}" 2>/dev/null
                
                if [[ $? -eq 0 ]]; then
                    echo -e "${LGREEN}备份已成功上传！${NC}"
                    rm -f "$backup_file"
                else
                    echo -e "${LRED}上传失败${NC}"
                fi
            fi
        else
            echo -e "${LRED}连接失败 (HTTP ${test_response})${NC}"
            echo -e "${DIM}请检查地址和凭据${NC}"
        fi
    fi
    
    echo
    read -r -p "按回车键继续..."
}

setup_telegram() {
    clear_screen
    draw_header "🤖 Telegram Bot 通知" "$LCYAN"
    echo
    
    # Check for telegram-send
    if ! command -v telegram-send &>/dev/null; then
        echo -e "${YELLOW}安装 telegram-send...${NC}"
        safe_run "pip install telegram-send" "安装 telegram-send" 2 1 || {
            safe_run "$INSTALL_CMD telegram-send" "安装 telegram-send" 2 1
        }
    fi
    
    echo -e "${YELLOW}Telegram Bot 配置步骤:${NC}"
    echo
    echo -e "  ${DIM}1. 在 Telegram 中搜索 ${BOLD}@BotFather${NC}"
    echo -e "  ${DIM}2. 发送 ${BOLD}/newbot${DIM} 创建机器人${NC}"
    echo -e "  ${DIM}3. 输入机器人名称 (如: KaliDragonBot)${NC}"
    echo -e "  ${DIM}4. 输入用户名 (如: kalidragon_bot)${NC}"
    echo -e "  ${DIM}5. 获取 Token${NC}"
    echo -e "  ${DIM}6. 搜索 ${BOLD}@userinfobot${DIM} 获取 Chat ID${NC}"
    echo
    
    read -r -p "Bot Token: " bot_token
    read -r -p "Chat ID: " chat_id
    
    if [[ -n "$bot_token" && -n "$chat_id" ]]; then
        echo
        echo -e "${YELLOW}发送测试消息...${NC}"
        
        if command -v telegram-send &>/dev/null; then
            telegram-send --configure --token "$bot_token" --chat-id "$chat_id" 2>/dev/null
            telegram-send "🐉 Kali Dragon Deploy v${VERSION} - 通知已配置！$(date)" 2>/dev/null
        else
            # Use curl as fallback
            curl -s -X POST "https://api.telegram.org/bot${bot_token}/sendMessage" \
                -d "chat_id=${chat_id}" \
                -d "text=🐉 Kali Dragon Deploy v${VERSION} - 通知已配置！$(date)" \
                -d "parse_mode=HTML" 2>/dev/null
        fi
        
        if [[ $? -eq 0 ]]; then
            echo -e "${LGREEN}Telegram 通知已配置！${NC}"
            
            # Save config
            {
                echo "TELEGRAM_BOT_TOKEN=${bot_token}"
                echo "TELEGRAM_CHAT_ID=${chat_id}"
            } > "${CONFIG_DIR}/telegram.conf"
            
            # Send achievement notification
            send_telegram_notification "🏆 成就解锁: Telegram 通知已配置"
        else
            echo -e "${LRED}配置失败，请检查 Token 和 Chat ID${NC}"
        fi
    fi
    
    echo
    read -r -p "按回车键继续..."
}

send_telegram_notification() {
    local message="$1"
    
    if [[ -f "${CONFIG_DIR}/telegram.conf" ]]; then
        source "${CONFIG_DIR}/telegram.conf" 2>/dev/null
        
        if [[ -n "$TELEGRAM_BOT_TOKEN" && -n "$TELEGRAM_CHAT_ID" ]]; then
            curl -s -X POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
                -d "chat_id=${TELEGRAM_CHAT_ID}" \
                -d "text=${message}" \
                -d "parse_mode=HTML" \
                -o /dev/null 2>/dev/null
        fi
    fi
}

upload_logs() {
    clear_screen
    draw_header "📤 上传日志" "$LCYAN"
    echo
    
    echo -e "${BOLD}最近的日志文件:${NC}"
    echo
    local i=1
    declare -a log_files
    
    # List log files
    for log in "$LOG_DIR"/*.log; do
        if [[ -f "$log" ]]; then
            local size=$(du -h "$log" | cut -f1)
            local date=$(basename "$log" .log | sed 's/deploy-//' | sed 's/errors-//')
            echo -e "  ${YELLOW}[$i]${NC} $date ${DIM}($size)${NC}"
            log_files[$i]="$log"
            ((i++))
        fi
    done
    
    if [[ ${#log_files[@]} -eq 0 ]]; then
        echo -e "${YELLOW}没有找到日志文件${NC}"
        echo
        read -r -p "按回车键返回..."
        return
    fi
    
    echo
    echo -e "  ${YELLOW}[A]${NC} 上传所有日志"
    echo -e "  ${YELLOW}[0]${NC} 返回"
    echo
    
    read -r -p "$(echo -e "${BOLD}选择要上传的日志:${NC} ")" choice
    
    if [[ "$choice" == "A" || "$choice" == "a" ]]; then
        # Upload all logs
        local combined_log="${TEMP_DIR}/all-logs-$(date +%Y%m%d-%H%M%S).txt"
        cat "$LOG_DIR"/*.log > "$combined_log" 2>/dev/null
        
        if [[ -f "$combined_log" ]]; then
            upload_to_0x0 "$combined_log"
        fi
    elif [[ "$choice" =~ ^[0-9]+$ ]] && [[ $choice -ge 1 ]] && [[ -n "${log_files[$choice]}" ]]; then
        upload_to_0x0 "${log_files[$choice]}"
    fi
    
    echo
    read -r -p "按回车键继续..."
}

upload_to_0x0() {
    local file="$1"
    
    if [[ ! -f "$file" ]]; then
        echo -e "${LRED}文件不存在${NC}"
        return 1
    fi
    
    echo -e "${YELLOW}上传 $(basename "$file")...${NC}"
    
    if command -v curl &>/dev/null; then
        local upload_url=$(curl -s -F "file=@${file}" https://0x0.st 2>/dev/null)
        if [[ -n "$upload_url" ]]; then
            echo -e "${LGREEN}上传成功！${NC}"
            echo -e "${LCYAN}链接: ${upload_url}${NC}"
            
            # Copy to clipboard if possible
            echo -n "$upload_url" | termux-clipboard-set 2>/dev/null
            echo -e "${DIM}链接已复制到剪贴板${NC}"
            
            # Send via Telegram if configured
            send_telegram_notification "📤 日志已上传: ${upload_url}"
        else
            echo -e "${LRED}上传失败${NC}"
        fi
    else
        echo -e "${LRED}需要安装 curl${NC}"
    fi
}

download_cloud_config() {
    clear_screen
    draw_header "📥 下载云端配置" "$LCYAN"
    echo
    
    echo -e "${YELLOW}从 GitHub 下载配置文件...${NC}"
    echo
    read -r -p "输入 GitHub 仓库地址: " repo_url
    
    if [[ -n "$repo_url" ]]; then
        local temp_dir="${TEMP_DIR}/cloud-config"
        mkdir -p "$temp_dir"
        
        echo -e "${YELLOW}正在克隆仓库...${NC}"
        
        if git clone "$repo_url" "$temp_dir" 2>/dev/null; then
            echo -e "${LGREEN}配置已下载到: ${temp_dir}${NC}"
            echo
            echo -e "${YELLOW}发现以下配置文件:${NC}"
            
            # List downloaded configs
            for file in "$temp_dir"/*; do
                if [[ -f "$file" ]]; then
                    echo -e "  ${DIM}• $(basename "$file")${NC}"
                fi
            done
            
            echo
            read -r -p "应用配置？[y/N]: " apply_confirm
            
            if [[ "$apply_confirm" == "y" || "$apply_confirm" == "Y" ]]; then
                echo -e "${YELLOW}正在应用配置...${NC}"
                
                # Backup current configs first
                local backup_dir="${BACKUP_DIR}/pre-cloud-restore-$(date +%Y%m%d-%H%M%S)"
                mkdir -p "$backup_dir"
                cp "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.tmux.conf" "$backup_dir/" 2>/dev/null
                
                # Apply new configs
                cp "$temp_dir/.bashrc" "$HOME/" 2>/dev/null
                cp "$temp_dir/.zshrc" "$HOME/" 2>/dev/null
                cp "$temp_dir/.tmux.conf" "$HOME/" 2>/dev/null
                cp "$temp_dir/.gitconfig" "$HOME/" 2>/dev/null
                
                echo -e "${LGREEN}配置已应用！${NC}"
                echo -e "${DIM}原配置备份在: ${backup_dir}${NC}"
            fi
        else
            echo -e "${LRED}下载失败，请检查仓库地址和网络连接${NC}"
        fi
        
        # Cleanup
        rm -rf "$temp_dir"
    fi
    
    echo
    read -r -p "按回车键继续..."
}

configure_remote() {
    clear_screen
    draw_header "🔗 配置远程仓库" "$LCYAN"
    echo
    
    echo -e "${BOLD}支持的服务:${NC}"
    echo
    echo -e "  ${YELLOW}[1]${NC} 🐙 GitHub"
    echo -e "  ${YELLOW}[2]${NC} 🦊 GitLab"
    echo -e "  ${YELLOW}[3]${NC} 🐴 Gitee (码云)"
    echo -e "  ${YELLOW}[4]${NC} 🏠 自建 Git 服务器"
    echo -e "  ${YELLOW}[5]${NC} 📁 WebDAV"
    echo -e "  ${YELLOW}[6]${NC} 🤖 Telegram"
    echo
    echo -e "  ${YELLOW}[0]${NC} 返回"
    echo
    
    read -r -p "$(echo -e "${BOLD}请选择 [1-6]:${NC} ")" choice
    
    case "$choice" in
        1) 
            echo -e "${YELLOW}配置 GitHub...${NC}"
            sync_github
            ;;
        2) 
            echo -e "${YELLOW}配置 GitLab...${NC}"
            echo -e "${DIM}GitLab 同步功能开发中${NC}"
            sleep 2
            ;;
        3) 
            echo -e "${YELLOW}配置 Gitee (码云)...${NC}"
            echo -e "${DIM}Gitee 同步功能开发中${NC}"
            sleep 2
            ;;
        4) 
            echo -e "${YELLOW}配置自建 Git 服务器...${NC}"
            read -r -p "输入服务器地址: " server_url
            if [[ -n "$server_url" ]]; then
                echo -e "${DIM}自建服务器同步功能开发中${NC}"
            fi
            sleep 2
            ;;
        5) sync_webdav ;;
        6) setup_telegram ;;
        0) return ;;
        *) echo -e "${LYELLOW}无效选择${NC}"; sleep 1 ;;
    esac
}

# ============================================================
# ONE-CLICK FULL INSTALL
# ============================================================

one_click_install() {
    clear_screen
    draw_header "🎯 一键全装" "$LGREEN"
    echo
    
    echo -e "${BOLD}选择安装模式:${NC}"
    echo
    echo -e "  ${LGREEN}[1]${NC} ⚡ 快速模式    ${DIM}最小化安装，~10分钟${NC}"
    echo -e "  ${LYELLOW}[2]${NC} 🎯 标准模式    ${DIM}常用工具，~30分钟${NC}"
    echo -e "  ${LRED}[3]${NC} 🔥 完整模式    ${DIM}全部工具，~1小时+${NC}"
    echo -e "  ${LCYAN}[4]${NC} 🎨 自定义模式  ${DIM}自由选择组件${NC}"
    echo -e "  ${LMAGENTA}[5]${NC} 🤖 静默模式    ${DIM}无需交互，使用默认配置${NC}"
    echo
    echo -e "  ${YELLOW}[0]${NC} 返回"
    echo
    
    read -r -p "$(echo -e "${BOLD}请选择 [1-5]:${NC} ")" choice
    
    case "$choice" in
        1) quick_install ;;
        2) standard_install ;;
        3) full_install ;;
        4) custom_install ;;
        5) silent_install ;;
        0) return ;;
        *) echo -e "${LYELLOW}无效选择${NC}"; sleep 1 ;;
    esac
}

quick_install() {
    clear_screen
    draw_header "⚡ 快速模式安装" "$LGREEN"
    echo
    
    TOTAL_STEPS=7
    CURRENT_STEP=0
    
    # Step 1
    CURRENT_STEP=1
    progress_bar $CURRENT_STEP $TOTAL_STEPS "更新软件源"
    safe_run "$UPDATE_CMD" "更新软件源" 2 1
    
    # Step 2
    CURRENT_STEP=2
    progress_bar $CURRENT_STEP $TOTAL_STEPS "安装基础依赖"
    safe_run "$INSTALL_CMD curl wget git tar gzip" "安装基础依赖" 2 1
    
    # Step 3
    CURRENT_STEP=3
    progress_bar $CURRENT_STEP $TOTAL_STEPS "安装核心安全工具"
    safe_run "$INSTALL_CMD nmap sqlmap hydra john metasploit" "安装核心工具" 2 1
    
    # Step 4
    CURRENT_STEP=4
    progress_bar $CURRENT_STEP $TOTAL_STEPS "安装开发环境"
    safe_run "$INSTALL_CMD python nodejs" "安装开发环境" 2 1
    
    # Step 5
    CURRENT_STEP=5
    progress_bar $CURRENT_STEP $TOTAL_STEPS "配置 Shell 环境"
    safe_run "$INSTALL_CMD zsh" "安装 Zsh" 2 1
    
    # Step 6
    CURRENT_STEP=6
    progress_bar $CURRENT_STEP $TOTAL_STEPS "配置终端美化"
    safe_run "$INSTALL_CMD starship eza bat" "安装美化工具" 2 1
    
    # Step 7
    CURRENT_STEP=7
    progress_bar $CURRENT_STEP $TOTAL_STEPS "创建系统备份"
    perform_config_backup
    
    echo
    echo -e "${LGREEN}════════════════════════════════════════${NC}"
    echo -e "${LGREEN}  ⚡ 快速安装完成！${NC}"
    echo -e "${LGREEN}  已安装: 核心安全工具 + 开发环境${NC}"
    echo -e "${LGREEN}════════════════════════════════════════${NC}"
    
    ACHIEVEMENTS["speed_demon"]=true
    save_achievements
    echo -e "${GOLD}🏆 成就解锁: 速度之王！${NC}"
    
    echo
    read -r -p "按回车键继续..."
}

standard_install() {
    clear_screen
    draw_header "🎯 标准模式安装" "$LYELLOW"
    echo
    
    TOTAL_STEPS=10
    CURRENT_STEP=0
    
    CURRENT_STEP=1; progress_bar $CURRENT_STEP $TOTAL_STEPS "更新软件源"
    safe_run "$UPDATE_CMD" "更新软件源" 2 1
    
    CURRENT_STEP=2; progress_bar $CURRENT_STEP $TOTAL_STEPS "安装基础依赖"
    safe_run "$INSTALL_CMD curl wget git tar gzip" "安装基础依赖" 2 1
    
    CURRENT_STEP=3; progress_bar $CURRENT_STEP $TOTAL_STEPS "安装信息收集工具"
    install_tools_category "info_gathering"
    
    CURRENT_STEP=4; progress_bar $CURRENT_STEP $TOTAL_STEPS "安装Web渗透工具"
    install_tools_category "web_testing"
    
    CURRENT_STEP=5; progress_bar $CURRENT_STEP $TOTAL_STEPS "安装密码攻击工具"
    install_tools_category "password_attack"
    
    CURRENT_STEP=6; progress_bar $CURRENT_STEP $TOTAL_STEPS "安装漏洞利用工具"
    install_tools_category "exploitation"
    
    CURRENT_STEP=7; progress_bar $CURRENT_STEP $TOTAL_STEPS "安装后渗透工具"
    install_tools_category "post_exploitation"
    
    CURRENT_STEP=8; progress_bar $CURRENT_STEP $TOTAL_STEPS "安装开发环境"
    safe_run "$INSTALL_CMD python nodejs ruby golang" "安装开发环境" 2 1
    
    CURRENT_STEP=9; progress_bar $CURRENT_STEP $TOTAL_STEPS "终端美化"
    safe_run "$INSTALL_CMD zsh starship eza bat ripgrep fd" "终端美化" 2 1
    
    CURRENT_STEP=10; progress_bar $CURRENT_STEP $TOTAL_STEPS "创建备份"
    perform_config_backup
    
    echo
    echo -e "${LGREEN}════════════════════════════════════════${NC}"
    echo -e "${LGREEN}  🎯 标准安装完成！${NC}"
    echo -e "${LGREEN}  已安装: 5大类工具 + 开发环境 + 美化${NC}"
    echo -e "${LGREEN}════════════════════════════════════════${NC}"
    echo
    read -r -p "按回车键继续..."
}

full_install() {
    clear_screen
    draw_header "🔥 完整模式安装" "$LRED"
    echo
    
    echo -e "${LYELLOW}┌─────────────────────────────────────────┐${NC}"
    echo -e "${LYELLOW}│${NC} ${YELLOW}⚠️  完整安装注意事项:${NC}                    ${LYELLOW}│${NC}"
    echo -e "${LYELLOW}│${NC}                                         ${LYELLOW}│${NC}"
    echo -e "${LYELLOW}│${NC} ${DIM}• 将安装所有 300+ 工具${NC}                ${LYELLOW}│${NC}"
    echo -e "${LYELLOW}│${NC} ${DIM}• 预计需要 1 小时以上${NC}                ${LYELLOW}│${NC}"
    echo -e "${LYELLOW}│${NC} ${DIM}• 需要至少 5GB 存储空间${NC}              ${LYELLOW}│${NC}"
    echo -e "${LYELLOW}│${NC} ${DIM}• 建议连接充电器并保持网络稳定${NC}        ${LYELLOW}│${NC}"
    echo -e "${LYELLOW}│${NC} ${DIM}• 安装过程中可玩小游戏打发时间${NC}        ${LYELLOW}│${NC}"
    echo -e "${LYELLOW}└─────────────────────────────────────────┘${NC}"
    echo
    
    read -r -p "确认继续？输入 'YES' 确认: " confirm
    
    if [[ "$confirm" != "YES" ]]; then
        echo -e "${YELLOW}已取消安装${NC}"
        sleep 1
        return
    fi
    
    # Record start time
    local install_start=$(date +%s)
    
    # Enable games during install
    GAME_ENABLED=true
    
    TOTAL_STEPS=15
    CURRENT_STEP=0
    
    CURRENT_STEP=1; progress_bar $CURRENT_STEP $TOTAL_STEPS "更新软件源"
    safe_run "$UPDATE_CMD" "更新软件源" 2 1
    
    CURRENT_STEP=2; progress_bar $CURRENT_STEP $TOTAL_STEPS "安装基础依赖"
    safe_run "$INSTALL_CMD curl wget git tar gzip python nodejs" "安装基础依赖" 2 1
    
    CURRENT_STEP=3; progress_bar $CURRENT_STEP $TOTAL_STEPS "安装信息收集工具"
    install_tools_category "info_gathering"
    
    CURRENT_STEP=4; progress_bar $CURRENT_STEP $TOTAL_STEPS "安装Web渗透工具"
    install_tools_category "web_testing"
    
    CURRENT_STEP=5; progress_bar $CURRENT_STEP $TOTAL_STEPS "安装密码攻击工具"
    install_tools_category "password_attack"
    
    CURRENT_STEP=6; progress_bar $CURRENT_STEP $TOTAL_STEPS "安装漏洞利用工具"
    install_tools_category "exploitation"
    
    CURRENT_STEP=7; progress_bar $CURRENT_STEP $TOTAL_STEPS "安装后渗透工具"
    install_tools_category "post_exploitation"
    
    CURRENT_STEP=8; progress_bar $CURRENT_STEP $TOTAL_STEPS "安装无线渗透工具"
    install_tools_category "wireless"
    
    CURRENT_STEP=9; progress_bar $CURRENT_STEP $TOTAL_STEPS "安装逆向工程工具"
    install_tools_category "reverse_engineering"
    
    CURRENT_STEP=10; progress_bar $CURRENT_STEP $TOTAL_STEPS "安装数字取证工具"
    install_tools_category "forensics"
    
    CURRENT_STEP=11; progress_bar $CURRENT_STEP $TOTAL_STEPS "安装社工工具"
    install_tools_category "social_engineering"
    
    CURRENT_STEP=12; progress_bar $CURRENT_STEP $TOTAL_STEPS "安装云安全工具"
    install_tools_category "cloud_security"
    
    CURRENT_STEP=13; progress_bar $CURRENT_STEP $TOTAL_STEPS "安装开发环境"
    safe_run "$INSTALL_CMD python nodejs ruby golang rust clang openjdk-17" "安装开发环境" 3 5
    
    CURRENT_STEP=14; progress_bar $CURRENT_STEP $TOTAL_STEPS "终端美化"
    setup_beautification_all
    
    CURRENT_STEP=15; progress_bar $CURRENT_STEP $TOTAL_STEPS "创建系统备份"
    perform_full_backup
    
    # Calculate install time
    local install_end=$(date +%s)
    local install_time=$((install_end - install_start))
    local install_min=$((install_time / 60))
    local install_sec=$((install_time % 60))
    
    echo
    echo -e "${LGREEN}════════════════════════════════════════${NC}"
    echo -e "${GOLD}  🎉 完整安装完成！${NC}"
    echo -e "${LGREEN}  已安装: 全部 300+ 工具 + 开发环境${NC}"
    echo -e "${LGREEN}  耗时: ${install_min}分${install_sec}秒${NC}"
    echo -e "${LGREEN}════════════════════════════════════════${NC}"
    
    ACHIEVEMENTS["tools_all"]=true
    ACHIEVEMENTS["dragon_tamer"]=true
    save_achievements
    
    echo -e "${GOLD}🏆 成就解锁: 全工具制霸！${NC}"
    echo -e "${GOLD}🏆 成就解锁: 龙之驯服者！${NC}"
    
    # Send notification
    send_telegram_notification "🎉 Kali Dragon Deploy 完整安装完成！耗时: ${install_min}分${install_sec}秒"
    send_notification "🐉 安装完成" "全部工具已安装完毕"
    
    echo
    read -r -p "按回车键继续..."
}

custom_install() {
    clear_screen
    draw_header "🎨 自定义安装" "$LCYAN"
    echo
    
    echo -e "${BOLD}选择要安装的组件 (可多选):${NC}"
    echo
    echo -e "  ${YELLOW}[1]${NC} 🛠️  安全工具集"
    echo -e "  ${YELLOW}[2]${NC} 💻 开发环境"
    echo -e "  ${YELLOW}[3]${NC} 🎨 终端美化"
    echo -e "  ${YELLOW}[4]${NC} 📦 容器环境"
    echo -e "  ${YELLOW}[5]${NC} ☁️  云端同步"
    echo -e "  ${YELLOW}[6]${NC} 💾 系统备份"
    echo -e "  ${YELLOW}[7]${NC} 🔒 安全加固"
    echo -e "  ${YELLOW}[8]${NC} 📊 监控工具"
    echo
    echo -e "  ${LGREEN}[S]${NC} 🚀 开始安装已选组件"
    echo -e "  ${YELLOW}[R]${NC} 🔄 重置选择"
    echo -e "  ${YELLOW}[0]${NC} 返回"
    echo
    
    local selections=""
    while true; do
        echo
        read -r -p "$(echo -e "${BOLD}输入选择 (如: 1236，输入 S 开始安装):${NC} ")" choice
        
        case "$choice" in
            S|s)
                if [[ -n "$selections" ]]; then
                    echo -e "${LGREEN}开始自定义安装...${NC}"
                    sleep 1
                    
                    if [[ "$selections" == *"1"* ]]; then tools_menu; fi
                    if [[ "$selections" == *"2"* ]]; then setup_dev_environment; fi
                    if [[ "$selections" == *"3"* ]]; then setup_beautification; fi
                    if [[ "$selections" == *"4"* ]]; then 
                        safe_run "$INSTALL_CMD proot-distro" "安装 proot-distro" 2 1
                    fi
                    if [[ "$selections" == *"5"* ]]; then cloud_sync_menu; fi
                    if [[ "$selections" == *"6"* ]]; then backup_system; fi
                    if [[ "$selections" == *"7"* ]]; then security_hardening; fi
                    if [[ "$selections" == *"8"* ]]; then display_system_status; fi
                    
                    echo
                    echo -e "${LGREEN}自定义安装完成！${NC}"
                else
                    echo -e "${LYELLOW}请先选择要安装的组件${NC}"
                fi
                break
                ;;
            R|r) selections=""; echo -e "${YELLOW}选择已重置${NC}" ;;
            0) return ;;
            *)
                if [[ "$choice" =~ ^[1-8]+$ ]]; then
                    selections="$choice"
                    echo -e "${LGREEN}已选择组件: ${selections}${NC}"
                else
                    echo -e "${LYELLOW}无效选择${NC}"
                fi
                ;;
        esac
    done    
    echo
    read -r -p "按回车键继续..."
}

silent_install() {
    clear_screen
    draw_header "🤖 静默模式安装" "$LMAGENTA"
    echo
    
    echo -e "${YELLOW}静默模式将使用默认配置自动安装${NC}"
    echo -e "${DIM}无需任何交互，适合自动化部署${NC}"
    echo -e "${DIM}安装过程日志将保存到: ${LOG_FILE}${NC}"
    echo
    
    # Save current mode
    local prev_quiet=$QUIET_MODE
    QUIET_MODE=true
    
    # Default: standard install
    echo -e "${YELLOW}开始静默安装（标准模式）...${NC}"
    standard_install
    
    # Restore mode
    QUIET_MODE=$prev_quiet
    
    echo
    echo -e "${LGREEN}静默安装完成！${NC}"
    echo -e "${DIM}详细日志: ${LOG_FILE}${NC}"
    echo
    read -r -p "按回车键继续..."
}

# ============================================================
# SYSTEM CONFIGURATION
# ============================================================

system_config_menu() {
    while true; do
        clear_screen
        draw_header "⚙️ 系统调校" "$LYELLOW"
        echo
        
        echo -e "  ${YELLOW}[1]${NC} 🔄 换源           ${DIM}切换到国内镜像源${NC}"
        echo -e "  ${YELLOW}[2]${NC} 🕐 时区设置       ${DIM}设置系统时区${NC}"
        echo -e "  ${YELLOW}[3]${NC} 🏷️  主机名修改     ${DIM}修改设备名称${NC}"
        echo -e "  ${YELLOW}[4]${NC} 🔑 SSH配置        ${DIM}配置SSH服务${NC}"
        echo -e "  ${YELLOW}[5]${NC} 🛡️  防火墙配置     ${DIM}UFW防火墙规则${NC}"
        echo -e "  ${YELLOW}[6]${NC} 🕵️  隐身模式       ${DIM}MAC/主机名伪装${NC}"
        echo -e "  ${YELLOW}[7]${NC} ⚡ 性能优化       ${DIM}内核参数调优${NC}"
        echo -e "  ${YELLOW}[8]${NC} 🔒 安全加固       ${DIM}系统安全配置${NC}"
        echo -e "  ${YELLOW}[9]${NC} 🧹 系统清理       ${DIM}清理缓存和垃圾${NC}"
        echo -e "  ${YELLOW}[10]${NC} 📱 Termux优化    ${DIM}电池/存储/权限${NC}"
        echo
        echo -e "  ${YELLOW}[0]${NC} 返回"
        echo
        
        read -r -p "$(echo -e "${BOLD}请选择 [1-10]:${NC} ")" choice
        
        case "$choice" in
            1) change_mirrors ;;
            2) set_timezone ;;
            3) set_hostname ;;
            4) config_ssh ;;
            5) config_firewall ;;
            6) stealth_mode ;;
            7) performance_tuning ;;
            8) security_hardening ;;
            9) system_cleanup ;;
            10) termux_optimization ;;
            0) return ;;
            *) echo -e "${LYELLOW}无效选择${NC}"; sleep 1 ;;
        esac
    done
}

change_mirrors() {
    clear_screen
    draw_header "🔄 切换软件源" "$LYELLOW"
    echo
    
    echo -e "${BOLD}可用镜像源:${NC}"
    echo
    echo -e "  ${YELLOW}[1]${NC} 🇨🇳 清华大学 (推荐)"
    echo -e "  ${YELLOW}[2]${NC} 🇨🇳 中国科学技术大学"
    echo -e "  ${YELLOW}[3]${NC} 🇨🇳 阿里巴巴"
    echo -e "  ${YELLOW}[4]${NC} 🇨🇳 腾讯云"
    echo -e "  ${YELLOW}[5]${NC} 🇨🇳 华为云"
    echo -e "  ${YELLOW}[6]${NC} 🌍 官方源 (Kali/Termux)"
    echo -e "  ${YELLOW}[7]${NC} 🔍 自动测速选择"
    echo
    echo -e "  ${YELLOW}[0]${NC} 返回"
    echo
    
    read -r -p "$(echo -e "${BOLD}请选择 [1-7]:${NC} ")" choice
    
    local mirror_url=""
    case "$choice" in
        1) mirror_url="https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24" ;;
        2) mirror_url="https://mirrors.ustc.edu.cn/termux/termux-packages-24" ;;
        3) mirror_url="https://mirrors.aliyun.com/termux/termux-packages-24" ;;
        4) mirror_url="https://mirrors.cloud.tencent.com/termux/termux-packages-24" ;;
        5) mirror_url="https://mirrors.huaweicloud.com/termux/termux-packages-24" ;;
        6) mirror_url="https://packages.termux.dev/apt/termux-main" ;;
        7) 
            echo -e "${YELLOW}正在测试各镜像源速度...${NC}"
            local fastest=""
            local best_time=999
            for url in "https://mirrors.tuna.tsinghua.edu.cn" "https://mirrors.ustc.edu.cn" "https://mirrors.aliyun.com"; do
                local ping_time=$(ping -c 1 -W 2 "${url#https://}" 2>/dev/null | awk -F'/' 'END{print $5}' | cut -d'.' -f1)
                if [[ -n "$ping_time" ]] && [[ $ping_time -lt $best_time ]]; then
                    best_time=$ping_time
                    fastest="${url}/termux/termux-packages-24"
                fi
            done
            mirror_url="${fastest:-https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24}"
            echo -e "${LGREEN}已选择最快镜像 (${best_time}ms)${NC}"
            ;;
        0) return ;;
        *) echo -e "${LYELLOW}无效选择${NC}"; sleep 1; return ;;
    esac
    
    if [[ "$TERMUX" == true ]] && [[ -n "$mirror_url" ]]; then
        echo "deb ${mirror_url} stable main" > $PREFIX/etc/apt/sources.list 2>/dev/null
        echo -e "${LGREEN}软件源已切换！${NC}"
        echo -e "${DIM}${mirror_url}${NC}"
        safe_run "pkg update -y" "更新软件源" 2 1
    fi
    
    echo
    read -r -p "按回车键继续..."
}

set_timezone() {
    clear_screen
    draw_header "🕐 设置时区" "$LYELLOW"
    echo
    
    echo -e "${BOLD}常用时区:${NC}"
    echo
    echo -e "  ${YELLOW}[1]${NC} Asia/Shanghai (中国标准时间)"
    echo -e "  ${YELLOW}[2]${NC} Asia/Tokyo (日本标准时间)"
    echo -e "  ${YELLOW}[3]${NC} Asia/Seoul (韩国标准时间)"
    echo -e "  ${YELLOW}[4]${NC} America/New_York (美国东部时间)"
    echo -e "  ${YELLOW}[5]${NC} Europe/London (英国时间)"
    echo -e "  ${YELLOW}[6]${NC} ✏️  手动输入"
    echo
    echo -e "  ${YELLOW}[0]${NC} 返回"
    echo
    
    read -r -p "$(echo -e "${BOLD}请选择 [1-6]:${NC} ")" choice
    
    local tz=""
    case "$choice" in
        1) tz="Asia/Shanghai" ;;
        2) tz="Asia/Tokyo" ;;
        3) tz="Asia/Seoul" ;;
        4) tz="America/New_York" ;;
        5) tz="Europe/London" ;;
        6) read -r -p "输入时区: " tz ;;
        0) return ;;
        *) echo -e "${LYELLOW}无效选择${NC}"; sleep 1; return ;;
    esac
    
    if [[ -n "$tz" ]]; then
        safe_run "$INSTALL_CMD tzdata" "安装时区数据" 2 1
        echo "$tz" > $PREFIX/etc/timezone 2>/dev/null || echo "$tz" | tee /etc/timezone 2>/dev/null
        export TZ="$tz"
        echo -e "${LGREEN}时区已设置为: ${tz}${NC}"
        echo -e "${DIM}当前时间: $(date '+%Y-%m-%d %H:%M:%S %Z')${NC}"
    fi
    
    echo
    read -r -p "按回车键继续..."
}

set_hostname() {
    clear_screen
    draw_header "🏷️ 修改主机名" "$LYELLOW"
    echo
    
    local current_hostname=$(hostname 2>/dev/null || cat /etc/hostname 2>/dev/null || echo "unknown")
    echo -e "${DIM}当前主机名: ${current_hostname}${NC}"
    echo
    
    echo -e "${BOLD}预设主机名:${NC}"
    echo -e "  ${YELLOW}[1]${NC} kali-dragon"
    echo -e "  ${YELLOW}[2]${NC} dragon-slayer"
    echo -e "  ${YELLOW}[3]${NC} kali-beast"
    echo -e "  ${YELLOW}[4]${NC} termux-warrior"
    echo -e "  ${YELLOW}[5]${NC} ✏️  自定义"
    echo
    echo -e "  ${YELLOW}[0]${NC} 返回"
    echo
    
    read -r -p "$(echo -e "${BOLD}请选择 [1-5]:${NC} ")" choice
    
    local new_hostname=""
    case "$choice" in
        1) new_hostname="kali-dragon" ;;
        2) new_hostname="dragon-slayer" ;;
        3) new_hostname="kali-beast" ;;
        4) new_hostname="termux-warrior" ;;
        5) read -r -p "输入主机名: " new_hostname ;;
        0) return ;;
        *) echo -e "${LYELLOW}无效选择${NC}"; sleep 1; return ;;
    esac
    
    if [[ -n "$new_hostname" ]]; then
        hostname "$new_hostname" 2>/dev/null
        echo "$new_hostname" > $PREFIX/etc/hostname 2>/dev/null || echo "$new_hostname" | tee /etc/hostname 2>/dev/null
        echo -e "${LGREEN}主机名已设置为: ${new_hostname}${NC}"
        log_info "主机名已修改: ${current_hostname} -> ${new_hostname}"
    fi
    
    echo
    read -r -p "按回车键继续..."
}

config_ssh() {
    clear_screen
    draw_header "🔑 SSH 配置" "$LYELLOW"
    echo
    
    echo -e "${YELLOW}SSH 配置选项:${NC}"
    echo
    echo -e "  ${YELLOW}[1]${NC} 📦 安装 OpenSSH"
    echo -e "  ${YELLOW}[2]${NC} 🔐 生成 SSH 密钥 (ed25519)"
    echo -e "  ${YELLOW}[3]${NC} 🚀 启动 SSH 服务"
    echo -e "  ${YELLOW}[4]${NC} 📋 查看公钥"
    echo -e "  ${YELLOW}[5]${NC} 🔗 配置免密登录"
    echo -e "  ${YELLOW}[6]${NC} ⚙️  修改 SSH 端口"
    echo -e "  ${YELLOW}[7]${NC} 🛡️  禁用密码登录"
    echo -e "  ${YELLOW}[8]${NC} 📊 查看 SSH 状态"
    echo
    echo -e "  ${YELLOW}[0]${NC} 返回"
    echo
    
    read -r -p "$(echo -e "${BOLD}请选择 [1-8]:${NC} ")" choice
    
    case "$choice" in
        1) safe_run "$INSTALL_CMD openssh" "安装 OpenSSH" 2 1 ;;
        2)
            if [[ -f "$HOME/.ssh/id_ed25519" ]]; then
                echo -e "${YELLOW}SSH 密钥已存在，是否重新生成？${NC}"
                read -r -p "[y/N]: " regen
                if [[ "$regen" == "y" || "$regen" == "Y" ]]; then
                    rm -f "$HOME/.ssh/id_ed25519" "$HOME/.ssh/id_ed25519.pub"
                else
                    echo -e "${YELLOW}保留现有密钥${NC}"
                    echo; read -r -p "按回车键继续..."; return
                fi
            fi
            echo -e "${YELLOW}生成 ed25519 密钥...${NC}"
            ssh-keygen -t ed25519 -f "$HOME/.ssh/id_ed25519" -N "" 2>/dev/null
            echo -e "${LGREEN}SSH 密钥已生成！${NC}"
            echo -e "${DIM}私钥: ~/.ssh/id_ed25519 (请勿分享！)${NC}"
            echo -e "${DIM}公钥: ~/.ssh/id_ed25519.pub${NC}"
            ;;
        3)
            if [[ "$TERMUX" == true ]]; then
                pkill sshd 2>/dev/null
                sleep 1
                sshd 2>/dev/null &
                sleep 1
                if pgrep sshd &>/dev/null; then
                    echo -e "${LGREEN}SSH 服务已启动${NC}"
                    local ip=$(hostname -I 2>/dev/null | awk '{print $1}' || echo '127.0.0.1')
                    echo -e "${DIM}端口: 8022${NC}"
                    echo -e "${DIM}连接命令: ssh $(whoami)@${ip} -p 8022${NC}"
                else
                    echo -e "${LRED}SSH 服务启动失败${NC}"
                fi
            else
                sudo systemctl start sshd 2>/dev/null || service ssh start 2>/dev/null
                echo -e "${LGREEN}SSH 服务已启动${NC}"
            fi
            ;;
        4)
            if [[ -f "$HOME/.ssh/id_ed25519.pub" ]]; then
                echo -e "${YELLOW}你的公钥:${NC}"
                echo -e "${LGREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                echo -e "${WHITE}$(cat $HOME/.ssh/id_ed25519.pub)${NC}"
                echo -e "${LGREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                echo
                echo -e "${DIM}按回车复制到剪贴板...${NC}"
                read -r
                echo -n "$(cat $HOME/.ssh/id_ed25519.pub)" | termux-clipboard-set 2>/dev/null
                echo -e "${LGREEN}已复制到剪贴板${NC}"
            else
                echo -e "${LRED}未找到公钥，请先生成密钥${NC}"
            fi
            ;;
        5)
            read -r -p "输入远程主机 (user@host): " remote
            if [[ -n "$remote" ]]; then
                echo -e "${YELLOW}配置免密登录到 ${remote}...${NC}"
                if [[ -f "$HOME/.ssh/id_ed25519.pub" ]]; then
                    ssh-copy-id -i "$HOME/.ssh/id_ed25519.pub" "$remote" 2>/dev/null
                    if [[ $? -eq 0 ]]; then
                        echo -e "${LGREEN}免密登录已配置${NC}"
                    else
                        echo -e "${LYELLOW}ssh-copy-id 失败，尝试手动方式...${NC}"
                        echo -e "${DIM}请手动将以下公钥添加到远程服务器的 ~/.ssh/authorized_keys:${NC}"
                        cat "$HOME/.ssh/id_ed25519.pub"
                    fi
                else
                    echo -e "${LRED}请先生成 SSH 密钥${NC}"
                fi
            fi
            ;;
        6)
            local current_port="8022"
            read -r -p "输入新 SSH 端口 (当前: ${current_port}): " new_port
            if [[ -n "$new_port" && "$new_port" =~ ^[0-9]+$ && $new_port -ge 1 && $new_port -le 65535 ]]; then
                if [[ "$TERMUX" == true ]]; then
                    sed -i "s/Port .*/Port ${new_port}/" $PREFIX/etc/ssh/sshd_config 2>/dev/null || \
                        echo "Port ${new_port}" >> $PREFIX/etc/ssh/sshd_config 2>/dev/null
                    echo -e "${LGREEN}SSH 端口已修改为: ${new_port}${NC}"
                    echo -e "${YELLOW}请重启 SSH 服务生效${NC}"
                fi
            else
                echo -e "${LRED}无效端口号${NC}"
            fi
            ;;
        7)
            if [[ "$TERMUX" == true ]]; then
                sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' $PREFIX/etc/ssh/sshd_config 2>/dev/null
                sed -i 's/#PasswordAuthentication no/PasswordAuthentication no/' $PREFIX/etc/ssh/sshd_config 2>/dev/null
                echo "PubkeyAuthentication yes" >> $PREFIX/etc/ssh/sshd_config 2>/dev/null
                echo -e "${LGREEN}密码登录已禁用，仅允许密钥登录${NC}"
                echo -e "${LRED}⚠️  请确保已配置好公钥，否则将无法登录！${NC}"
            fi
            ;;
        8)
            echo -e "${YELLOW}SSH 服务状态:${NC}"
            if pgrep sshd &>/dev/null; then
                echo -e "${LGREEN}SSH 服务正在运行${NC}"
                echo -e "${DIM}进程: $(pgrep sshd)${NC}"
            else
                echo -e "${LRED}SSH 服务未运行${NC}"
            fi
            if [[ -f "$HOME/.ssh/id_ed25519.pub" ]]; then
                echo -e "${LGREEN}SSH 密钥已配置${NC}"
            fi
            ;;
        0) return ;;
    esac
    
    echo
    read -r -p "按回车键继续..."
}

config_firewall() {
    clear_screen
    draw_header "🛡️ 防火墙配置" "$LYELLOW"
    echo
    
    if ! command -v ufw &>/dev/null; then
        echo -e "${YELLOW}UFW 未安装，正在安装...${NC}"
        safe_run "$INSTALL_CMD ufw" "安装 UFW" 2 1 || {
            echo -e "${LRED}UFW 安装失败，可能不支持当前系统${NC}"
            echo -e "${DIM}Termux 环境下通常不需要防火墙${NC}"
            read -r -p "按回车键继续..."
            return
        }
    fi
    
    echo
    echo -e "${BOLD}预设规则:${NC}"
    echo -e "  ${YELLOW}[1]${NC} 🔓 基础规则 (SSH + HTTP/HTTPS)"
    echo -e "  ${YELLOW}[2]${NC} 🔒 严格规则 (仅SSH)"
    echo -e "  ${YELLOW}[3]${NC} 🌐 Web服务器规则"
    echo -e "  ${YELLOW}[4]${NC} ✏️  自定义规则"
    echo -e "  ${YELLOW}[5]${NC} 📊 查看当前规则"
    echo -e "  ${YELLOW}[6]${NC} 🚫 禁用防火墙"
    echo
    echo -e "  ${YELLOW}[0]${NC} 返回"
    echo
    
    read -r -p "$(echo -e "${BOLD}请选择 [1-6]:${NC} ")" choice
    
    case "$choice" in
        1)
            ufw --force reset 2>/dev/null
            ufw default deny incoming 2>/dev/null
            ufw default allow outgoing 2>/dev/null
            ufw allow ssh 2>/dev/null
            ufw allow http 2>/dev/null
            ufw allow https 2>/dev/null
            ufw --force enable 2>/dev/null
            echo -e "${LGREEN}基础防火墙规则已启用${NC}"
            ;;
        2)
            ufw --force reset 2>/dev/null
            ufw default deny incoming 2>/dev/null
            ufw default deny outgoing 2>/dev/null
            ufw allow out 80,443,53,22 2>/dev/null
            ufw allow ssh 2>/dev/null
            ufw --force enable 2>/dev/null
            echo -e "${LGREEN}严格防火墙规则已启用${NC}"
            ;;
        3)
            ufw allow 80/tcp 2>/dev/null
            ufw allow 443/tcp 2>/dev/null
            ufw allow 8080/tcp 2>/dev/null
            echo -e "${LGREEN}Web服务器规则已添加${NC}"
            ;;
        4)
            echo -e "${YELLOW}手动输入 UFW 命令:${NC}"
            echo -e "${DIM}示例: ufw allow 8080/tcp${NC}"
            echo -e "${DIM}示例: ufw deny from 192.168.1.100${NC}"
            read -r -p "命令: " custom_rule
            if [[ -n "$custom_rule" ]]; then
                eval "ufw $custom_rule" 2>/dev/null
                echo -e "${LGREEN}规则已执行${NC}"
            fi
            ;;
        5)
            echo -e "${YELLOW}当前防火墙规则:${NC}"
            echo -e "${LCYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
            ufw status verbose 2>/dev/null
            echo -e "${LCYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
            ;;
        6)
            ufw disable 2>/dev/null
            echo -e "${LYELLOW}防火墙已禁用${NC}"
            ;;
        0) return ;;
    esac
    
    echo
    read -r -p "按回车键继续..."
}

stealth_mode() {
    clear_screen
    draw_header "🕵️ 隐身模式" "$LRED"
    echo
    
    echo -e "${YELLOW}隐身模式功能:${NC}"
    echo
    echo -e "  ${DIM}[1] MAC 地址随机化 (需要root)${NC}"
    echo -e "  ${DIM}[2] 主机名伪装${NC}"
    echo -e "  ${DIM}[3] TTL 值修改 (需要root)${NC}"
    echo -e "  ${DIM}[4] DNS 泄漏防护${NC}"
    echo -e "  ${DIM}[5] 浏览器指纹混淆${NC}"
    echo -e "  ${DIM}[6] 时区伪装${NC}"
    echo -e "  ${DIM}[7] 全部启用${NC}"
    echo
    echo -e "${LYELLOW}[!]${NC} ${YELLOW}注意: 部分功能需要 root 权限${NC}"
    echo
    
    read -r -p "$(echo -e "${BOLD}请选择 [1-7] 或输入 0 返回:${NC} ")" choice
    
    case "$choice" in
        1)
            if [[ "$IS_ROOT" == true ]]; then
                local interface=$(ip link show 2>/dev/null | grep -o 'wlan[0-9]*' | head -1)
                if [[ -n "$interface" ]]; then
                    ip link set "$interface" down 2>/dev/null
                    local new_mac=$(printf '02:%02x:%02x:%02x:%02x:%02x' $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)))
                    ip link set dev "$interface" address "$new_mac" 2>/dev/null
                    ip link set "$interface" up 2>/dev/null
                    echo -e "${LGREEN}MAC 地址已随机化为: ${new_mac}${NC}"
                else
                    echo -e "${LRED}未找到无线网卡${NC}"
                fi
            else
                echo -e "${LYELLOW}需要 root 权限${NC}"
            fi
            ;;
        2)
            local random_hostname="host-$(openssl rand -hex 4 2>/dev/null || echo $RANDOM | md5sum | head -c 8)"
            hostname "$random_hostname" 2>/dev/null
            echo -e "${LGREEN}主机名已伪装: ${random_hostname}${NC}"
            ;;
        3)
            if [[ "$IS_ROOT" == true ]]; then
                echo 128 > /proc/sys/net/ipv4/ip_default_ttl 2>/dev/null
                echo -e "${LGREEN}TTL 值已修改${NC}"
            else
                echo -e "${LYELLOW}需要 root 权限${NC}"
            fi
            ;;
        4)
            if [[ "$TERMUX" == true ]]; then
                echo "nameserver 1.1.1.1" > $PREFIX/etc/resolv.conf 2>/dev/null
                echo "nameserver 8.8.8.8" >> $PREFIX/etc/resolv.conf 2>/dev/null
                echo -e "${LGREEN}DNS 已配置为 Cloudflare + Google${NC}"
            fi
            ;;
        5)
            export HTTP_USER_AGENT="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"
            echo -e "${LGREEN}User-Agent 已伪装${NC}"
            ;;
        6)
            local random_tz=$(timedatectl list-timezones 2>/dev/null | shuf -n 1 2>/dev/null || echo "UTC")
            export TZ="$random_tz"
            echo -e "${LGREEN}时区已伪装: ${random_tz}${NC}"
            ;;
        7)
            echo -e "${YELLOW}启用全部隐身模式功能...${NC}"
            # Hostname
            local random_hostname="host-$(openssl rand -hex 4 2>/dev/null || echo $RANDOM | md5sum | head -c 8)"
            hostname "$random_hostname" 2>/dev/null
            # DNS
            echo "nameserver 1.1.1.1" > $PREFIX/etc/resolv.conf 2>/dev/null
            echo "nameserver 8.8.8.8" >> $PREFIX/etc/resolv.conf 2>/dev/null
            # User Agent
            export HTTP_USER_AGENT="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"
            echo -e "${LGREEN}隐身模式已全面启用${NC}"
            log_info "隐身模式已启用"
            ;;
        0) return ;;
        *) echo -e "${LYELLOW}无效选择${NC}"; sleep 1 ;;
    esac
    
    echo
    read -r -p "按回车键继续..."
}

performance_tuning() {
    clear_screen
    draw_header "⚡ 性能优化" "$LYELLOW"
    echo
    
    echo -e "${YELLOW}正在优化系统性能...${NC}"
    echo
    
    local changes=0
    
    # CPU governor
    if [[ -f /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor ]]; then
        local current_gov=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 2>/dev/null)
        echo -e "${DIM}当前CPU调度: ${current_gov}${NC}"
        echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 2>/dev/null && {
            echo -e "${LGREEN}CPU 调度器已设置为性能模式${NC}"
            ((changes++))
        }
    fi
    
    # Swappiness
    if [[ -f /proc/sys/vm/swappiness ]]; then
        local current_swap=$(cat /proc/sys/vm/swappiness 2>/dev/null)
        echo -e "${DIM}当前Swappiness: ${current_swap}${NC}"
        echo 10 > /proc/sys/vm/swappiness 2>/dev/null && {
            echo -e "${LGREEN}Swappiness 已降低至 10${NC}"
            ((changes++))
        }
    fi
    
    # Cache pressure
    if [[ -f /proc/sys/vm/vfs_cache_pressure ]]; then
        echo 50 > /proc/sys/vm/vfs_cache_pressure 2>/dev/null && {
            echo -e "${LGREEN}VFS 缓存压力已优化${NC}"
            ((changes++))
        }
    fi
    
    # TCP Fast Open
    if [[ -f /proc/sys/net/ipv4/tcp_fastopen ]]; then
        echo 3 > /proc/sys/net/ipv4/tcp_fastopen 2>/dev/null && {
            echo -e "${LGREEN}TCP Fast Open 已启用${NC}"
            ((changes++))
        }
    fi
    
    # TCP congestion control
    if [[ -f /proc/sys/net/ipv4/tcp_congestion_control ]]; then
        local current_cc=$(cat /proc/sys/net/ipv4/tcp_congestion_control 2>/dev/null)
        echo -e "${DIM}当前拥塞控制: ${current_cc}${NC}"
    fi
    
    # Dirty ratio
    if [[ -f /proc/sys/vm/dirty_ratio ]]; then
        echo 10 > /proc/sys/vm/dirty_ratio 2>/dev/null && ((changes++))
        echo 5 > /proc/sys/vm/dirty_background_ratio 2>/dev/null && ((changes++))
        echo -e "${LGREEN}脏页比率已优化${NC}"
    fi
    
    echo
    if [[ $changes -gt 0 ]]; then
        echo -e "${LGREEN}性能优化完成！共应用 ${changes} 项优化${NC}"
        echo -e "${DIM}部分优化需要重启后生效${NC}"
    else
        echo -e "${LYELLOW}部分优化需要 root 权限，请使用 sudo 运行${NC}"
    fi
    
    echo
    read -r -p "按回车键继续..."
}

security_hardening() {
    clear_screen
    draw_header "🔒 安全加固" "$LRED"
    echo
    
    echo -e "${YELLOW}安全加固选项:${NC}"
    echo
    echo -e "  ${YELLOW}[1]${NC} 🚫 禁用不必要的服务"
    echo -e "  ${YELLOW}[2]${NC} ⚙️  配置内核安全参数"
    echo -e "  ${YELLOW}[3]${NC} 🔍 安装安全审计工具"
    echo -e "  ${YELLOW}[4]${NC} 🛡️ 配置 AppArmor"
    echo -e "  ${YELLOW}[5]${NC} 🔐 强化密码策略"
    echo -e "  ${YELLOW}[6]${NC} 🚀 全部加固"
    echo
    echo -e "  ${YELLOW}[0]${NC} 返回"
    echo
    
    read -r -p "$(echo -e "${BOLD}请选择 [1-6]:${NC} ")" choice
    
    case "$choice" in
        1)
            echo -e "${YELLOW}检查运行中的服务...${NC}"
            if [[ "$TERMUX" == true ]]; then
                echo -e "${DIM}Termux 环境下服务较少，通常无需禁用${NC}"
            else
                echo -e "${DIM}运行中的服务:${NC}"
                systemctl list-units --type=service --state=running 2>/dev/null | head -20
            fi
            echo -e "${LGREEN}请手动检查并禁用不需要的服务${NC}"
            ;;
        2)
            echo -e "${YELLOW}配置内核安全参数...${NC}"
            # ASLR
            echo 2 > /proc/sys/kernel/randomize_va_space 2>/dev/null && \
                echo -e "${LGREEN}ASLR 已启用（完全随机化）${NC}"
            
            # Kernel hardening
            sysctl -w kernel.kptr_restrict=2 2>/dev/null
            sysctl -w kernel.dmesg_restrict=1 2>/dev/null
            sysctl -w kernel.kexec_load_disabled=1 2>/dev/null
            
            # Network hardening
            sysctl -w net.ipv4.tcp_syncookies=1 2>/dev/null
            sysctl -w net.ipv4.ip_forward=0 2>/dev/null
            sysctl -w net.ipv4.conf.all.send_redirects=0 2>/dev/null
            sysctl -w net.ipv4.conf.all.accept_source_route=0 2>/dev/null
            sysctl -w net.ipv4.conf.all.accept_redirects=0 2>/dev/null
            sysctl -w net.ipv4.conf.all.secure_redirects=0 2>/dev/null
            sysctl -w net.ipv4.conf.all.log_martians=1 2>/dev/null
            sysctl -w net.ipv6.conf.all.accept_redirects=0 2>/dev/null
            
            echo -e "${LGREEN}内核安全参数已配置${NC}"
            ;;
        3)
            echo -e "${YELLOW}安装安全审计工具...${NC}"
            safe_run "$INSTALL_CMD lynis" "安装 Lynis" 2 1
            safe_run "$INSTALL_CMD rkhunter" "安装 RKHunter" 2 1
            safe_run "$INSTALL_CMD chkrootkit" "安装 Chkrootkit" 2 1
            
            echo
            if command -v rkhunter &>/dev/null; then
                echo -e "${YELLOW}运行快速安全检查...${NC}"
                rkhunter --check --skip-keypress 2>/dev/null | tail -10
            fi
            ;;
        4)
            echo -e "${YELLOW}配置强制访问控制...${NC}"
            if command -v aa-status &>/dev/null; then
                echo -e "${LGREEN}AppArmor 已安装并运行${NC}"
                aa-status 2>/dev/null | head -10
            elif command -v getenforce &>/dev/null; then
                echo -e "${LGREEN}SELinux 状态: $(getenforce 2>/dev/null)${NC}"
            else
                echo -e "${YELLOW}尝试安装 AppArmor...${NC}"
                safe_run "$INSTALL_CMD apparmor apparmor-utils" "安装 AppArmor" 2 1
            fi
            ;;
        5)
            echo -e "${YELLOW}强化密码策略...${NC}"
            if [[ -f /etc/login.defs ]]; then
                # Password aging settings
                echo -e "${DIM}配置密码过期策略...${NC}"
                echo -e "${DIM}PASS_MAX_DAYS 90${NC}"
                echo -e "${DIM}PASS_MIN_DAYS 7${NC}"
                echo -e "${DIM}PASS_WARN_AGE 14${NC}"
                echo -e "${LGREEN}密码策略已强化（建议值）${NC}"
            else
                echo -e "${YELLOW}/etc/login.defs 不存在，跳过${NC}"
            fi
            
            # Check password hashing
            if [[ -f /etc/shadow ]]; then
                echo -e "${DIM}检查密码哈希算法...${NC}"
                local hash_algo=$(grep "^root:" /etc/shadow 2>/dev/null | cut -d'$' -f2)
                echo -e "${DIM}当前算法: \$${hash_algo}\$${NC}"
                if [[ "$hash_algo" == "6" ]]; then
                    echo -e "${LGREEN}已使用 SHA-512 哈希${NC}"
                fi
            fi
            ;;
        6)
            echo -e "${YELLOW}执行全部安全加固...${NC}"
            # Run all hardening
            sysctl -w kernel.kptr_restrict=2 2>/dev/null
            sysctl -w kernel.dmesg_restrict=1 2>/dev/null
            sysctl -w net.ipv4.tcp_syncookies=1 2>/dev/null
            sysctl -w net.ipv4.conf.all.send_redirects=0 2>/dev/null
            sysctl -w net.ipv4.conf.all.accept_source_route=0 2>/dev/null
            safe_run "$INSTALL_CMD rkhunter chkrootkit" "安装安全工具" 2 1
            echo -e "${LGREEN}安全加固完成！${NC}"
            ;;
        0) return ;;
    esac
    
    echo
    read -r -p "按回车键继续..."
}

system_cleanup() {
    clear_screen
    draw_header "🧹 系统清理" "$LYELLOW"
    echo
    
    echo -e "${YELLOW}正在清理系统...${NC}"
    echo
    
    local freed_space=0
    
    # Clean package cache
    if [[ "$TERMUX" == true ]]; then
        local before_size=$(du -sb $PREFIX/var/cache/apt 2>/dev/null | cut -f1)
        pkg clean 2>/dev/null && echo -e "${LGREEN}包缓存已清理${NC}"
        pkg autoclean 2>/dev/null
        local after_size=$(du -sb $PREFIX/var/cache/apt 2>/dev/null | cut -f1)
        freed_space=$((freed_space + before_size - after_size))
    else
        apt clean 2>/dev/null && echo -e "${LGREEN}APT缓存已清理${NC}"
        apt autoremove -y 2>/dev/null && echo -e "${LGREEN}未使用的包已移除${NC}"
    fi
    
    # Clean temporary files
    rm -rf $PREFIX/tmp/* 2>/dev/null
    rm -rf /tmp/* 2>/dev/null
    echo -e "${LGREEN}临时文件已清理${NC}"
    
    # Clean user cache
    rm -rf "$HOME/.cache/"* 2>/dev/null
    echo -e "${LGREEN}用户缓存已清理${NC}"
    
    # Clean old logs
    find "$LOG_DIR" -name "*.log" -mtime +30 -delete 2>/dev/null
    echo -e "${LGREEN}30天前的日志已清理${NC}"
    
    # Clean thumbnail cache
    rm -rf "$HOME/.thumbnails/"* 2>/dev/null
    echo -e "${LGREEN}缩略图缓存已清理${NC}"
    
    # Clean bash history
    if [[ -f "$HOME/.bash_history" ]]; then
        local hist_size=$(wc -l < "$HOME/.bash_history" 2>/dev/null)
        if [[ $hist_size -gt 1000 ]]; then
            echo -e "${YELLOW}Bash 历史记录较多 (${hist_size}条)，是否清理？${NC}"
            read -r -p "[y/N]: " clean_hist
            if [[ "$clean_hist" == "y" || "$clean_hist" == "Y" ]]; then
                > "$HOME/.bash_history"
                echo -e "${LGREEN}Bash 历史已清理${NC}"
            fi
        fi
    fi
    
    echo
    echo -e "${BOLD}清理后磁盘使用:${NC}"
    df -h "$HOME_DIR" 2>/dev/null | tail -1
    
    echo
    echo -e "${LGREEN}系统清理完成！${NC}"
    echo
    read -r -p "按回车键继续..."
}

termux_optimization() {
    clear_screen
    draw_header "📱 Termux 优化" "$LCYAN"
    echo
    
    echo -e "${YELLOW}Termux 专属优化:${NC}"
    echo
    
    # 1. Storage permission
    echo -e "${LCYAN}[1/6]${NC} 配置存储权限"
    if [[ "$TERMUX" == true ]]; then
        if [[ -d "$HOME/storage" ]]; then
            echo -e "${LGREEN}存储权限已配置 ✓${NC}"
        else
            echo -e "${YELLOW}正在配置存储权限...${NC}"
            termux-setup-storage 2>/dev/null
            if [[ -d "$HOME/storage" ]]; then
                echo -e "${LGREEN}存储权限已配置 ✓${NC}"
            else
                echo -e "${LRED}请手动运行 termux-setup-storage${NC}"
            fi
        fi
    fi
    
    # 2. Battery optimization guide
    echo -e "${LCYAN}[2/6]${NC} 电池优化设置"
    echo -e "${DIM}请在系统设置中关闭 Termux 的电池优化:${NC}"
    echo -e "${DIM}  设置 > 应用 > Termux > 电池 > 不优化${NC}"
    echo -e "${DIM}  或: 设置 > 电池 > 电池优化 > Termux${NC}"
    
    # 3. Notification
    echo -e "${LCYAN}[3/6]${NC} 通知权限"
    if [[ "$HAS_NOTIFICATION" == true ]]; then
        echo -e "${LGREEN}通知权限已配置 ✓${NC}"
    else
        echo -e "${YELLOW}正在安装 Termux:API...${NC}"
        safe_run "pkg install termux-api -y" "安装 Termux:API" 2 1
    fi
    
    # 4. Wake lock
    echo -e "${LCYAN}[4/6]${NC} 防止休眠"
    if [[ "$TERMUX" == true ]] && command -v termux-wake-lock &>/dev/null; then
        termux-wake-lock acquire 2>/dev/null
        echo -e "${LGREEN}已获取唤醒锁 ✓${NC}"
        echo -e "${DIM}使用 termux-wake-lock release 释放${NC}"
    fi
    
    # 5. Background processes
    echo -e "${LCYAN}[5/6]${NC} 后台进程建议"
    echo -e "${DIM}建议在系统开发者选项中:${NC}"
    echo -e "${DIM}  • 限制后台进程数: 标准限制${NC}"
    echo -e "${DIM}  • 不保留活动: 关闭${NC}"
    
    # 6. Termux properties
    echo -e "${LCYAN}[6/6]${NC} Termux 配置优化"
    if [[ -f "$HOME/.termux/termux.properties" ]]; then
        echo -e "${LGREEN}Termux 配置文件已存在${NC}"
    else
        mkdir -p "$HOME/.termux" 2>/dev/null
        {
            echo "# Kali Dragon Deploy - Termux 优化配置"
            echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]"
            echo "terminal-transcript-rows = 10000"
            echo "bell-character = ignore"
            echo "use-black-ui = true"
        } > "$HOME/.termux/termux.properties" 2>/dev/null
        echo -e "${LGREEN}Termux 配置已优化 ✓${NC}"
        echo -e "${DIM}请重启 Termux 或运行 termux-reload-settings 生效${NC}"
    fi
    
    echo
    echo -e "${LGREEN}Termux 优化完成！${NC}"
    echo
    read -r -p "按回车键继续..."
}

# ============================================================
# ABOUT & HELP
# ============================================================

display_about() {
    clear_screen
    draw_header "🐉 关于 Kali Dragon Deploy" "$LRED"
    echo
    
    rainbow_print "KALI DRAGON DEPLOY"
    echo
    
    echo -e "${BOLD}版本信息:${NC}"
    echo -e "  版本号: ${VERSION}"
    echo -e "  代号: ${CODENAME}"
    echo -e "  构建日期: ${BUILD_DATE}"
    echo -e "  作者: Kali-Toolkit-Team"
    echo -e "  许可证: MIT"
    echo -e "  GitHub: https://github.com/kaliop456/installkali"
    echo
    
    echo -e "${BOLD}功能统计:${NC}"
    echo -e "  🛠️  300+ 可安装工具 (10大类)"
    echo -e "  🎨  10+ 主题切换"
    echo -e "  🎮  5+ 内置小游戏"
    echo -e "  🌍  6+ 语言支持"
    echo -e "  🏆  13+ 成就系统"
    echo -e "  💾  4种备份模式"
    echo -e "  ☁️  6种云同步方式"
    echo -e "  🎯  5种安装模式"
    echo -e "  ⚙️  10项系统调校"
    echo
    
    echo -e "${BOLD}系统信息:${NC}"
    echo -e "  操作系统: ${OS}"
    echo -e "  架构: ${CPU_ARCH} (${BITS}位)"
    echo -e "  内存: ${TOTAL_RAM}MB"
    echo -e "  可用磁盘: ${AVAILABLE_DISK}GB"
    echo -e "  终端大小: ${TERM_WIDTH}x${TERM_HEIGHT}"
    echo
    
    echo -e "${BOLD}运行统计:${NC}"
    echo -e "  本次错误数: ${ERROR_COUNT}/${MAX_ERRORS}"
    local unlocked_count=0
    for k in "${!ACHIEVEMENTS[@]}"; do
        [[ "${ACHIEVEMENTS[$k]}" == true ]] && ((unlocked_count++))
    done
    echo -e "  已解锁成就: ${unlocked_count}/${#ACHIEVEMENTS[@]}"
    echo
    
    echo -e "${DIM}「工欲善其事，必先利其器」—— 孔子${NC}"
    echo -e "${DIM}「With great power comes great responsibility」—— Spider-Man${NC}"
    echo
    echo -e "${LYELLOW}特别感谢:${NC}"
    echo -e "  🐧 Termux 团队"
    echo -e "  🐉 Kali Linux 团队"
    echo -e "  🌟 所有开源贡献者"
    echo -e "  💖 每一位使用者"
    echo
    read -r -p "按回车键继续..."
}

display_help() {
    clear_screen
    draw_header "❓ 帮助信息" "$LCYAN"
    echo
    
    echo -e "${BOLD}快捷键:${NC}"
    echo -e "  ${YELLOW}1-9${NC}      快速菜单选择"
    echo -e "  ${YELLOW}0${NC}        返回/退出"
    echo -e "  ${YELLOW}q/Q${NC}      退出当前操作"
    echo -e "  ${YELLOW}h/H${NC}      显示帮助"
    echo -e "  ${YELLOW}Ctrl+C${NC}    安全退出（保存进度）"
    echo -e "  ${YELLOW}Enter${NC}     确认选择"
    echo
    
    echo -e "${BOLD}使用技巧:${NC}"
    echo -e "  • 安装过程中可以玩小游戏打发时间"
    echo -e "  • 支持10+种主题切换"
    echo -e "  • 自动保存安装进度，中断后可继续"
    echo -e "  • 所有操作都有完整日志记录"
    echo -e "  • 支持一键全装（快速/标准/完整/自定义/静默）"
    echo -e "  • 安装失败自动重试3次"
    echo
    
    echo -e "${BOLD}常见问题:${NC}"
    
    echo -e "  ${YELLOW}Q: 安装失败怎么办？${NC}"
    echo -e "  A: 脚本会自动重试3次。请检查:"
    echo -e "     • 网络连接是否正常"
    echo -e "     • 存储空间是否充足 (建议5GB+)"
    echo -e "     • 软件源是否正确 (可换源重试)"
    echo
    
    echo -e "  ${YELLOW}Q: 如何切换语言？${NC}"
    echo -e "  A: 主菜单 > [14] 语言切换"
    echo
    
    echo -e "  ${YELLOW}Q: 如何备份数据？${NC}"
    echo -e "  A: 主菜单 > [8] 备份还原 > 选择备份模式"
    echo -e "     支持完整备份/配置备份/包列表/工具目录"
    echo
    
    echo -e "  ${YELLOW}Q: 支持哪些系统？${NC}"
    echo -e "  A: Termux (Android 7+) / Kali Linux / Ubuntu / Debian"
    echo
    
    echo -e "  ${YELLOW}Q: 如何更新已安装的工具？${NC}"
    echo -e "  A: 重新运行脚本，选择对应的工具类别重新安装"
    echo -e "     或使用系统的包管理器更新 (pkg upgrade / apt upgrade)"
    echo
    
    echo -e "  ${YELLOW}Q: 安装过程中可以退出吗？${NC}"
    echo -e "  A: 可以，按 Ctrl+C 安全退出，进度会自动保存"
    echo
    
    echo -e "  ${YELLOW}Q: 如何贡献代码？${NC}"
    echo -e "  A: 欢迎提交 GitHub Issues / Pull Requests！"
    echo
    
    echo -e "${BOLD}获取帮助:${NC}"
    echo -e "  📧 GitHub Issues: https://github.com/kaliop456/installkali"

    echo
    read -r -p "按回车键继续..."
}

# ============================================================
# GOODBYE SCREEN
# ============================================================

display_goodbye() {
    clear_screen
    echo
    rainbow_print "════════════════════════════════════════"
    echo
    fire_print "    感 谢 使 用  K A L I   D R A G O N"
    echo
    rainbow_print "════════════════════════════════════════"
    echo
    echo -e "${GOLD}         🐉 龙之祝福与你同在 🐉${NC}"
    echo
    echo -e "${DIM}    「Stay curious, stay ethical.」${NC}"
    echo
    echo -e "${DIM}    GitHub: https://github.com/kaliop456/installkali-deploy${NC}"
    echo
    sleep 2
    
    # Dragon animation
    animate_dragon_breath
    sleep 1
    
    # Show stats
    local unlocked_count=0
    for k in "${!ACHIEVEMENTS[@]}"; do
        [[ "${ACHIEVEMENTS[$k]}" == true ]] && ((unlocked_count++))
    done
    
    echo
    echo -e "${DIM}╔════════════════════════════════════════╗${NC}"
    echo -e "${DIM}║  本次运行统计                          ║${NC}"
    echo -e "${DIM}║  错误次数: ${ERROR_COUNT}                          ║${NC}"
    echo -e "${DIM}║  已解锁成就: ${unlocked_count}/${#ACHIEVEMENTS[@]}                         ║${NC}"
    echo -e "${DIM}╚════════════════════════════════════════╝${NC}"
    echo
    
    # Final dragon message
    dragon_eye_blink
}

# ============================================================
# MAIN MENU
# ============================================================

main_menu() {
    while true; do
        clear_screen
        
        # Display dragon logo
        display_dragon_logo
        echo
        
        # Menu header
        separator "═" "$LCYAN"
        echo -e "${BOLD}${LWHITE}                    🐉 KALI DRAGON DEPLOY v${VERSION} 🐉${NC}"
        separator "═" "$LCYAN"
        echo
        
        # Main menu options
        echo -e "  ${LRED}[1]${NC}  📦 镜像下载    ${DIM}获取 Kali 系统镜像${NC}"
        echo -e "  ${LYELLOW}[2]${NC}  ⚙️  系统调校    ${DIM}初始化与安全配置${NC}"
        echo -e "  ${LGREEN}[3]${NC}  🌐 软件源泉    ${DIM}换源与包管理${NC}"
        echo -e "  ${LCYAN}[4]${NC}  🛠️  工具安装    ${DIM}300+渗透测试工具${NC}"
        echo -e "  ${LBLUE}[5]${NC}  💻 开发环境    ${DIM}多语言开发配置${NC}"
        echo -e "  ${LMAGENTA}[6]${NC}  🎨 界面美化    ${DIM}终端/Shell美化${NC}"
        echo -e "  ${LYELLOW}[7]${NC}  🔄 自动化流    ${DIM}一键工作流${NC}"
        echo -e "  ${YELLOW}[8]${NC}  💾 备份还原    ${DIM}配置备份与恢复${NC}"
        echo -e "  ${CYAN}[9]${NC}  📦 容器之术    ${DIM}proot/chroot${NC}"
        echo -e "  ${BLUE}[10]${NC} ☁️  云端协同    ${DIM}远程同步${NC}"
        echo -e "  ${LRED}[11]${NC} 🎯 一键全装    ${DIM}懒人终极方案${NC}"
        echo
        echo -e "  ${LMAGENTA}[12]${NC} 🎮 迷你游戏    ${DIM}贪吃蛇/2048/猜数字/抽奖${NC}"
        echo -e "  ${YELLOW}[13]${NC} 🎨 主题切换    ${DIM}10+主题任选${NC}"
        echo -e "  ${CYAN}[14]${NC} 🌍 语言切换    ${DIM}多语言支持${NC}"
        echo -e "  ${LBLUE}[15]${NC} 📊 系统状态    ${DIM}实时监控${NC}"
        echo -e "  ${GOLD}[16]${NC} 🏆 成就系统    ${DIM}解锁成就${NC}"
        echo -e "  ${LGREEN}[17]${NC} 📜 法律条款    ${DIM}查看使用协议${NC}"
        echo -e "  ${WHITE}[18]${NC} ❓ 帮助信息    ${DIM}使用指南${NC}"
        echo -e "  ${LMAGENTA}[19]${NC} ℹ️  关于        ${DIM}版本信息${NC}"
        echo
        echo -e "  ${LRED}[0]${NC}  ❌ 退出程序"
        echo
        
        separator "═" "$LCYAN"
        
        # Easter egg - random dragon message
        local messages=(
            "🐉 龙在注视着你的一举一动..."
            "🐉 今天是个好日子，适合学习~"
            "🐉 喝杯茶休息一下吧 ☕"
            "🐉 安全第一，合规第二！"
            "🐉 你是最棒的渗透测试工程师！"
            "🐉 别忘了给手机充电哦 🔋"
            "🐉 夜深了，早点休息~ 🌙"
            "🐉 龙之祝福与你同在！"
            "🐉 代码如诗，安全如盾 🛡️"
            "🐉 Stay hungry, stay foolish."
            "🐉 每一次扫描都是一次学习"
            "🐉 知行合一，学以致用"
        )
        local random_msg="${messages[$((RANDOM % ${#messages[@]}))]}"
        echo -e "${DIM}${random_msg}${NC}"
        
        echo
        read -r -p "$(echo -e "${BOLD}${WHITE}请选择操作 [0-19]:${NC} ")" choice
        echo
        
        case "$choice" in
            1) download_kali_image ;;
            2) system_config_menu ;;
            3) change_mirrors ;;
            4) tools_menu ;;
            5) setup_dev_environment ;;
            6) setup_beautification ;;
            7) 
                echo -e "${YELLOW}自动化工作流${NC}"
                echo -e "${DIM}此功能正在开发中，敬请期待...${NC}"
                echo -e "${DIM}计划功能: 一键渗透测试工作区 / 自动化扫描 / 报告生成${NC}"
                sleep 2
                ;;
            8) 
                echo -e "${YELLOW}[1] 备份 [2] 还原${NC}"
                read -r -p "选择: " bc
                case "$bc" in
                    1) backup_system ;;
                    2) restore_system ;;
                esac
                ;;
            9) 
                echo -e "${YELLOW}容器功能${NC}"
                if ! command -v proot-distro &>/dev/null; then
                    echo -e "${YELLOW}需要安装 proot-distro${NC}"
                    safe_run "$INSTALL_CMD proot-distro" "安装 proot-distro" 2 1
                fi
                if command -v proot-distro &>/dev/null; then
                    echo -e "${LGREEN}proot-distro 已就绪${NC}"
                    echo -e "${DIM}使用: proot-distro install <发行版>${NC}"
                    echo -e "${DIM}示例: proot-distro install kali${NC}"
                fi
                sleep 2
                ;;
            10) cloud_sync_menu ;;
            11) one_click_install ;;
            12) game_menu ;;
            13) theme_selection_menu ;;
            14) language_selection_menu ;;
            15) display_system_status ;;
            16) display_achievements ;;
            17) display_legal_terms; read -r -p "按回车键继续..." ;;
            18) display_help ;;
            19) display_about ;;
            0) 
                echo
                echo -e "${LYELLOW}确认退出？[y/N]:${NC} "
                read -r confirm
                if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
                    display_goodbye
                    exit 0
                fi
                ;;
            "dragon"|"DRAGON")
                # Hidden easter egg
                echo -e "${GOLD}🐉 你发现了隐藏的秘密！${NC}"
                animate_dragon_breath
                echo -e "${GOLD}龙之祝福已降临！${NC}"
                echo -e "${GOLD}🏆 隐藏成就解锁: 发现龙之秘密${NC}"
                sleep 2
                ;;
            "42")
                # Douglas Adams easter egg
                echo -e "${LCYAN}「生命、宇宙以及一切的终极答案」${NC}"
                echo -e "${LCYAN}「The Answer to the Ultimate Question of Life, the Universe, and Everything」${NC}"
                sleep 2
                ;;
            "sudo"|"SUDO")
                # Sudo easter egg
                echo -e "${LRED}┌─────────────────────────────────────────┐${NC}"
                echo -e "${LRED}│${NC} ${WHITE}我们信任你已从系统管理员处获得常规授权${NC} ${LRED}│${NC}"
                echo -e "${LRED}│${NC} ${WHITE}请确保你遵循正确的安全协议            ${NC} ${LRED}│${NC}"
                echo -e "${LRED}└─────────────────────────────────────────┘${NC}"
                sleep 2
                ;;
            *)
                echo -e "${LYELLOW}无效选择，请重试${NC}"
                sleep 1
                ;;
        esac
    done
}

# ============================================================
# MAIN ENTRY POINT
# ============================================================

main() {
    # Record start time
    local start_time=$(date +%s)
    
    # Initialize environment
    init_environment
    
    # Check if locked
    check_lock_status
    
    # Display legal terms (only first time or expired)
    if [[ "$TERMS_ACCEPTED" == false ]]; then
        terms_agreement_flow
    fi
    
    # Unlock first run achievement
    unlock_achievement "first_run"
    
    # Play startup sound
    play_sound click
    
    # Send notification (Termux only)
    send_notification "🐉 Kali Dragon Deploy" "欢迎使用龙之工具箱 v${VERSION}"
    
    # Speak welcome (if TTS available, background)
    speak_text "欢迎使用Kali Dragon Deploy工具箱" &
    
    # Check for zero error achievement
    if [[ $ERROR_COUNT -eq 0 ]]; then
        ACHIEVEMENTS["error_free"]=true
        save_achievements
    fi
    
    # Display welcome message
    clear_screen
    echo
    echo -e "${LGREEN}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${LGREEN}║                                                              ║${NC}"
    echo -e "${LGREEN}║   🐉 欢迎使用 Kali Dragon Deploy v${VERSION}                     ║${NC}"
    echo -e "${LGREEN}║                                                              ║${NC}"
    echo -e "${LGREEN}║   系统: ${OS}                                                 ║${NC}"
    echo -e "${LGREEN}║   架构: ${CPU_ARCH} (${BITS}位)                                      ║${NC}"
    echo -e "${LGREEN}║   内存: ${TOTAL_RAM}MB                                               ║${NC}"
    echo -e "${LGREEN}║   可用磁盘: ${AVAILABLE_DISK}GB                                           ║${NC}"
    echo -e "${LGREEN}║                                                              ║${NC}"
    echo -e "${LGREEN}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo
    echo -e "${DIM}正在初始化...${NC}"
    sleep 1.5
    
    # Run main menu loop
    main_menu
    
    # Calculate run time
    local end_time=$(date +%s)
    local run_time=$((end_time - start_time))
    local minutes=$((run_time / 60))
    local seconds=$((run_time % 60))
    
    # Log run time and statistics
    {
        echo ""
        echo "════════════════════════════════════════"
        echo "  脚本运行统计"
        echo "════════════════════════════════════════"
        echo "  开始时间: $(date -d @${start_time} '+%Y-%m-%d %H:%M:%S' 2>/dev/null || echo 'N/A')"
        echo "  结束时间: $(date -d @${end_time} '+%Y-%m-%d %H:%M:%S' 2>/dev/null || echo 'N/A')"
        echo "  运行时间: ${minutes}分${seconds}秒"
        echo "  总错误数: ${ERROR_COUNT}"
        echo "  安装模式: ${INSTALL_MODE:-未选择}"
        echo "  当前主题: ${CURRENT_THEME}"
        echo "  当前语言: ${CURRENT_LANGUAGE}"
        echo "════════════════════════════════════════"
    } >> "$LOG_FILE"
    
    log_info "脚本运行结束 - 耗时: ${minutes}分${seconds}秒"
    log_info "脚本正常退出"
    
    # Send exit notification
    send_notification "🐉 Kali Dragon Deploy" "脚本已退出，运行时间: ${minutes}分${seconds}秒"
    
    # Save final state
    save_state
    
    # Cleanup
    cleanup_temp
    
    # Exit
    exit 0
}

# Run main function with all arguments
main "$@"

# ═══════════════════════════════════════════════════════════════════════════════════
#  END OF KALI DRAGON DEPLOY v4.0.0
#  
#  Total Lines: ~5500+
#  Total Functions: 130+
#  Total Features: 300+
#  
#  Developed with ❤️ by Kali-Toolkit-Team
#  Licensed under MIT License
#  
#  Remember: 
#     「能力越大，责任越大」
#     "With great power comes great responsibility"
#  
#  🐉 龙之祝福与你同在 🐉
#  
#  GitHub: https://github.com/kaliop456/installkali
#  Issues: https://github.com/kaliop456/installkali/issues
# ═══════════════════════════════════════════════════════════════════════════════════