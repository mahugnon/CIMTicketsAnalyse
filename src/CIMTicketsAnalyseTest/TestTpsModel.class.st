Class {
	#name : #TestTpsModel,
	#superclass : #CIMAbstractModelTest,
	#category : #CIMTicketsAnalyseTest
}

{ #category : #tests }
TestTpsModel >> testJoinTypeSessionToTps [
	self
		assert:
			(((tps joinTypeSessionToTps: typeSessions) rows
				collect: #typeSession
				as: Set) reject: #isNil) size
		equals: 4
]

{ #category : #tests }
TestTpsModel >> testShouldRecogniseDevTestTps [
	tps joinTypeSessionToTps: typeSessions.
	self assert: (tps rows select: #isDevelopmentTest) size equals: 2.
	self
		assertCollection: (tps rows select: #isDevelopmentTest)
		hasSameElements:
			{tps rows first.
			tps rows second}.
	self
		assertCollection: ((tps rows select: #isDevelopmentTest) collect: #typeSession)
		hasSameElements: {typeSessions rows first}
]

{ #category : #tests }
TestTpsModel >> testSouldRecogniseDevTps [
	tps joinTypeSessionToTps: typeSessions.
	self assert: (tps rows select: #isDevelopment) size equals: 3.
	self
		assertCollection: (tps rows select: #isDevelopment)
		hasSameElements:
			{tps rows third.
			tps rows fifth.
			tps rows sixth}.
	self
		assertCollection: ((tps rows select: #isDevelopment) collect: #typeSession as: Set)
		hasSameElements:
			{typeSessions rows second.
			typeSessions rows fourth}
]
