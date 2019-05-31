Class {
	#name : #CIMFileLoader,
	#superclass : #Object,
	#category : #'CIMTicketsDataModel-Utils'
}

{ #category : #'as yet unclassified' }
CIMFileLoader >> loadBiothequesFromNamesFolder: aFolder [
	^ aFolder asFileReference visibleFiles
		collect: [ :aFile | 
		('cwm_',('.'split: 	aFile basename) first) 
				->
					((CSVParser parseFileWithHeader: aFile)
						collectAsSet: [ :each | each at: 'bib' ]) ]
]