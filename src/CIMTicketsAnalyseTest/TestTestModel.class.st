Class {
	#name : #TestTestModel,
	#superclass : #CIMAbstractModelTest,
	#category : #CIMTicketsAnalyseTest
}

{ #category : #tests }
TestTestModel >> testJoinTpsToTest [
	self
		assertCollection: ((tests joinTpsToTest: tps) rows flatCollect: #tps)
		hasSameElements:
			{tps rows first.
			tps rows second.
			tps rows third}
]
