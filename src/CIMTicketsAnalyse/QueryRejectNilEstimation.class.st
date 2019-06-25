Class {
	#name : #QueryRejectNilEstimation,
	#superclass : #QueryCleanData,
	#category : #'CIMTicketsAnalyse-Queries'
}

{ #category : #'as yet unclassified' }
QueryRejectNilEstimation >> rejectWrongEstimDate: aCollection [
	^ aCollection
		select: [ :ft | ft tpsEstim ~= '' and: [ ft tpsEstim isNotNil ] ]
]

{ #category : #'as yet unclassified' }
QueryRejectNilEstimation >> rejectWrongTotalDate: aCollection [
	^ aCollection
		select: [ :ft | ft totalTps ~= '' and: [ ft totalTps isNotNil ] ]
]

{ #category : #running }
QueryRejectNilEstimation >> runOn: aCollection [
	^ self
		rejectWrongTotalDate: (self rejectWrongEstimDate: (super runOn: aCollection))
]
