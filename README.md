# last_episode
Script for DLNA servers to create a dummy file indicating the last watched episode in the specified directory at boot. This script is for people who watch series on a DLNA server and constantly forget what episode they left off at.  
  
## Installation
Clone this repository into a directory on your server. Run `./install.sh` as root and specify which directories to check during install. The specified directory must be the directory containing the actual video files as it does not recurse into subdirectories. The install script copies the lastep script into `/bin` and creates a service file based on the inputted directories. It then enables the service to launch at boot.  
  
Example:  
Last watched episode is `show.s01e04.mkv`. When script is run, the following file will be create in the same directory:  
`0_last_episode-show.s01e04.mkv.mp4`
