Class {
	#name : #QueryNumberOfDevInterventionPerMonth,
	#superclass : #CIMAbstractQuery,
	#instVars : [
		'devs'
	],
	#category : #'CIMTicketsAnalyse-Queries-Dev'
}

{ #category : #accessing }
QueryNumberOfDevInterventionPerMonth >> devs: aTbl_devIzy [ 
	devs := aTbl_devIzy
]

{ #category : #running }
QueryNumberOfDevInterventionPerMonth >> runOn: aCollection [
	^ (aCollection
		collect: [ :each | 
			CIMAverageNode new
				time: each time;
				tickets: each tickets;
				value:
					each tickets size
						/ (QueryNumberOfDeveloppeurForAmonth new runOn: devs for: each time) ])
		asOrderedCollection
]
