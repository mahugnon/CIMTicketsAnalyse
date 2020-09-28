Class {
	#name : #CIMWebModuleModelInitializer,
	#superclass : #Object,
	#category : #'CIMTicketsAnalyseWeb-SetUp'
}

{ #category : #initialization }
CIMWebModuleModelInitializer class >> resetModels [
	<script>
	^ self new resetModels
]

{ #category : #initialization }
CIMWebModuleModelInitializer >> resetModels [
	CIMWebMainLineBarModel resetCurrent.
	CIMWebModuleAbstractModel subclassesDo: #resetCurrent. 
	CIMWebEstimationModel resetCurrent
]
