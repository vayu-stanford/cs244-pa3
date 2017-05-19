# cs244-pa3

1) Install prereqs (mahimahi, jq, youtube-dl, gnuplot, python, firefox)

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
