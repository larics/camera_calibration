# camera_calibration
The repository is based on the Kalibr visual-inertial calibration toolbox.

# What to do to calibrate a camera?
## 1. Record dataset
Record dataset following the instructions from [here](https://gist.github.com/aivano/216e867906534db66d70c3f9972e9e3b).
## 2. Build Dockerfile
```sh
git clone git@github.com:larics/camera_calibration.git
cd camera_calibration
./docker_build.sh
```
## 3. Run docker container
The first time:
```sh
./docker_first_run.sh
```
If you already have created the container, then just run:
```sh
./docker_start.sh
```
## 3. Save .bag file in /root/bags
## 4. Check aprilgrid.yaml and imu.yaml from /startup/config folder 
## 5. Start session in the docker container
