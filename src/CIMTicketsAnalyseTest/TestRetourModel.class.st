Class {
	#name : #TestRetourModel,
	#superclass : #CIMAbstractModelTest,
	#category : #CIMTicketsAnalyseTest
}

{ #category : #tests }
TestRetourModel >> testJoinCCTypeRetourToRetour [
	self
		deny:
			(retours joinCcTypeRetourToRetour: typeRetours) rows first
				ccTypeRetour isEmpty
]

{ #category : #tests }
TestRetourModel >> testJoinDevTypeRetourToRetour [
	self
		deny:
			(retours joinDevTypeRetourToRetour: typeRetours) rows first
				devTypeRetour isEmpty
]

{ #category : #tests }
TestRetourModel >> testJoinTypeRetourToRetour [
	retours joinTypeRetoursToRetours: typeRetours.
	self deny: retours rows first ccTypeRetour isEmpty.
	self deny: retours rows first devTypeRetour isEmpty
]
