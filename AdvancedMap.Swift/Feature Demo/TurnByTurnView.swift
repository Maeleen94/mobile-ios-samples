//
//  TurnByTurnView.swift
//  AdvancedMap.Swift
//
//  Created by Aare Undo on 09/10/2017.
//  Copyright © 2017 CARTO. All rights reserved.
//

import Foundation

class TurnByTurnView : PackageDownloadBaseView {
    
    var baseLayer: NTCartoOnlineVectorTileLayer!
    
    convenience init() {
        self.init(frame: CGRect.zero)
        
        initialize()
        initializeDownloadContent(withSwitch: false)
        initializePackageDownloadContent()
        
        addBanner(visible: true)
        
        baseLayer = addBaseLayer()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
