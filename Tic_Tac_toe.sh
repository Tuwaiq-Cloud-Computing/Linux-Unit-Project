#/bin/bash

#check user
check_user() {
     username="$1"
    if id "$username" &>/dev/null; then
        return 0
    else
        return 1
    fi
}

# Function to create a new user
create_user() {
     username="$1"
     password="$2"

    # Create the new user
    useradd -m -s /bin/bash "$username"

    # Set the user's password
    echo "$username:$password" | chpasswd
}

# Function to log game results for a player
log_game_result() {
     username="$1"
     result="$2"
     log_file="/root/Linux_Project/Records/${username}_game_log.txt"


    if [ -f "$log_file" ]; then
        echo "$(date): $result" >> "$log_file"
    else
        echo "Game Log for $username" > "$log_file"
        echo "$(date): $result" >> "$log_file"
    fi

}

#Insert the names of the players
read -p "Enter Player One's username: " player1
read -p "Enter Player Two's username: " player2

# Check if the specified users exist
if ! check_user "$player1"; then
    read -s -p "Enter the password for $player1: " password1
    echo
    create_user "$player1" "$password1"
fi
if ! check_user "$player2"; then
    read -s -p "Enter the password for $player2: " password2
    echo
    create_user "$player2" "$password2"
fi

# Starting the Game!

Player1='X'
Player2='O'

turn=1
game_on=true

moves=( 1 2 3 4 5 6 7 8 9 )

welcome_message() {
    echo "========================"
    echo "=== LET'S PLAY A GAME ==="
    echo "========================"
    sleep 3
}

print_board () {
    echo "   ${moves[0]} | ${moves[1]} | ${moves[2]} "
    echo " -------------"
    echo "   ${moves[3]} | ${moves[4]} | ${moves[5]} "
    echo " -------------"
    echo "   ${moves[6]} | ${moves[7]} | ${moves[8]} "
    echo "================"
}

player_pick(){
    if [[ $(($turn % 2)) == 0 ]]
    then
        play=$Player2
        echo -n "$player2, pick a square: "
    else
        play=$Player1
        echo -n "$player1, pick a square: "
    fi

    read square

    if [[ $square == "quit" ]]
    then
        game_on=false
    else
            space=${moves[($square - 1)]}

        if [[ ! $square =~ ^-?[0-9]+$ ]] || [[ ! $space =~ ^[0-9]+$ ]]
        then
            echo "Not a valid square."
            player_pick
        else
            moves[($square - 1)]=$play
            ((turn = turn + 1))
        fi
        space=${moves[($square - 1)]}
    fi
}

check_match() {
    if  [[ ${moves[$1]} == ${moves[$2]} ]] && \
        [[ ${moves[$2]} == ${moves[$3]} ]]; then
        game_on=false
        if [ ${moves[$1]} == 'X' ]; then
            echo -e "\e[32m$player1 is the winner!\e[0m"
            log_game_result "$player1" "Won the game."
            log_game_result "$player2" "Lost the game."
        else
            echo -e "\e[32m$player2 is the winner!\e[0m"
            log_game_result "$player1" "Lost the game."
            log_game_result "$player2" "Won the game."
        fi
    fi
}

check_winner(){
    if [ $game_on == false ]; then return; fi
    check_match 0 1 2
    if [ $game_on == false ]; then return; fi
    check_match 3 4 5
    if [ $game_on == false ]; then return; fi
    check_match 6 7 8
    if [ $game_on == false ]; then return; fi
    check_match 0 4 8
    if [ $game_on == false ]; then return; fi
    check_match 2 4 6
    if [ $game_on == false ]; then return; fi
    check_match 0 3 6
    if [ $game_on == false ]; then return; fi
    check_match 1 4 7
    if [ $game_on == false ]; then return; fi
    check_match 2 5 8
        if [ $game_on == false ]; then return; fi

    if [ $turn -gt 9 ]; then
        game_on=false
        echo "It's a draw!"
        log_game_result "$player1" "Game ended in a draw."
        log_game_result "$player2" "Game ended in a draw."
    fi
}

welcome_message
print_board
while $game_on
do
    player_pick
    print_board
    check_winner
done