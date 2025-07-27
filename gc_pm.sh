#!/bin/zsh

COLOR_GEMINI_MAGENTA="\e[38;2;190;90;90m"
COLOR_GEMINI_BLUE="\e[38;2;135;206;235m"
COLOR_RESET="\e[0m"

get_gradient_color() {
    local start_r=$1 start_g=$2 start_b=$3
    local end_r=$4 end_g=$5 end_b=$6
    local step=$7 max_steps=$8

    if [[ max_steps -eq 0 ]]; then
        echo "\e[38;2;${start_r};${start_g};${start_b}m"
        return
    fi

    local current_r=$(( start_r + ( (end_r - start_r) * step ) / max_steps ))
    local current_g=$(( start_g + ( (end_g - start_g) * step ) / max_steps ))
    local current_b=$(( start_b + ( (end_b - start_b) * step ) / max_steps ))

    echo "\e[38;2;${current_r};${current_g};${current_b}m"
}

START_R=135; START_G=206; START_B=235
END_R=190; END_G=90; END_B=90

MAX_LOGO_GRADIENT_STEPS=7
echo ""
echo ""
LOGO_LINE_CONTENT_1=" ███          █████████  ████████   ████     ████ █████ ██████   █████ █████"
LOGO_LINE_CONTENT_2=" ░░░███       ███░░░░██  ███░░░░█░░ █████   █████ ░░███ ░░██████ ░░███ ░░███"
LOGO_LINE_CONTENT_3="   ░░░███     ███      ░░███  █ ░  ░███░█████░███  ░███  ░███░███ ░███  ░███"
LOGO_LINE_CONTENT_4="     ░░░███  ░███       ░██████    ░███░░███ ░███  ░███  ░███░░███░███  ░███"
LOGO_LINE_CONTENT_5="      ███░   ░███  █████ ███░░█    ░███ ░░░  ░███  ░███  ░███ ░░██████  ░███"
LOGO_LINE_CONTENT_6="    ███░    ░░███ ░░███ ░███ ░  █  ░███      ░███  ░███  ░███  ░░█████  ░███"
LOGO_LINE_CONTENT_7=" ███░       ░░█████████  ████████  █████      █████ █████ █████  ░░█████ █████"
LOGO_LINE_CONTENT_8=" ░░░          ░░░░░░░░░ ░░░░░░░░░░ ░░░░░      ░░░░░ ░░░░░ ░░░░░    ░░░░░ ░░░░░"

LOGO_ASCII_ART_PART1="$(get_gradient_color $START_R $START_G $START_B $END_R $END_G $END_B 0 $MAX_LOGO_GRADIENT_STEPS)${LOGO_LINE_CONTENT_1}${COLOR_RESET}"
LOGO_ASCII_ART_PART2="$(get_gradient_color $START_R $START_G $START_B $END_R $END_G $END_B 1 $MAX_LOGO_GRADIENT_STEPS)${LOGO_LINE_CONTENT_2}${COLOR_RESET}"
LOGO_ASCII_ART_PART3="$(get_gradient_color $START_R $START_G $START_B $END_R $END_G $END_B 2 $MAX_LOGO_GRADIENT_STEPS)${LOGO_LINE_CONTENT_3}${COLOR_RESET}"
LOGO_ASCII_ART_PART4="$(get_gradient_color $START_R $START_G $START_B $END_R $END_G $END_B 3 $MAX_LOGO_GRADIENT_STEPS)${LOGO_LINE_CONTENT_4}${COLOR_RESET}"
LOGO_ASCII_ART_PART5="$(get_gradient_color $START_R $START_G $START_B $END_R $END_G $END_B 4 $MAX_LOGO_GRADIENT_STEPS)${LOGO_LINE_CONTENT_5}${COLOR_RESET}"
LOGO_ASCII_ART_PART6="$(get_gradient_color $START_R $START_G $START_B $END_R $END_G $END_B 5 $MAX_LOGO_GRADIENT_STEPS)${LOGO_LINE_CONTENT_6}${COLOR_RESET}"
LOGO_ASCII_ART_PART7="$(get_gradient_color $START_R $START_G $START_B $END_R $END_G $END_B 6 $MAX_LOGO_GRADIENT_STEPS)${LOGO_LINE_CONTENT_7}${COLOR_RESET}"
LOGO_ASCII_ART_PART8="$(get_gradient_color $START_R $START_G $START_B $END_R $END_G $END_B 7 $MAX_LOGO_GRADIENT_STEPS)${LOGO_LINE_CONTENT_8}${COLOR_RESET}"

LOGO_ASCII_ART_PART9="${COLOR_GEMINI_BLUE}                                                                        ${COLOR_RESET}"
LOGO_ASCII_ART_PART10="${COLOR_GEMINI_BLUE}                  G E M I N I   P R O J E C T   M A N A G E R         ${COLOR_RESET}"
LOGO_ASCII_ART_PART11="${COLOR_GEMINI_BLUE}                                                                        ${COLOR_RESET}"

draw_info_box() {
    local text_author="Author: grugnoymeme a.k.a. 47LeCoste"
    local text_version="Version: 0.1"
    local text_github="GitHub: https://github.com/grugnoymeme/gemini-cli-pm"
    local text_description="Description: A smart manager for your Gemini-CLI projects."
    
    local text_disclaimer_part1="Disclaimer: This is a personal utility, not an official Google tool,"
    local text_disclaimer_part2="provided to streamline the user experience with the original Gemini CLI."

    local max_len=0
    for s in "$text_author" "$text_version" "$text_github" "$text_description" "$text_disclaimer_part1" "$text_disclaimer_part2"; do
        if (( ${#s} > max_len )); then
            max_len=${#s}
        fi
    done

    local padding=6
    local box_width=$((max_len + padding))

    echo "${COLOR_GEMINI_MAGENTA}╭$(printf -- '─%.0s' $(seq 1 $box_width))╮${COLOR_RESET}"
    
    printf "${COLOR_GEMINI_MAGENTA}│%*s%s%*s│${COLOR_RESET}\n" "$(( (box_width - ${#text_author}) / 2 ))" "" "$text_author" "$(( box_width - ${#text_author} - (box_width - ${#text_author}) / 2 ))" ""
    printf "${COLOR_GEMINI_MAGENTA}│%*s%s%*s│${COLOR_RESET}\n" "$(( (box_width - ${#text_version}) / 2 ))" "" "$text_version" "$(( box_width - ${#text_version} - (box_width - ${#text_version}) / 2 ))" ""
    printf "${COLOR_GEMINI_MAGENTA}│%*s%s%*s│${COLOR_RESET}\n" "$(( (box_width - ${#text_github}) / 2 ))" "" "$text_github" "$(( box_width - ${#text_github} - (box_width - ${#text_github}) / 2 ))" ""
    printf "${COLOR_GEMINI_MAGENTA}│%*s%s%*s│${COLOR_RESET}\n" "$(( (box_width - ${#text_description}) / 2 ))" "" "$text_description" "$(( box_width - ${#text_description} - (box_width - ${#text_description}) / 2 ))" ""
    printf "${COLOR_GEMINI_MAGENTA}│%*s%s%*s│${COLOR_RESET}\n" "$(( (box_width - ${#text_disclaimer_part1}) / 2 ))" "" "$text_disclaimer_part1" "$(( box_width - ${#text_disclaimer_part1} - (box_width - ${#text_disclaimer_part1}) / 2 ))" ""
    printf "${COLOR_GEMINI_MAGENTA}│%*s%s%*s│${COLOR_RESET}\n" "$(( (box_width - ${#text_disclaimer_part2}) / 2 ))" "" "$text_disclaimer_part2" "$(( box_width - ${#text_disclaimer_part2} - (box_width - ${#text_disclaimer_part2}) / 2 ))" ""


    echo "${COLOR_GEMINI_MAGENTA}╰$(printf -- '─%.0s' $(seq 1 $box_width))╯${COLOR_RESET}"
}

draw_prompt_box() {
    local border_color="$1"
    local prompt_text="$2"
    local box_width=$(( ${#prompt_text} + 6 ))
    local line=$(printf -- '─%.0s' $(seq 1 $((box_width - 2))))

    echo "${border_color}╭${line}╮${COLOR_RESET}"
    echo "${border_color}│${COLOR_RESET} ${border_color}>${COLOR_RESET} ${prompt_text} ${border_color}│${COLOR_RESET}"
    echo "${border_color}╰${line}╯${COLOR_RESET}"
}

draw_selection_box() {
    local border_color="$1"
    local title="$2"
    shift 2
    local options=("$@")
    local max_len=${#title}
    local i=1

    for opt in "${options[@]}"; do
        local line_len=$(( ${#opt} + ${#i} + 2 ))
        if (( line_len > max_len )); then
            max_len=$line_len
        fi
         ((i++))
    done
    i=1

    local padding=4
    local box_width=$((max_len + padding))

    echo -e "${border_color}╭$(printf -- '─%.0s' $(seq 1 $box_width))╮${COLOR_RESET}"

    local title_padding=$(( (box_width - ${#title}) / 2 ))
    local remainder=$(( (box_width - ${#title}) % 2 ))
    printf "${border_color}│%*s%s%*s│${COLOR_RESET}\n" "$title_padding" "" "$title" "$((title_padding + remainder))" ""

    echo -e "${border_color}├$(printf -- '─%.0s' $(seq 1 $box_width))┤${COLOR_RESET}"

    for opt in "${options[@]}"; do
        local text=" ${i}. ${opt}"
        local text_len=${#text}
        local remaining_space=$(( box_width - text_len ))
        printf "${border_color}│%s%*s│${COLOR_RESET}\n" "$text" "$remaining_space" ""
        ((i++))
    done

    echo -e "${border_color}╰$(printf -- '─%.0s' $(seq 1 $box_width))╯${COLOR_RESET}"
}

# Main directory where you manage all your Gemini projects
GEMINI_PROJECTS_ROOT="/path/to/your/Gemini/directories"

echo -e "$LOGO_ASCII_ART_PART1"
echo -e "$LOGO_ASCII_ART_PART2"
echo -e "$LOGO_ASCII_ART_PART3"
echo -e "$LOGO_ASCII_ART_PART4"
echo -e "$LOGO_ASCII_ART_PART5"
echo -e "$LOGO_ASCII_ART_PART6"
echo -e "$LOGO_ASCII_ART_PART7"
echo -e "$LOGO_ASCII_ART_PART8"
echo -e "$LOGO_ASCII_ART_PART9"
echo -e "$LOGO_ASCII_ART_PART10"
echo -e "$LOGO_ASCII_ART_PART11"

draw_info_box
echo ""

cd "$GEMINI_PROJECTS_ROOT" || { echo -e "${COLOR_GEMINI_MAGENTA}Error:${COLOR_RESET} $GEMINI_PROJECTS_ROOT not found or is not a directory. Please check the path."; exit 1; }

echo -e "${COLOR_GEMINI_BLUE}Welcome to 47LeCoste's Gemini-CLI Projects Manager!${COLOR_RESET}"
echo ""

draw_prompt_box "$COLOR_GEMINI_MAGENTA" "Do you want to create a new project? [y/n]"
echo -n "${COLOR_GEMINI_MAGENTA}Your choice (y/n): ${COLOR_RESET}"
read create_new_project_response
echo ""

# Variable to store the current project directory, initialized to empty
CURRENT_PROJECT_DIR="" 

if [[ "$create_new_project_response" == "y" || "$create_new_project_response" == "Y" ]]; then
    draw_prompt_box "$COLOR_GEMINI_BLUE" "Enter the new project name:"
    echo -n "${COLOR_GEMINI_BLUE}Project name: ${COLOR_RESET}"
    read new_project_name

    new_project_name=$(echo "$new_project_name" | tr -d '[:space:]')
    new_project_name=$(echo "$new_project_name" | sed 's/[^a-zA-Z0-9_-]//g')

    if [[ -z "$new_project_name" ]]; then
        echo -e "${COLOR_GEMINI_MAGENTA}Error:${COLOR_RESET} Invalid project name. Please try again."
        exit 1
    fi

    if [[ -d "$new_project_name" ]]; then
        echo -e "${COLOR_GEMINI_MAGENTA}Error:${COLOR_RESET} A directory named '$new_project_name' already exists in $GEMINI_PROJECTS_ROOT."
        exit 1
    fi

    mkdir "$new_project_name" || { echo -e "${COLOR_GEMINI_MAGENTA}Error:${COLOR_RESET} Unable to create project directory '$new_project_name'."; exit 1; }
    echo -e "${COLOR_GEMINI_BLUE}Project '$new_project_name' created successfully.${COLOR_RESET}"
    cd "$new_project_name" || { echo -e "${COLOR_GEMINI_MAGENTA}Error:${COLOR_RESET} Unable to enter the new project directory."; exit 1; }
    CURRENT_PROJECT_DIR=$(pwd)
    echo -e "Accessing directory: $(pwd)"

else
    projects=(*(/N))

    local root_dir_display_name="$(basename "$GEMINI_PROJECTS_ROOT") (Root)"

    # Combine the root directory with the list of project subdirectories
    local all_options=("$root_dir_display_name" "${projects[@]}")

    if [ ${#all_options[@]} -eq 1 ]; then
        echo -e "${COLOR_GEMINI_MAGENTA}NOTE:${COLOR_RESET} No existing projects found. Starting in the root directory."
    fi

    draw_selection_box "$COLOR_GEMINI_BLUE" "Select a project or the root directory" "${all_options[@]}"

    echo -n "${COLOR_GEMINI_BLUE}Your choice (number): ${COLOR_RESET}"
    read selection

    if [[ "$selection" =~ ^[0-9]+$ ]] && [ "$selection" -ge 1 ] && [ "$selection" -le ${#all_options[@]} ]; then
        if [ "$selection" -eq 1 ]; then
            selected_project_name="."
        else
            selected_project_name="${projects[$((selection-1))]}"
        fi
    else
        echo -e "${COLOR_GEMINI_MAGENTA}Error:${COLOR_RESET} Invalid selection. Please enter a number between 1 and ${#all_options[@]}."
        exit 1
    fi

    cd "$selected_project_name" || { echo -e "${COLOR_GEMINI_MAGENTA}Error:${COLOR_RESET} Unable to enter project directory '$selected_project_name'."; exit 1; }
    CURRENT_PROJECT_DIR=$(pwd)
    echo -e "Accessing directory: $(pwd)"
fi

# Call your API key everytime you run this script, before invoking gemini
export GEMINI_API_KEY="<your_gemini_API_key_here>"

echo -e "\n${COLOR_GEMINI_BLUE}Starting Gemini CLI...${COLOR_RESET}"
# Here insert the full path to your gemini exec, so you could be also create a .desktop entry without problems
/full/path/to/your/gemini/executable/for/example/node/v22.17.1/bin/gemini
