Class {
	#name : #TestTypeRetourModel,
	#superclass : #CIMAbstractModelTest,
	#category : #CIMTicketsAnalyseTest
}

{ #category : #tests }
TestTypeRetourModel >> testJoinRetoursToTypeRetour [
	self
		deny: (typeRetours joinRetoursToTypeRetour: retours) rows isEmpty
]
