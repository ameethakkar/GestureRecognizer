//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Amee Thakkar on 7/4/18.
//  Copyright © 2018 Amee Thakkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImgView: UIImageView!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action:  #selector(ViewController.tapFunction(sender:)))
        tapGesture.numberOfTapsRequired = 1
        ImgView.addGestureRecognizer(tapGesture)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPressFunction(sender: )))
        longPress.minimumPressDuration = 4
        ImgView.addGestureRecognizer(longPress)
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeAction(sender:)))
        swipeGesture.direction = .left
        ImgView.addGestureRecognizer(swipeGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.pinchAction(sender:)))
        ImgView.addGestureRecognizer(pinchGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.panGesture(sender:)))
        
        ImgView.addGestureRecognizer(panGesture)
    }


    @objc func tapFunction(sender: UITapGestureRecognizer){
        infoLabel.text = "Image View was tapped"
        counter += 1
    }
    
    @objc func longPressFunction(sender: UILongPressGestureRecognizer) {
        infoLabel.text = "Image View was pressed for 4 seconds"
    }
    
    @objc func swipeAction(sender: UISwipeGestureRecognizer) {
        counter = 0
        infoLabel.text = "The counter was reset"
        
    }
    
    @objc func pinchAction(sender: UIPinchGestureRecognizer) {
        
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        
        sender.scale = 1
    }
    
    @objc func panGesture(sender: UIPanGestureRecognizer){
        
        let translation = sender.translation(in: self.view)
        
        let newXlocation = sender.view!.center.x + translation.x
        
        let newYLocation = sender.view!.center.y + translation.y
        
        sender.view?.center = CGPoint(x: newXlocation, y: newYLocation)
        
        sender.setTranslation(.zero, in: self.view)
    }
    
    
    @IBAction func doubleTap(_ sender: UITapGestureRecognizer) {
        
        print("tapped thrice")
    }
}

