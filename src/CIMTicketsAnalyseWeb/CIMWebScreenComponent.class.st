Class {
	#name : #CIMWebScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header',
		'footer'
	],
	#category : #'CIMTicketsAnalyseWeb-WebComponents'
}

{ #category : #hooks }
CIMWebScreenComponent >> children [
	^ {header.
	footer}
]

{ #category : #accessing }
CIMWebScreenComponent >> footer [
	^ footer
]

{ #category : #accessing }
CIMWebScreenComponent >> footer: anObject [
	footer := anObject
]

{ #category : #accessing }
CIMWebScreenComponent >> header [
	^ header
]

{ #category : #accessing }
CIMWebScreenComponent >> header: anObject [
	header := anObject
]

{ #category : #initialization }
CIMWebScreenComponent >> initialize [
	footer := CIMWebFooterCompenent new.
	header := CIMWebHeaderCompenent new.
	
]

{ #category : #hooks }
CIMWebScreenComponent >> renderBodyWebOn: html [
	^ self subclassResponsibility
]

{ #category : #hooks }
CIMWebScreenComponent >> renderContentOn: html [
	html
		mdlLayout: [ html render: self header.
			html mdlLayoutContent
				class: 'mdl-color-text--grey-600 ';
				with: [ html mdlGrid
						noSpacing;
						with: [ html mdlCell
								class: 'container-fluid content';
								size: 12;
								with: [ self renderBodyWebOn: html ] ].
					html render: self footer ] ]
]

{ #category : #hooks }
CIMWebScreenComponent >> style [
	super style.
	^ '
.content {
padding-top:100px;
padding-left:50px
}
.chartJsChart{
width: 100%;
padding-right:0px;
}
'
]
