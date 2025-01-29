#!/bin/bash

# System Monitoring Script
# This script provides CPU, Memory, Disk, and Network usage statistics
# and logs data for future analysis.

LOG_FILE="system_monitor.log"
INTERVAL=5  # Time in seconds between updates

# Function to print a header
print_header() {
    echo "----------------------------------------"
    echo "      SYSTEM MONITORING TOOL"
    echo "----------------------------------------"
}

# Function to display system uptime
display_uptime() {
    echo "Uptime: $(uptime -p)"
}

# Function to display CPU usage
display_cpu_usage() {
    echo "CPU Usage:"
    top -bn1 | grep "Cpu(s)" | awk '{print "  User:", $2 "% | System:", $4 "% | Idle:", $8 "%"}'
}

# Function to display memory usage
display_memory_usage() {
    echo "Memory Usage:"
    free -h | awk 'NR==2{printf "  Used: %s | Free: %s | Total: %s\n", $3, $4, $2}'
}

# Function to display disk space usage
display_disk_usage() {
    echo "Disk Usage:"
    df -h | grep '^/dev' | awk '{print "  " $1 " - Used: " $3 " | Free: " $4 " | Total: " $2}'
}

# Function to display network activity
display_network_activity() {
    echo "Network Activity:"
    netstat -i | awk 'NR==1 || NR==2 {print} NR>2 {print "  Interface:", $1, "| RX:", $3, "TX:", $7}'
}

# Function to log system data
log_system_data() {
    {
        echo "$(date)"
        display_cpu_usage
        display_memory_usage
        display_disk_usage
        display_network_activity
        echo "----------------------------------------"
    } >> "$LOG_FILE"
}

# Function to run monitoring in a loop
start_monitoring() {
    print_header
    while true; do
        display_uptime
        display_cpu_usage
        display_memory_usage
        display_disk_usage
        display_network_activity
        log_system_data
        echo "----------------------------------------"
        sleep $INTERVAL
    done
}

# Help menu
show_help() {
    echo "Usage: ./monitor.sh [OPTION]"
    echo "Options:"
    echo "  --help       Show this help message"
    echo "  --logfile    View the system monitoring log file"
    echo "  --monitor    Start system monitoring"
}

# Main execution
case "$1" in
    --help)
        show_help
        ;;
    --logfile)
        cat "$LOG_FILE"
        ;;
    --monitor)
        start_monitoring
        ;;
    *)
        echo "Invalid option. Use --help for usage information."
        ;;
esac
