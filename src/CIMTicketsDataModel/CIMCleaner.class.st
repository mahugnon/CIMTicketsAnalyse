Class {
	#name : #CIMCleaner,
	#superclass : #Object,
	#category : #'CIMTicketsDataModel-Utils'
}

{ #category : #'as yet unclassified' }
CIMCleaner >> izyProtectFilesFrom: aFolder [
	^ aFolder asFileReference directories
		collect: [ :dir | 
			(dir basename asLowercase copyReplaceAll: '.pbl.src' with: '')
				-> (dir visibleFiles collect: [ :file | file basename ]) ]
]
