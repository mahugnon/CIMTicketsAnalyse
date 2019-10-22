Class {
	#name : #'Tbl_version_news',
	#superclass : #Tbl,
	#category : #'CIMTicketsDataModel-Model'
}

{ #category : #utility }
Tbl_version_news >> rowClass [
	^ Tbl_version_news_row
]

{ #category : #accessing }
Tbl_version_news >> uri [
	^ 'tbl_version_news'
]
