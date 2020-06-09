Class {
	#name : #CIMFileLoader,
	#superclass : #Object,
	#category : #'CIMTicketsDataModelUtils-DataProcessing'
}

{ #category : #'as yet unclassified' }
CIMFileLoader >> loadBiothequesFromNamesFolder: aFolder [
	^ aFolder asFileReference visibleFiles
		collect: [ :aFile | 
			('cwm_' , ('.' split: aFile basename) first)
				->
					((CSVParser parseFileWithHeader: aFile)
						collect: [ :each | each at: 'bib' ]
						as: Set) ]
]
