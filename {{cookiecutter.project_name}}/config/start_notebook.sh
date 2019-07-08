#!/bin/bash

container_name="diffusion_characterization"
image="phimal/projects:diffusioncharacterization"

#First automatically find project directory
cd ../
projectdir=$(pwd)
cd config/

if [ "$(docker ps -aq -f name=$container_name)" ]; then
    echo "Restarting container."
     docker restart $container_name
   else
     if hash nvidia-docker 2>/dev/null; then
        echo 'Starting container with gpu.'
        docker run -d\
        -p 8888:8888 -p 6006:6006 \
        -v $projectdir:/home/working/ \
        --ipc=host \
        --name=$container_name \
        --runtime=nvidia
        $image bash -c "cd /home/working/ && \
        python setup.py develop && \
        jupyter lab --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.token=''"
    else
         echo 'Starting container without gpu.'
         docker run -d\
         -p 8888:8888 -p 6006:6006 \
         -v $projectdir:/home/working/ \
         --ipc=host \
         --name=$container_name \
         $image bash -c "cd /home/working/ && \
         python setup.py develop && \
         jupyter lab --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.token=''"
     fi
fi

# Also create a nice stop script
echo "You can stop this container by running stop_notebook.sh"
echo "docker stop $container_name" > stop_notebook.sh


if [ ! "$(docker ps -a -f name=config_compute_1)" ]; then
    docker-compose restart config_compute_1
   else
    docker-compose up -d
   fi

