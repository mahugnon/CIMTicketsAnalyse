Class {
	#name : #CIMWebMainLineBarModel,
	#superclass : #Object,
	#instVars : [
		'modules',
		'selectedModule',
		'modelData'
	],
	#classInstVars : [
		'current'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebMainLineBarModel class >> current [
	current
		ifNil: [ current := self basicNew
				modelData:
					(QueryBugsEvolutions
						runOn: (CIMTicketGroupNode new tickets: Tbl tbl_ft rows));
				initialize ].
	^ current
]

{ #category : #accessing }
CIMWebMainLineBarModel class >> resetCurrent [
	<script>
	current := nil.
	^ self current
]

{ #category : #initialization }
CIMWebMainLineBarModel >> initialize [
	super initialize.
	self initializeModules.
	self initializeSelectedModule
]

{ #category : #initialization }
CIMWebMainLineBarModel >> initializeModules [
	modules := Tbl tbl_Module rows
]

{ #category : #initialization }
CIMWebMainLineBarModel >> initializeSelectedModule [
	selectedModule := Tbl tbl_Module moduleNamed: 'IZY Protect'
]

{ #category : #accessing }
CIMWebMainLineBarModel >> modelData [
	^ modelData
]

{ #category : #modelData }
CIMWebMainLineBarModel >> modelData: aCIMTicketGroupNode [
	modelData := aCIMTicketGroupNode
]

{ #category : #accessing }
CIMWebMainLineBarModel >> modules [
	^ modules
]

{ #category : #accessing }
CIMWebMainLineBarModel >> modules: anObject [
	modules := anObject
]

{ #category : #accessing }
CIMWebMainLineBarModel >> selectedModule [
	^ selectedModule
]

{ #category : #accessing }
CIMWebMainLineBarModel >> selectedModule: anObject [
	selectedModule := anObject
]
