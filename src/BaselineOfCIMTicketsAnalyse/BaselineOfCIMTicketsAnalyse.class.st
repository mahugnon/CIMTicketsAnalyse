Class {
	#name : #BaselineOfCIMTicketsAnalyse,
	#superclass : #BaselineOf,
	#category : #BaselineOfCIMTicketsAnalyse
}

{ #category : #baselines }
BaselineOfCIMTicketsAnalyse >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self baselineOfPolyMath: spec.
			"Packages"
			spec
				package: 'CIMTicketsDataModel';
				package: 'CIMTicketsAnalyse'
					with: [ spec requires: #('CIMTicketsDataModel' 'PolyMath') ] ]
]

{ #category : #baselines }
BaselineOfCIMTicketsAnalyse >> baselineOfPolyMath: spec [
	spec
		baseline: 'PolyMath'
		with: [ spec repository: 'github://PolyMathOrg/PolyMath:v0.102/src' ]
]
