#!/bin/bash

echo "====== TurtleBot3 First Boot Setup ======"

#read -p "Enter new hostname (example: turtlebot3_01): " NEW_HOSTNAME
read -p "Enter static IP (example: 192.168.1.51): " NEW_IP
read -p "Enter ROS_DOMAIN_ID (example: 1): " ROS_DOMAIN_ID

NETPLAN_FILE=$(ls /etc/netplan/*.yaml | head -n 1)

echo ""
echo "Using netplan file: $NETPLAN_FILE"
echo ""

#echo "Setting hostname..."
#hostnamectl set-hostname $NEW_HOSTNAME

echo "Updating /etc/hosts..."
sed -i "s/127.0.1.1.*/127.0.1.1 $NEW_HOSTNAME/g" /etc/hosts

echo "Updating static IP..."
sed -i "s/[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}\/24/$NEW_IP\/24/g" $NETPLAN_FILE

echo "Applying netplan..."
netplan apply

echo "Setting ROS_DOMAIN_ID..."
grep -qxF "export ROS_DOMAIN_ID=$ROS_DOMAIN_ID" ~/.bashrc || echo "export ROS_DOMAIN_ID=$ROS_DOMAIN_ID" >> ~/.bashrc

echo ""
echo "Setup complete."
echo "Please reboot system."

echo "========================================="
