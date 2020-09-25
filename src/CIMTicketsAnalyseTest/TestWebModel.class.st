Class {
	#name : #TestWebModel,
	#superclass : #CIMAbstractModelTest,
	#instVars : [
		'evol',
		'bug'
	],
	#category : #CIMTicketsAnalyseTest
}

{ #category : #running }
TestWebModel >> setUp [
	super setUp.
	evol := OrderedCollection new
		add:
			(CIMAverageNode new
				time: 2004;
				value: 1;
				yourself);
		add:
			(CIMAverageNode new
				time: 2005;
				value: 3;
				yourself);
		yourself.
	bug := OrderedCollection new
		add:
			(CIMAverageNode new
				time: 2003;
				value: 5;
				yourself);
		add:
			(CIMAverageNode new
				time: 2006;
				value: 10;
				yourself);
		yourself
]

{ #category : #tests }
TestWebModel >> testMergeXEvolutionsWithXBugs [
	| model x |
	model := MockWebModel new
		bugs: bug;
		evolutions: evol;
		yourself.
	x := model synchronizeXEvolWithxBugs.
	self
		assertCollection: x
		hasSameElements: {2003 . 2004 . 2005 . 2006} asOrderedCollection.
	self
		assert: (model bugs detect: [ :e | e time = 2004 ]) value
		equals: 0.
	self
		assert: (model bugs detect: [ :e | e time = 2005 ]) value
		equals: 0.
	self
		deny: (model bugs detect: [ :e | e time = 2003 ]) value
		equals: 0.
	self
		assert:
			(model evolutions detect: [ :e | e time = 2003 ] ifNone: [ nil ])
				value
		equals: 0.
	self
		assert: (model evolutions detect: [ :e | e time = 2006 ]) value
		equals: 0.
	self
		deny: (model evolutions detect: [ :e | e time = 2004 ]) value
		equals: 0
]
