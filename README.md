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
Create `bags` folder in /home on your PC.
Save `dataset.bag` in `bags` folder.

## 4. Check aprilgrid.yaml and imu.yaml in /startup/config folder 
## 5. Start session in the docker container
INTRINSICS PARAMETERS:

Output file `dataset-camchain.yaml` is saved in `/root/bags` folder.
Rename it to `intrinsics.yaml`:
```sh
mv dataset-camchain.yaml intrinsics.yaml
```

EXTRINSICS PARAMETERS:

Output file `dataset-camimuchain.yaml` is saved in `/root/bags` folder.

