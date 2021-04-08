Class {
	#name : #QueryInterestingFileNames,
	#superclass : #CIMAbstractQuery,
	#instVars : [
		'limit'
	],
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #accessing }
QueryInterestingFileNames >> limit: anInteger [ 
	limit := anInteger
]

{ #category : #running }
QueryInterestingFileNames >> runOn: aDictionary [
	^ aDictionary keys
		select: [ :fileName | (aDictionary at: fileName) > 200 ]
]
