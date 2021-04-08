Class {
	#name : #QueryNumberOfDeveloppeurForMonths,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries-Dev'
}

{ #category : #running }
QueryNumberOfDeveloppeurForMonths >> runOn: aCollection for: months [
	^ months
		collect: [ :each | 
			each
				-> (QueryNumberOfDeveloppeurForAmonth new runOn: aCollection for: each) ]
]
