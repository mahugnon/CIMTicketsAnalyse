Class {
	#name : #CIMWebFooterCompenent,
	#superclass : #WAComponent,
	#category : #'CIMTicketsAnalyseWeb-WebComponents'
}

{ #category : #rendering }
CIMWebFooterCompenent >> renderContentOn: html [
	html
		mdlMiniFooter: [ html
				mdlMiniFooterLeftSection: [ html mdlLogo: 'HOUEKPETODJI Honoré'.
					html
						mdlMiniFooterLinkList: [ html listItem: [ html anchor: 'Github' ] ] ] ]
]
