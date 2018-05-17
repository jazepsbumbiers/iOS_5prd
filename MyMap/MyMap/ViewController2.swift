//
//  ViewController2.swift
//  MyMap
//
//  Created by Jazeps on 24/04/2018.
//  Copyright © 2018 Jazeps. All rights reserved.
//
import UIKit
import MapKit

protocol VC2Delegate {
    func ChangeAnnotation(_ sender: Bool)
}

class ViewController2: UIViewController {
    
    var delegate: VC2Delegate?
    
    @IBOutlet weak var Switch: UISwitch!
    
    @IBAction func Change(_ sender: UISwitch) {
    
        self.delegate?.ChangeAnnotation(sender.isOn)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Switch.isOn =  UserDefaults.standard.bool(forKey: "switchState")

    }
    @IBAction func saveSwitchPressed(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "switchState")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
