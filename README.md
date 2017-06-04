# cs244-pa3

Install prereqs (mahimahi, jq, youtube-dl, gnuplot, python, firefox) or download VM from https://storage.googleapis.com/cs244vm/cs244_pan_vayu.ova

## Prerequisites:

1. Install VirtualBox or another Virtual Machine Manager.
2. Download the VM image from this link.
3. Import the VM image (.ova file) into the VM Manager. For VirtualBox, this can be accomplished by choosing File -> Import Appliance
4. (Optional) The VM image has 4 CPU's allocated to it. Change this to half the number of CPU's on the physical machine. On VirtualBox, this can be done by right clicking the machine name and choosing Settings->System->Processor and picking the number of processors
5. Start the VM. Password is password
6. Use xrandr to check the resolution. Ensure it is at least 1280x1024. If it is not, adjust settings in the virtual machine to adjust the resolution
7. To run the experiments, the VM requires access to the internet with at least 5Mb/s throughput. A wired link is preferable, but not necessary

## Replicating experiments

Open up the LXTerminal Application and cd ~/cs244-pa3/mahimahi
Follow the below instructions to replicate our figures:

1. Figure 1: ./run.sh vimeo
2. When browser opens up, maximize the video screen and hit play
3. Wait for at least 180 seconds. Optionally, you can use ALT+TAB to confirm that there are three downlink graphs open between before the 140 seconds time mark. These track the throughput of the browser, the direct download, and the combined link
4. Pause the video, hit escape to exit full-screen
5. Right click in the developer tools network section and click "Save All as HAR"
6. Save to ~/cs244-pa3/mahimahi/data/vimeo.har  . Be sure to save in the data folder - it is easy to save to the wrong path. Exit the browser
7. After you exit the browser, if everything went smoothly, then the graph will be generated in the figures directory. Otherwise, examine the output for errors. One issue that we have noted with replication is that there is no internet connectivity in mahimahi shells that are newly spawned through mm-link. To mitigate the effect of this issue, we test network connectivity with ping once mm-link spawns a shell, and if we cannot establish a connection, we fail the experiment with descriptive output. If you see this happening, interrupt the execution of the experiment with CTRL+C, then run ./scripts/cleanup.sh, and then rerun the experiment to generate the figure. Additionally, make sure not to suspend or try to exit the VM while the experiment is in progress as this can affect the timing computations. The graphs should be saved in ~/cs244-pa3/mahimahi/figures/vimeo_combined.png . A shortcut to the figures folder is accessible through the desktop.
