# CIMTicketsAnalyse
To lead the project:
```Smalltalk
 Metacello new
    	githubUser: 'mahugnon' project: 'CIMTicketsAnalyse' commitish: 'V1.0' path: 'src';
    	baseline: 'CIMTicketsAnalyse';
	 onConflict: [ :e | e useIncoming ];
        onUpgrade: [ :e | e useIncoming ];
        
    	load
