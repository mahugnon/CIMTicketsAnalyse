Class {
	#name : #QueryNumberOfDeveloppeurForMonths,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryNumberOfDeveloppeurForMonths >> runOn: aCollection for: months [
	^ months
		collect: [ :each | 
			each
				-> (QueryNumberOfDeveloppeurForAmonth new runOn: aCollection for: each) ]
]
