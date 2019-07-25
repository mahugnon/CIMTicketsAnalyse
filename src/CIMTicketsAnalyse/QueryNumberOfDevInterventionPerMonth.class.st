Class {
	#name : #QueryNumberOfDevInterventionPerMonth,
	#superclass : #CIMAbstractQuery,
	#instVars : [
		'devs'
	],
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #accessing }
QueryNumberOfDevInterventionPerMonth >> devs: aTbl_devIzy [ 
	devs := aTbl_devIzy
]

{ #category : #running }
QueryNumberOfDevInterventionPerMonth >> runOn: aDictionary [
	^ (aDictionary keys
		collect: [ :key | 
			key
				->
					((aDictionary at: key) size
						/ (QueryNumberOfDeveloppeurForAmonth new runOn: devs for: key))
						rounded ]) asOrderedDictionary
]
