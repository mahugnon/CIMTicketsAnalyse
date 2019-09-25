Class {
	#name : #CIMWebRootCompenent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #CIMTicketsAnalyseWeb
}

{ #category : #testing }
CIMWebRootCompenent class >> canBeRoot [
	^ true
]

{ #category : #'class initialization' }
CIMWebRootCompenent class >> initialize [
	| app |
	app := WAAdmin register: self asApplicationAt: 'TicketsDashboard'.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: MDLLibrary;
		addLibrary: ChartJsLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: TBSDeploymentLibrary.
	(WAAdmin defaultDispatcher handlerAt: 'TicketsDashboard')
		exceptionHandler: WADebugErrorHandler
]

{ #category : #hooks }
CIMWebRootCompenent >> children [
	^ {main}
]

{ #category : #initialization }
CIMWebRootCompenent >> initialize [
	super initialize.
	main := CIMWebDashbordComponent new.
]

{ #category : #rendering }
CIMWebRootCompenent >> renderContentOn: html [
	"TimeProfiler  spyOn: ["

	html render: main	"]"
]

{ #category : #hooks }
CIMWebRootCompenent >> style [
	^ '.mdl-pagination__current{
        box-shadow: inset 0px -4px 0px 0px #689F38 !important;
    }'
]

{ #category : #updating }
CIMWebRootCompenent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'TicketsDashboard'.
	anHtmlRoot stylesheet
		url:
			(WAUrl
				absolute: 'https://code.getmdl.io/1.3.0/material.indigo-blue.min.css')

	"anHtmlRoot stylesheet url: (WAUrl absolute: 'https://storage.googleapis.com/code.getmdl.io/1.3.0/material.deep_purple-pink.min.css')."
]
