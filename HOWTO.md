Tutorial: How to generate trajectories in SUMO
==============================================
Yang Li, Nov 15, 2014

In this tutorial we will use SUMO to generate random trajectories
on a road network stored in the OpenStreetMap format

############################################################################# 
Step 0:  Install SUMO
############################################################################# 

You can get SUMO from its official site:

 [url]

Follow the SUMO wiki to install it:

 [url]

Note: to use sumo-gui (for visualizing the traffic simulation, 
but not needed for generating trajectories), see this guide: 

 http://alibalador.blogspot.com/2013/03/installing-sumo-with-gui-on-ubuntu-1204.html


############################################################################# 
Step 1:  Convert OpenStreetMap file to a SUMO network
############################################################################# 

We use the netconvert tool that comes with SUMO to convert a OpenStreetMap 
file (e.g. example/junction4.osm) to a SUMO network. 

 cd example;
 netconvert --osm-files junction4.osm -o junction4.net.xml

############################################################################# 
Step 2:  Generate traffic on a SUMO network
############################################################################# 

We can generate traffic on the SUMO network either manually or using the 
random route generator tool in SUMO.

=== RANDOM ROUTE ===



=== defining source
and destinations of 



