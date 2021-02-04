Class {
	#name : #CIMWebMainLineBarModel,
	#superclass : #CIMWebAbstractModel,
	#instVars : [
		'modules',
		'selectedModule',
		'modelData',
		'listeners'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebMainLineBarModel class >> resetCurrent [
	<script>
	current := nil.
	^ self current
]

{ #category : #initialization }
CIMWebMainLineBarModel >> database [
	^ CIMDatabase database
]

{ #category : #initialization }
CIMWebMainLineBarModel >> initialize [
	super initialize.
	self initializeModelData.
	self initializeModules.
	self initializeSelectedModule.
	self initializeListeners
]

{ #category : #initialization }
CIMWebMainLineBarModel >> initializeListeners [
	listeners := OrderedCollection new
]

{ #category : #initialization }
CIMWebMainLineBarModel >> initializeModelData [
	modelData := QueryBugsEvolutions
		runOn: (CIMTicketGroupNode new tickets: self database tbl_ft rows)
]

{ #category : #initialization }
CIMWebMainLineBarModel >> initializeModules [
	modules := self database tbl_module rows
]

{ #category : #initialization }
CIMWebMainLineBarModel >> initializeSelectedModule [
	selectedModule := self database tbl_module moduleNamed: 'IZY Protect'
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
CIMWebMainLineBarModel >> notifyAll [
	listeners do: #updateSelectedModule
]

{ #category : #accessing }
CIMWebMainLineBarModel >> selectedModule [
	^ selectedModule
]

{ #category : #accessing }
CIMWebMainLineBarModel >> selectedModule: anObject [
	selectedModule := anObject.
	self notifyAll
]

{ #category : #initialization }
CIMWebMainLineBarModel >> subscribe: aModel [
	listeners add: aModel
]
