Class {
	#name : #QuereyAvgTicketsTimeDev,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QuereyAvgTicketsTimeDev >> runOn: aCollection [
	^ ((QuereyAvgTicketsTimeDev new runOn: aCollection)
		/ aCollection size) asFloat
]
