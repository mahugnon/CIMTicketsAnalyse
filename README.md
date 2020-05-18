# CIMTicketsAnalyse
To lead the project:
```Smalltalk
 Metacello new
    	githubUser: 'mahugnon' project: 'CIMTicketsAnalyse' commitish: 'DataFromTomcat' path: 'src';
    	baseline: 'CIMTicketsAnalyse';
	 onConflict: [ :e | e useIncoming ];
        onUpgrade: [ :e | e useIncoming ];
        
    	load
```
[![Build Status](https://travis-ci.com/mahugnon/CIMTicketsAnalyse.svg?branch=DataFromTomcat )](https://travis-ci.com/mahugnon/CIMTicketsAnalyse)
