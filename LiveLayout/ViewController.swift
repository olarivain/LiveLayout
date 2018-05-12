//
//  ViewController.swift
//  LiveLayout
//
//  Created by Eric Chamberlain on 9/5/17.
//  Copyright © 2017 OpenTable. All rights reserved.
//

import Messages
import MessageUI
import UIKit

class ViewController: UIViewController {

    // MARK: Actions
    @IBAction func composeLiveMessage(_ sender: UIButton) {
        
        let templateLayout = MSMessageTemplateLayout()
        templateLayout.caption = "this is my template!"
        templateLayout.subcaption = "it's got subcaptions too."
        templateLayout.image = UIImage(named: "doge")
        
        let liveLayout = MSMessageLiveLayout(alternateLayout: templateLayout)
        let message = MSMessage()
        message.layout = liveLayout
        message.summaryText = "this is a summary"

        let composeViewController = MFMessageComposeViewController()
        composeViewController.message = message
        composeViewController.messageComposeDelegate = self
        
        self.present(composeViewController, animated: true, completion: nil)
    }
    @IBAction func composeTemplateMessage(_ sender: Any) {
        let templateLayout = MSMessageTemplateLayout()
        templateLayout.caption = "this is my template!"
        templateLayout.subcaption = "it's got subcaptions too."
        templateLayout.image = UIImage(named: "doge")

        let message = MSMessage()
        message.layout = templateLayout
        message.summaryText = "this is a summary"
        
        let composeViewController = MFMessageComposeViewController()
        composeViewController.message = message
        composeViewController.messageComposeDelegate = self
        
        self.present(composeViewController, animated: true, completion: nil)
    }
}

// MARK: - MFMessageComposeViewControllerDelegate
extension ViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
}
