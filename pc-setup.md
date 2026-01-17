# Use ROS2 humble through docker (To be updated)


- *https://docs.ros.org/en/humble/How-To-Guides/Run-2-nodes-in-single-or-separate-docker-containers.html*
- https://hub.docker.com/_/ros

4 commands to connect with docker 

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
- 
