//
//  ReverseGeocodingView.swift
//  AdvancedMap.Swift
//
//  Created by Aare Undo on 06/07/2017.
//  Copyright © 2017 CARTO. All rights reserved.
//

import Foundation

class ReverseGeocodingView : BaseGecodingView {
 
    convenience init() {
        self.init(frame: CGRect.zero)
        
        initializeGeocodingView(popupTitle: Texts.reverseGeocodingInfoHeader, popupDescription: Texts.reverseGeocodingInfoContainer)
    }
}