Class {
	#name : #QueryIterrestingFileNames,
	#superclass : #CIMAbstractQuery,
	#instVars : [
		'limit'
	],
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #running }
QueryIterrestingFileNames >> runOn: aDictionary [
	^ aDictionary keys
		select: [ :fileName | (aDictionary at: fileName) > 200 ]
]
