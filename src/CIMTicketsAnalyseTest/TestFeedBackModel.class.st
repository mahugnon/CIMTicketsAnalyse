Class {
	#name : #TestFeedBackModel,
	#superclass : #CIMAbstractModelTest,
	#category : #CIMTicketsAnalyseTest
}

{ #category : #tests }
TestFeedBackModel >> testJoinTicketsToFeedBacks [
	self
		deny: (retours joinTicketsToRetour: tickets) rows first tickets isEmpty
]
