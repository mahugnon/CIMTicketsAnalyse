Class {
	#name : #QueryAvgTicketsTimeDev,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAvgTicketsTimeDev >> runOn: aCollection [
	^ ((QueryAvgTicketsTimeDev new runOn: aCollection)
		/ aCollection size) asFloat
]
