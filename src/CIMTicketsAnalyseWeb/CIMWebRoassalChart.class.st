Class {
	#name : #CIMWebRoassalChart,
	#superclass : #WAComponent,
	#instVars : [
		'roassalRender',
		'model'
	],
	#category : #CIMTicketsAnalyseWeb
}

{ #category : #'as yet unclassified' }
CIMWebRoassalChart >> buildRoassalView [
	^ self subclassResponsibility
]

{ #category : #initialization }
CIMWebRoassalChart >> initialize [
	super initialize.
	model := WebComponentModel new
]

{ #category : #'as yet unclassified' }
CIMWebRoassalChart >> renderContentOn: html [
	self renderRoassal: html
]

{ #category : #'as yet unclassified' }
CIMWebRoassalChart >> renderRoassal: anHtmlRoot [
	| plot |
	roassalRender ifNil: [ roassalRender := RoassalSeaside new ].
	plot := roassalRender render: self buildRoassalView.
	anHtmlRoot tbsContainer
		with: [ anHtmlRoot iframe
				attributeAt: 'width' put: '500';
				attributeAt: 'height' put: '400';
				document: plot mimeType: 'text/html' ]
]
