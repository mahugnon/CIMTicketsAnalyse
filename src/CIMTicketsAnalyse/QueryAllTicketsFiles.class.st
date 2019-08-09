Class {
	#name : #QueryAllTicketsFiles,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryAllTicketsFiles >> runOn: aCollection [
	^ ((aCollection reject: [ :ticket | ticket associatedFiles isNil ])
		collect: [ :each | each associatedFiles ]) flatten asBag contents
]
