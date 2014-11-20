Tutorial: How to generate trajectories in SUMO
==============================================
Yang Li, Nov 15, 2014

In this tutorial we will use SUMO to generate random trajectories
on a road network stored in the OpenStreetMap format


Step 0:  Install SUMO
-----------------------

You can get SUMO from its official site:

 <http://sourceforge.net/projects/sumo/>

Follow the SUMO wiki to install it:

 <http://sumo.dlr.de/wiki/installing>

Note: to use sumo-gui (for visualizing the traffic simulation, 
but not needed for generating trajectories), see this guide: 

 <http://alibalador.blogspot.com/2013/03/installing-sumo-with-gui-on-ubuntu-1204.html>


Step 1:  Convert OpenStreetMap file to a SUMO network
-----------------------------------------------------

We use the netconvert tool that comes with SUMO to convert a OpenStreetMap 
file (e.g. example/junction4.osm) to a SUMO network. 

    cd sumo-example
    netconvert --osm-files junction4.osm -o junction4.net.xml

This creates a SUMO network file example/junction4.net.xml. See
<http://sumo.dlr.de/wiki/Networks/SUMO_Road_Networks> for more information. 

Step 2:  Generate traffic on a SUMO network
-------------------------------------------

In SUMO, a "trip" refers to a pair of source-destination edges on the road network. 
A "route" refers to the full path (sequence of edges) from source to destination. 
Given a list of trips, one can use a routing software such as DUAROUTER
to generate optimal routes on the network.
<!--
Instead of defining the route (or trip) individually for each vehical in 
the simulation, we can define a route distribution from which we draw the 
traffic.

Here we show two methods to generate route distributions: 1) using the 
randomTrips tool, and 2) manually with an xml file.
-->

**Create random routes**

SUMO contains a random trip generator randomTrips.py located in 
path/to/sumo/tools/trip. The following command calls this program on 
the network we just created with a few useful options.

    python path/to/sumo/tools/trip/randomTrips.py -n junction4.net.xml  \
    -l -o junction4.trips.xml -r junction4_rand.rou.xml -a "type=\"typedist1\"\
     departLane=\"best\" departSpeed=\"max\" departPos=\"random\" " 

* -n network file
* -l or -L: use length or # lanes as edge weight
* -o output trip file
* -r output route file (using duarouter)
* -a additional parameters (need to escape quote)

randomTrips.py writes the random trips in junction4.trips.xml.  
With the "-r" option, it automatically calls DUAROUTER to
convert the trips into routes. 

**Add vehicle type**

In the previous step, we included in the additional parameter 
`type="typedist1"`, which means that all vehicles traversing these routes are drawn
from a vehicle type distribution labeled `typedist1`.
 
We define a simple vehicle type distribution by adding the following 
lines to junction4.rou.xml after the `<routes>` tag. 

    <vTypeDistribution id="typedist1">
        <vType id="type1" accel="0.8" length="5" maxSpeed="70" probability="0.9"/>
        <vType id="type2" accel="1.8" length="15" maxSpeed="50" probability="0.1"/>
    </vTypeDistribution>

The above lines constructs a distribution of two types of vehicles of different
acceleration, length, maximum speed and probability of appearance 
in the simulated traffic. The sum of the probability values needs not to be 1.

Step 3: Create a simulation and generate trajectories
-----------------------------------------------------

To create a SUMO simulation, we first need to define a configuration XML
file. Create file junction4.cfg with the following content

    <configuration>
        <input>
            <net-file value="junction4.net.xml"/>
            <route-files value="junction4.rou.xml"/>
            <gui-settings-file value="settings.xml"/>
        </input>
        <time>
            <begin value="0"/>
            <end value="600"/>
        </time>
    </configuration>

Note that the tag `<gui-settings-file>` is only needed for sumo-gui. 
A GUI setting file stores viewing options such as viewport and delay. A minimum
setting file is the following:
    <viewsettings> 
        <delay value="100"/>
    </viewsettings>

The simulation can be viewed using sumo-gui -c [configuration file]. e.g.
    sumo-gui -c junction4.cfg
    
Use the `-fcd-output` option to output vehicle trajectories in .fcd.xml format.
    sumo -c junction4.cfg --fcd-output junction4_trajectories.xml

The syntax of fcd.xml is documented here: 
<http://sumo.dlr.de/wiki/Simulation/Output/FCDOutput>


Step 4: Convert FCD trajectories to PBF
---------------------------------------

See [README.md](README.md) 

<!--
**Manually define routes**
There are many ways to manually define routes in SUMO, see 
<http://sumo.dlr.de/wiki/Definition_of_Vehicles,_Vehicle_Types,_and_Routes> for
 a complete list.

Here we show a minimal example to define routes. Create a file called 
junction4.rou.xml with the following content:
  

-------------------------------------------
and destinations of 
-->



