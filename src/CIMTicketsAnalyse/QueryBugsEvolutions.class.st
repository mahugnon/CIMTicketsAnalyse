Class {
	#name : #QueryBugsEvolutions,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryBugsEvolutions >> runOn: aCollection [
	^ aCollection reject: [ :ticket | ticket isMisc ]
]
