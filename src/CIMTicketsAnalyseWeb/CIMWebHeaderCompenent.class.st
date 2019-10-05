Class {
	#name : #CIMWebHeaderCompenent,
	#superclass : #WAComponent,
	#category : #'CIMTicketsAnalyseWeb-WebComponentsCore'
}

{ #category : #rendering }
CIMWebHeaderCompenent >> renderContentOn: html [
	html mdlLayout
		with: [ html
				mdlLayoutHeader: [ html
						mdlLayoutHeaderRow: [ html mdlLayoutTitle: 'TicketsDashboard'.
							html mdlLayoutSpacer ] ] ]
]
