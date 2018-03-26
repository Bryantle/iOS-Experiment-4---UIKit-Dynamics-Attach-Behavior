//
//  ViewController.swift
//  iOS Experiment 4 - UIKit Dynamics Attach Behavior
//
//  Created by mac on 3/26/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var anchorPoint: CGPoint!
    var attachment: UIAttachmentBehavior!
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    
    @IBOutlet weak var smallView: UIView!
    @IBOutlet weak var redView: UIView!
    @IBAction func handleTap(_ sender: UITapGestureRecognizer) {
        attachment.anchorPoint = sender.location(in: view)
        smallView.center = sender.location(in: view)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 1
        anchorPoint = smallView.center
        
        // 2
        attachment = UIAttachmentBehavior(item: redView, attachedToAnchor: anchorPoint)
        attachment.length = 100
        attachment.frequency = 10
        attachment.damping = 5
        
        // 3
        animator = UIDynamicAnimator(referenceView: view)
        animator.addBehavior(attachment)
        
        // 4
        gravity = UIGravityBehavior(items: [redView])
        animator.addBehavior(gravity)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

