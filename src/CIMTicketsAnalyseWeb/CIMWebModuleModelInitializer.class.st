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
	| models |
	models := {CIMWebMainLineBarModel.
	CIMWebModuleAbstractModel subclasses.
	CIMWebEstimationModel}.
	[ :job | 
	models
		do: [ :each | 
			job
				progress: (models indexOf: each) / models size;
				title: 'resetting ' , each name , '...'.
			each resetCurrent ] ] asJob run
]
