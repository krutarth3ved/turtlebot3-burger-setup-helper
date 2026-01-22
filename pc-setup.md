# Use ROS2 humble through docker (To be updated)


- *https://docs.ros.org/en/humble/How-To-Guides/Run-2-nodes-in-single-or-separate-docker-containers.html*
- *https://hub.docker.com/_/ros*

Commands to connect with docker 

- save current container progress/changes in an image file for reuse
```bash
docker commit romantic_wright turtlebot_temp_image
```

- create a interactive terminal with network permission
  
```bash
  docker run -it --network host --privileged turtlebot_temp_image
```

- See the docker containers

```bash
docker ps -a
```
- Remove the docker container if it's not used
```bash
docker rm 624cf00b77bf
```
- Attach the docker container
```bash
docker start -ai practical_shannon
```
- If you want to use the same docker in other terminal use
```bash
docker exec -it practical_shannon bash
```
- Then for turtlebot 3 go for this command
```
apt install -y ros-$ROS_DISTRO-turtlebot3-msgs \
               ros-$ROS_DISTRO-turtlebot3 \
               ros-$ROS_DISTRO-turtlebot3-simulations \
               ros-$ROS_DISTRO-navigation2 \
               ros-$ROS_DISTRO-nav2-bringup \
               ros-$ROS_DISTRO-slam-toolbox
```

- TurtleBot code for checking
```bash
ros2 launch turtlebot3_cartographer cartographer.launch.py use_sim_time:=True
ros2 run turtlebot3_teleop teleop_keyboard
ros2 launch gazebo_ros gazebo.launch.py gui:=false
```
- Docker copying file to desktop
```bash
docker cp practical_shannon:/frames_2026-01-19_07.07.38.pdf ~/Desktop/
```
- Docker attach the container to another one  
```bash
docker commit practical_shannon turtlebot_ready
```
- Docker command for full installation with GUI and XE11 Forwarding
```
docker run -it \
  --name turtlebot_stable \
  --network host \
  --privileged \
  --device /dev/dri:/dev/dri \
  --env="DISPLAY=$DISPLAY" \
  --env="QT_X11_NO_MITSHM=1" \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  turtlebot_ready
```

- Docker blind mount to the local device so that Visual Studio Code can be accessed
```bash
