Class {
	#name : #CIMWebModuleModelInitialize,
	#superclass : #Object,
	#category : #'CIMTicketsAnalyseWeb-SetUp'
}

{ #category : #initialization }
CIMWebModuleModelInitialize class >> resetModels [
	<script>
	self new resetModels
]

{ #category : #initialization }
CIMWebModuleModelInitialize >> resetModels [
	CIMWebMainLineBarModel resetCurrent.
	CIMWebAbstractModel subclassesDo: #resetCurrent.
	CIMWebEstimationModel resetCurrent
]
