# CIMTicketsAnalyse
To lead the project:
```Smalltalk
 Metacello new
    	githubUser: 'mahugnon' project: 'CIMTicketsAnalyse' commitish: 'V1.0' path: 'src';
    	baseline: 'CIMTicketsAnalyse';
	 onConflict: [ :e | e useIncoming ];
        onUpgrade: [ :e | e useIncoming ];
        
    	load
```
[![Build Status](https://travis-ci.com/mahugnon/CIMTicketsAnalyse.svg?branch=master)](https://travis-ci.com/mahugnon/CIMTicketsAnalyse)
[![Build Status](https://ci.inria.fr/pharo-contribution/job/PowerBuilderAnalyzeTool/badge/icon)](https://ci.inria.fr/pharo-contribution/job/PowerBuilderAnalyzeTool/)
