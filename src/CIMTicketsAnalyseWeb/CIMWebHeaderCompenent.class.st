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
						mdlLayoutHeaderRow: [ html image
								style: 'width: 90px; height: 70px; background-color: white';
								url: (CIMIconLibrary urlOf: 'logocimJpg').
							html space: 100.
							html mdlLayoutTitle: 'Tableau de bord d''analyse de tickets'.
							html space: 50.
							html image
								style: 'width: 75px; height: 70px;';
								url: (CIMIconLibrary urlOf: 'rmodPng') .
								"html space:30.
								self renderMenuOn: html"] ] ]
]

{ #category : #rendering }
CIMWebHeaderCompenent >> renderMenuOn: html [
	html div
		class: 'container';
		with: [ html div
				with: [ html div
						id: #topRightButton;
						with: [ html mdlButton icon with: [ html mdlIcon: #settingsSvg ].
							html text: 'Options' ].
					html mdlMenu
						bottomLeft;
						for: #topRightButton;
						with: [ html mdlMenuItem
								fullBleedDivider;
								with: 'Modules d''Izy Protect'.
							html mdlMenuItem with: 'Début d''Analyse'] ].
			html div class: 'background' ]
]
