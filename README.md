# CIMTicketsAnalyse
To lead the project in a clean pharo image:
```Smalltalk
 Metacello new
    	githubUser: 'mahugnon' project: 'CIMTicketsAnalyse' commitish: 'master' path: 'src';
    	baseline: 'CIMTicketsAnalyse';
	 onConflict: [ :e | e useIncoming ];
        onUpgrade: [ :e | e useIncoming ];
        
    	load
```
# Installation on linux server without gui (headless)
- Clone the repository in the server
- Copy and paste the following script or navigate into the project directory and run `chmod 777 runCentOS8.sh && ./runCentOS8.sh`
```bash
#!/usr/bin/env bash
set -vx
export path_to_pharo=~/cimdashboard/app
export pharo_version=70
export pharo_headless_server="$path_to_pharo/pharo-vm/pharo -vm-display-null -vm-sound-null --memory 512m"

# Make sure the installation directory is empty
rm -rf $path_to_pharo
mkdir -p $path_to_pharo
cd $path_to_pharo

#Close all screen named dashboard
#screen -S ticketsDashboard -X quit

# Download pharo with vm
curl get.pharo.org/64/$pharo_version+vm | bash

# Rename image as TicketsDashboard
./pharo Pharo.image save TicketsDashboard

# load the project baseline and save it
./pharo TicketsDashboard.image eval --save "Metacello new
    	githubUser: 'mahugnon' project: 'CIMTicketsAnalyse' commitish: 'master' path: 'src';
    	baseline: 'CIMTicketsAnalyse';
	 onConflict: [ :e | e useIncoming ];
        onUpgrade: [ :e | e useIncoming ];
        
    	load"
# Prepare the image for production
./pharo  TicketsDashboard.image eval --save "WAAdmin clearAll.
WAAdmin applicationDefaults removeParent:
WADevelopmentConfiguration instance.
WAFileHandler default: WAFileHandler new.
WAFileHandler default
preferenceAt: #fileHandlerListingClass
put: WAHtmlFileHandlerListing.
WAAdmin defaultDispatcher
register: WAFileHandler default
at: 'files'"
   
# Run the image in a virtual screen
# Set up the scheduler to load data from database once per month
# Set default server port
$pharo_headless_server TicketsDashboard.image eval --no-quit 'CIMDatabase scheduleUpdate
(ZnServer defaultOn: 8792) start' &

```



[![Build Status](https://travis-ci.com/mahugnon/CIMTicketsAnalyse.svg?branch=master)](https://travis-ci.com/mahugnon/CIMTicketsAnalyse)
[![Build Status](https://ci.inria.fr/pharo-contribution/job/CIMTicketDashboard/badge/icon)](https://ci.inria.fr/pharo-contribution/job/CIMTicketDashboard/)
![Github Actions build](https://github.com/mahugnon/CIMTicketsAnalyse/workflows/Github%20Actions%20build/badge.svg)
[![Coverage Status](https://coveralls.io/repos/github/mahugnon/CIMTicketsAnalyse/badge.svg)](https://coveralls.io/github/mahugnon/CIMTicketsAnalyse)
