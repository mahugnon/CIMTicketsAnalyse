# CIMTicketsAnalyse
To lead the project:
```Smalltalk
 Metacello new
    	githubUser: 'mahugnon' project: 'CIMTicketsAnalyse' commitish: 'master' path: 'src';
    	baseline: 'CIMTicketsAnalyse';
	 onConflict: [ :e | e useIncoming ];
        onUpgrade: [ :e | e useIncoming ];
        
    	load
```
# Installation on linux server without gui (headless)
```bash
#!/usr/bin/env bash
set -vx
export path_to_pharo=~/cimdashboard/app
export pharo_version=70

# Make sure the installation directory is empty
rm-rf $path_to_pharo
mkdir -p $path_to_pharo
cd $path_to_pharo

#Close all screen named dashboard
screen -S ticketsDashboard -X quit

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

# Set default server port
./pharo  TicketsDashboard.image eval --save "(ZnServer defaultOn: 8792)
   logToTranscript;
   start" &
   
# Run the image in a virtual screen
# Set up the scheduler to load data from database once per month
screen -Sdm ticketsDashboard ./pharo  TicketsDashboard.image eval --no-quit "CIMDatabase scheduleUpdate"
```



[![Build Status](https://travis-ci.com/mahugnon/CIMTicketsAnalyse.svg?branch=master)](https://travis-ci.com/mahugnon/CIMTicketsAnalyse)
[![Build Status](https://ci.inria.fr/pharo-contribution/job/CIMTicketDashboard/badge/icon)](https://ci.inria.fr/pharo-contribution/job/CIMTicketDashboard/)
