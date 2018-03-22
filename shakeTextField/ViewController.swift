//
//  ViewController.swift
//  shakeTextField
//
//  Created by Appinventiv on 12/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

 
    @IBOutlet weak var carImage: UIImageView!
    
    @IBOutlet weak var userName: shakingTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        carImage.layer.cornerRadius=carImage.layer.bounds.width/2
        userName.delegate=self
        //userName.shake()
    carImage.isUserInteractionEnabled=true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.addPulse))
        tapGesture.numberOfTapsRequired=1
        carImage.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
         userName.shake()
    }
  
    

    
     @objc func addPulse(){
        
        let pulse = Pulsing(numberOfPulses: 1, radius: 110, position: carImage.center)
        pulse.animationDuration=0.8
        pulse.backgroundColor=UIColor.blue.cgColor
        self.view.layer.insertSublayer(pulse, below: carImage.layer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension shakingTextField{
    func shake(){
        let animation = CABasicAnimation()
        animation.duration=0.05
        animation.repeatCount=5
        animation.autoreverses=true
        animation.fromValue=NSValue(cgPoint: CGPoint(x: self.center.x-4, y: self.center.y))
        animation.toValue=NSValue(cgPoint: CGPoint(x: self.center.x+4, y: self.center.y))
        self.layer.add(animation,forKey: "position")
    }
}

