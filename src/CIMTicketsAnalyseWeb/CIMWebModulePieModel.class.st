Class {
	#name : #CIMWebModulePieModel,
	#superclass : #CIMWebAbstractModel,
	#instVars : [
		'percentModuleTime',
		'modelData',
		'modules'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #initialization }
CIMWebModulePieModel class >> resetCurrent [
	<script>
	current := nil.
	self current
]

{ #category : #initialization }
CIMWebModulePieModel >> initialize [
	self initializeModelData.
	self initializeModules.
	self initializePercentModuleTime
]

{ #category : #initialization }
CIMWebModulePieModel >> initializeModelData [
	modelData := CIMWebMainLineBarModel current modelData
]

{ #category : #initialization }
CIMWebModulePieModel >> initializeModules [
	modules := CIMWebMainLineBarModel current modules
]

{ #category : #'private - utility' }
CIMWebModulePieModel >> initializePercentModuleTime [
	| modulesNamesWithTimeSpent totalInDays |
	modulesNamesWithTimeSpent := self moduleGroupByTime.
	totalInDays := (modulesNamesWithTimeSpent collect: #value) sum.
	percentModuleTime := (modulesNamesWithTimeSpent
		collect: [ :ass | 
			ass key
				-> (ass value * 100 / totalInDays printShowingDecimalPlaces: 2) asNumber ])
		select: [ :ass | ass value >= 2 ]
]

{ #category : #'private - utility' }
CIMWebModulePieModel >> moduleGroupByTime [
	^ (((modules reject: [ :each | each nom = 'IZY Protect' ])
		collect: [ :module | 
			module nom
				->
					(QueryTicketsTimeDev
						runOn:
							(QueryBugsEvolutions
								runOn: (CIMTicketGroupNode new tickets: module tickets))) ])
		sorted: [ :a :b | a value > b value ]) asOrderedCollection
]

{ #category : #'private - utility' }
CIMWebModulePieModel >> percentModuleTime [
	^ percentModuleTime
]
