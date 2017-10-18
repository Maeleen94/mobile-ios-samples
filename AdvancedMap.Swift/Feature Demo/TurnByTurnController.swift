//
//  TurnByTurnController.swift
//  AdvancedMap.Swift
//
//  Created by Aare Undo on 09/10/2017.
//  Copyright © 2017 CARTO. All rights reserved.
//

import Foundation
import CoreLocation

class TurnByTurnController: BaseController, NextTurnDelegate {
    
    let contentView = TurnByTurnView()

    var client: TurnByTurnClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = contentView
        
        client = TurnByTurnClient(mapView: contentView.map)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        contentView.addRecognizers()
        client.onResume()
        client.instructionDelegate = self
        
        let text = "Long click on the map to set a destination"
        contentView.banner.showInformation(text: text, autoclose: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        contentView.removeRecognizers()
        client.onPause()
        client.instructionDelegate = nil
    }
    
    func instructionFound(instruction: NTRoutingInstruction) {
        
        let action = instruction.getAction()
        let distance = instruction.getDistance()
        
        let distanceString = String(describing: distance) + " meters"
        
        var message = ""
        
        // There are actually even more RoutingActions, but I've covered the most prominent ones
        switch (action) {
        case NTRoutingAction.ROUTING_ACTION_ENTER_ROUNDABOUT:
            message = "Enter Roundabout in " + distanceString + " meters"
        case NTRoutingAction.ROUTING_ACTION_FINISH:
            message = "You'll arrive at your destination in " + distanceString + " meters"
        case NTRoutingAction.ROUTING_ACTION_GO_STRAIGHT:
            message = "Go straight for " + distanceString + " meters"
        case NTRoutingAction.ROUTING_ACTION_LEAVE_ROUNDABOUT:
            message = "Leave roundabout in " + distanceString + " meters"
        case NTRoutingAction.ROUTING_ACTION_STAY_ON_ROUNDABOUT:
            message = "Stay on roundabout for " + distanceString + " meters"
        case NTRoutingAction.ROUTING_ACTION_TURN_LEFT:
            message = "Turn left in " + distanceString + " meters"
        case NTRoutingAction.ROUTING_ACTION_TURN_RIGHT:
            message = "Turn right in " + distanceString + " meters"
        case NTRoutingAction.ROUTING_ACTION_UTURN:
            message = "Make a U-Turn in " + distanceString + " meters"
        case NTRoutingAction.ROUTING_ACTION_START_AT_END_OF_STREET:
            message = "Start at the end of the street"
        default:
            break
        }
        
        DispatchQueue.main.async {
            self.contentView.banner.showInformation(text: message, autoclose: false)
        }
        
    }
}



