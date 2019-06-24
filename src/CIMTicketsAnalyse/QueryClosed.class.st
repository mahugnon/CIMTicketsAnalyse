Class {
	#name : #QueryClosed,
	#superclass : #CIMAbstractQuery,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryClosed >> runOn: aCollection [
	^ aCollection reject: [ :ticket | ticket monthClosing isNil ]
]
