# TurtleBot3 Burger ROS2 Humble SD Card Cloning Guide

This guide explains how to clone a fully configured TurtleBot3 Burger SD card
(Ubuntu Server 22.04 + ROS2 Humble + networking) and prepare multiple robots quickly.

---

## Requirements

- Linux PC with SD card reader
- Working TurtleBot3 SD card
- New SD cards (same or larger size)
- Ubuntu / ROS2 Humble already configured on master image

---

# PART 1 — Create Master Image

Insert the working TurtleBot3 SD card.

Find device name:

```bash
lsblk
```

Example: `/dev/sdb`

Create image:

```bash
sudo dd if=/dev/sdb of=~/turtlebot3_master.img bs=4M status=progress
sync
```

Compress image:

```bash
gzip turtlebot3_master.img
```

Result:

```
turtlebot3_master.img.gz
```

---

# PART 2 — Flash Image To New SD Card

Insert new SD card.

Find device:

```bash
lsblk
```

Example: `/dev/sdc`

Flash:

```bash
gunzip -c ~/turtlebot3_master.img.gz | sudo dd of=/dev/sdc bs=4M status=progress
sync
```

Safely eject and insert into TurtleBot3.

---

# PART 3 — First Boot Setup (Per Robot)

After booting cloned robot:

Copy setup script:

```bash
nano setup_robot.sh
```

Paste script from repository.

Make executable:

```bash
chmod +x setup_robot.sh
```

Run:

```bash
sudo ./setup_robot.sh
```

Reboot:

```bash
sudo reboot
```

Robot is ready.

---

# Recommended Per-Robot Settings

| Robot | Hostname        | Static IP       | ROS_DOMAIN_ID |
------- | --------------- | --------------- | -------------
Robot1 | turtlebot3_01   | 192.168.1.51    | 1
Robot2 | turtlebot3_02   | 192.168.1.52    | 2
Robot3 | turtlebot3_03   | 192.168.1.53    | 3

---

# Notes

- Always use unique ROS_DOMAIN_ID per robot for multi-robot systems
- Keep backup of master image
- Do not reuse same IP on multiple robots
- TURTLEBOT3_MODEL should already be set in ~/.bashrc

---

Done 🚀
