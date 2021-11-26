#!/bin/sh
#sudo ./installsensor.sh ActivationId=be2bcfe0-21dd-4108-ab9f-26976c435ed7 CustomerId=dd6ac00f-cac2-5630-82f9-44cb9fcee66c Storage=/usr/local/qualys/sensor/data -s -c
sudo docker rm -f /qualys-container-sensor-dd6ac00f-cac2-5630-82f9-44cb9fcee66c

sudo docker run -d --restart on-failure -v /var/run:/var/run -v /usr/local/qualys/sensor/data:/usr/local/qualys/qpa/data -e ACTIVATIONID=be2bcfe0-21dd-4108-ab9f-26976c435ed7 -e CUSTOMERID=dd6ac00f-cac2-5630-82f9-44cb9fcee66c -e POD_URL=https://cmsqagpublic.qg2.apps.qualys.com/ContainerSensor --net=host --name qualys-container-sensor-dd6ac00f-cac2-5630-82f9-44cb9fcee66c qualys/qcs-sensor:latest --cicd-deployed-sensor
