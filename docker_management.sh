#!/bin/bash

# Docker Management Shell Script

# Function to list all containers
list_containers() {
    echo "Listing all containers:"
    docker ps -a
}

# Function to start a container
start_container() {
    read -p "Enter container name or ID to start: " container
    docker start "$container"
    echo "Container '$container' started."
}

# Function to stop a container
stop_container() {
    read -p "Enter container name or ID to stop: " container
    docker stop "$container"
    echo "Container '$container' stopped."
}

# Function to restart a container
restart_container() {
    read -p "Enter container name or ID to restart: " container
    docker restart "$container"
    echo "Container '$container' restarted."
}

# Function to remove a container
remove_container() {
    read -p "Enter container name or ID to remove: " container
    docker rm "$container"
    echo "Container '$container' removed."
}

# Function to view logs of a container
view_logs() {
    read -p "Enter container name or ID to view logs: " container
    docker logs "$container"
}

# Function to execute a command in a container
exec_command() {
    read -p "Enter container name or ID: " container
    read -p "Enter the command to execute: " command
    docker exec -it "$container" $command
}

# Function to display menu
show_menu() {
    echo "========================="
    echo "🐳 Docker Management Menu"
    echo "========================="
    echo "1. List all containers"
    echo "2. Start a container"
    echo "3. Stop a container"
    echo "4. Restart a container"
    echo "5. Remove a container"
    echo "6. View logs of a container"
    echo "7. Execute a command in a container"
    echo "8. Exit"
    echo "========================="
}

# Main script logic
while true; do
    show_menu
    read -p "Enter your choice: " choice

    case $choice in
        1) list_containers ;;
        2) start_container ;;
        3) stop_container ;;
        4) restart_container ;;
        5) remove_container ;;
        6) view_logs ;;
        7) exec_command ;;
        8) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
    echo "-------------------------"
done

