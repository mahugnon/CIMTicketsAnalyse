Class {
	#name : #CIMWebLineBarModel,
	#superclass : #Object,
	#instVars : [
		'selectedModule',
		'modelData'
	],
	#classInstVars : [
		'current'
	],
	#category : #'CIMTicketsAnalyseWeb-models'
}

{ #category : #accessing }
CIMWebLineBarModel class >> current [
	current
		ifNil: [ current := self basicNew
				modelData:
					(QueryBugsEvolutions
						runOn: (CIMTicketGroupNode new tickets: Tbl tbl_ft rows));
				initialize ].
	^ current
]

{ #category : #initialization }
CIMWebLineBarModel class >> resetCurrent [
	<script>
	current := nil.
	self current
]

{ #category : #initialization }
CIMWebLineBarModel >> initialize [
	super initialize.
	self initializeSelectedModule
]

{ #category : #initialization }
CIMWebLineBarModel >> initializeSelectedModule [
	selectedModule := Tbl tbl_Module moduleNamed: 'IZY Protect'
]

{ #category : #accessing }
CIMWebLineBarModel >> modelData: aCIMTicketGroupNode [
	modelData := aCIMTicketGroupNode
]

{ #category : #accessing }
CIMWebLineBarModel >> selectedModule [
	^ selectedModule
]

{ #category : #accessing }
CIMWebLineBarModel >> selectedModule: anObject [
	selectedModule := anObject
]
