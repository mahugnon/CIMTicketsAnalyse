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
		do: [ self
				baselineOfPolyMath: spec;
				baselineOfMaterialDisignLite: spec;
				baselineOfChartJs: spec;
				"baselineOfSeaside: spec;"
				baselineOfScheduler: spec.

			"Packages"
			spec
				package: 'CIMTicketsDataModel';
				package: 'CIMTicketsDataModelUtils';
				package: 'CIMTicketsAnalyseTest';
				package: 'CIMTicketsAnalyse'
					with: [ spec
						requires:
							#('CIMTicketsDataModel' 'PolyMath' 'CIMTicketsDataModelUtils' 'CIMTicketsAnalyseTest' 'Scheduler') ];
				package: 'CIMTicketsAnalyseWeb'
					with: [ spec
						requires: #('ChartJs' 'CIMTicketsAnalyse' 'MaterialDesignLite') ] ]
]

{ #category : #baselines }
BaselineOfCIMTicketsAnalyse >> baselineOfChartJs: spec [
	spec
		baseline: 'ChartJs'
		with: [ spec repository: 'github://DuneSt/ChartJs:v1.x.x/src' ]
]

{ #category : #baselines }
BaselineOfCIMTicketsAnalyse >> baselineOfMaterialDisignLite: spec [
	spec
		baseline: 'MaterialDesignLite'
		with: [ spec repository: 'github://DuneSt/MaterialDesignLite:v2.x.x/src' ]
]

{ #category : #baselines }
BaselineOfCIMTicketsAnalyse >> baselineOfPolyMath: spec [
	spec
		baseline: 'PolyMath'
		with: [ spec repository: 'github://PolyMathOrg/PolyMath:v0.102/src' ]
]

{ #category : #baselines }
BaselineOfCIMTicketsAnalyse >> baselineOfScheduler: spec [
	spec
		baseline: 'Scheduler'
		with: [ spec repository: 'github://seandenigris/Scheduler:master/src' ]
]
