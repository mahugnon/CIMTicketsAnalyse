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
				baselineSmaCC: spec;
				baselineOfScheduler: spec.

			"Packages"
			spec
				package: 'CIMTicketsDataModel';
				package: 'CIMTicketsDataModelUtils';
				package: 'CIMTicketsAnalyseTest';
				package: 'CIMTicketsAnalyse'
					with: [ spec
						requires:
							#('CIMTicketsDataModel' 'PolyMath' 'CIMTicketsDataModelUtils' 'CIMTicketsAnalyseTest' 'Scheduler' 'SmaCC') ];
				package: 'CIMTicketsAnalyseWeb'
					with: [ spec
						requires: #('ChartJs' 'CIMTicketsAnalyse' 'MaterialDesignLite') ] ]
]

{ #category : #baselines }
BaselineOfCIMTicketsAnalyse >> baselineOfChartJs: spec [
	spec
		baseline: 'ChartJs'
		with: [ spec repository: 'github://mahugnon/ChartJs:ChartJS2.8/src' ]
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

{ #category : #baselines }
BaselineOfCIMTicketsAnalyse >> baselineOfSeaside: spec [
	spec
		baseline: 'Seaside3'
		with: [ spec repository: 'github://SeasideSt/Seaside:v3.2.1/repository' ]
]

{ #category : #baselines }
BaselineOfCIMTicketsAnalyse >> baselineOfVoyage: spec [
	spec
		baseline: 'Voyage'
		with: [ spec repository: 'github://pharo-nosql/voyage/mc:master' ]
]

{ #category : #baselines }
BaselineOfCIMTicketsAnalyse >> baselineSmaCC: spec [
	spec
		baseline: 'SmaCC'
		with: [ spec repository: 'github://SmaCCRefactoring/SmaCC' ]
]
