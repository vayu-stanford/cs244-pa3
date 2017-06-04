# cs244-pa3

Install prereqs (mahimahi, jq, youtube-dl, gnuplot, python, firefox) or download VM from https://storage.googleapis.com/cs244vm/cs244_pan_vayu.ova

Prerequisites:

Install VirtualBox or another Virtual Machine Manager.
Download the VM image from this link.
Import the VM image (.ova file) into the VM Manager. For VirtualBox, this can be accomplished by choosing File -> Import Appliance
(Optional) The VM image has 4 CPU's allocated to it. Change this to half the number of CPU's on the physical machine. On VirtualBox, this can be done by right clicking the machine name and choosing Settings->System->Processor and picking the number of processors
Start the VM. Password is password
Use xrandr to check the resolution. Ensure it is at least 1280x1024. If it is not, adjust settings in the virtual machine to adjust the resolution
To run the experiments, the VM requires access to the internet with at least 5Mb/s throughput. A wired link is preferable, but not necessary
Replicating experiments

Open up the LXTerminal Application and cd ~/cs244-pa3/mahimahi
Follow the below instructions to replicate our figures:
Figure 1:
./run.sh vimeo
When browser opens up, maximize the video screen and hit play
Wait for at least 180 seconds. Optionally, you can use ALT+TAB to confirm that there are three downlink graphs open between before the 140 seconds time mark. These track the throughput of the browser, the direct download, and the combined link
Pause the video, hit escape to exit full-screen
Right click in the developer tools network section and click "Save All as HAR"
Save to ~/cs244-pa3/mahimahi/data/vimeo.har  . Be sure to save in the data folder - it is easy to save to the wrong path.
 Exit the browser
After you exit the browser, if everything went smoothly, then the graph will be generated in the figures directory. Otherwise, examine the output for errors. One issue that we have noted with replication is that there is no internet connectivity in mahimahi shells that are newly spawned through mm-link. To mitigate the effect of this issue, we test network connectivity with ping once​ ​mm-link spawns a shell, and if we cannot establish a connection, we fail the experiment with descriptive output. If you see this happening, interrupt the execution of the experiment with CTRL+C, then run ./scripts/cleanup.sh, and then rerun the experiment to generate the figure. Additionally, make sure not to suspend or try to exit the VM while the experiment is in progress as this can affect the timing computations. The graphs should be saved in ~/cs244-pa3/mahimahi/figures/vimeo_combined.png . A shortcut to the figures folder is accessible through the desktop.


2) `cd mahimahi`

3) `./setup_experiment.sh` (this sets up the bottleneck link, and so
only needs to be run once per session)

4) Modify run_experiment.sh to comment/uncomment desired source/URL. The
wait time specifies how long before the direct download from the
competing flow kicks in

5) `./run_experiment.sh`

6) When the firefox window comes up, play the video if it is not being
played. I've noticed it also helps to fullscreen/enlarge the video so
that video bit rate is not resolution limited

7) You can view the throughput graphs in the windows that pop up when
you execute ./run_experiment.sh. There is one for the combined
connection, one for the web client, and another for the competing flow

8) Wait until ~100 seconds have elapsed, then right click in developer
tools network section in firefox, and click "Save all as HAR". Save to
data subdirectory of mahimahi, and call the file 'source.har', where
source is either youtube or vimeo, depending on what you're running.
This saves the http activity to a file, which is used to extract the
video playback rate

9) close firefox, and `pkill youtube-dl`, `pkill firefox` to kill the
processes running under mahimahi

10) run `./generate_graphs.sh source` where source is either vimeo or
youtube, depending on what you're running

11) figure will be generated and stored in figures
