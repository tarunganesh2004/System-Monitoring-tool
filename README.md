# 🖥️ System Monitoring Tool

A shell script that provides real-time system monitoring by displaying and logging CPU usage, memory usage, disk space, and network activity. The tool is designed for **Windows (Git Bash) and Linux**.

## ✨ Features

- 📊 **Real-time system metrics**: CPU, Memory, Disk, and Network usage.
- 📝 **Logging system statistics** for future analysis.
- ⚡ **Runs continuously** with a user-defined update interval.
- 📄 **Easy-to-read logs** stored in `system_monitor.log`.
- 🔄 **Compatible with both Windows (Git Bash) and Linux**.

---

## 1️⃣ Installation

### For Linux

1. Open **Terminal** and navigate to the folder where you want to save the script.
2. Run:

   ```sh
   wget -O monitor.sh https://github.com/tarunganesh2004/System-Monitoring-tool/blob/main/monitor.sh
   chmod +x monitor.sh
   ```

### For Windows(Git Bash)

1. Open Git bash
2. Download the script or create monitor.sh manually:
   ```sh
   touch monitor.sh
   nano monitor.sh
   ```
3. Copy and paste the script, then save (Ctrl + X, Y, Enter)
4. Make it executable
   ```sh
   chmod +x monitor.sh
## 2️⃣ Usage

### Run the script in Git Bash or Linux Terminal
```sh
./monitor.sh --monitor
```
### View system logs
```sh
./monitor.sh --logfile
```

### Stop the script
Press Ctrl + C to terminate the process

### Script Overview
The script uses different commands for Windows (Git Bash) and Linux.

| Feature        | Linux Commands                               | Windows (Git Bash) Commands                     |
|--------------|----------------------------------|----------------------------------|
| **Uptime**    | `uptime -p`                     | `wmic os get lastbootuptime`    |
| **CPU Usage** | `` top -bn1 \| grep "Cpu(s)" `` | `wmic cpu get LoadPercentage`   |
| **Memory Usage** | `free -h`                    | `wmic OS get FreePhysicalMemory,TotalVisibleMemorySize` |
| **Disk Usage** | `` df -h \| grep '^/dev' ``    | `wmic logicaldisk get size,freespace,caption` |
| **Network Usage** | `netstat -i`               | `netstat -e`                    |

## 4️⃣ Run in Background
To run without keeping the terminal open, use:
```sh
nohup ./monitor.sh --monitor &
```

To stop background execution, find the process:
```sh
ps aux | grep monitor.sh
```
Then kill the process:
```sh
kill <PID>
```

## 5️⃣ Future Improvements
- 📌 **Graphical UI for real-time monitoring.**
- 📌 **Email alerts for critical CPU/memory usage.**
- 📌 **Multi-platform enhancements.**
