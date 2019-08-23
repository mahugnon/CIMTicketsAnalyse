Class {
	#name : #QueryAllTicketsFiles,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAllTicketsFiles >> runOn: aCollection [
	^ ((aCollection reject: [ :ticket | ticket associatedPhysique isNil ])
		collect: [ :each | each associatedPhysique ]) flatten asBag contents
]
