//
//  GameViewController.swift
//  RetroGame Collect
//
//  Created by JoseLuis Lara VIllanueva on 7/28/17.
//  Copyright © 2017 Pachuca Inc. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleTxtField: UITextField!
    @IBOutlet weak var consolaTxtField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func photosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    

    @IBAction func CameraTapped(_ sender: Any) {
    }

    @IBAction func addTapped(_ sender: Any) {
    }
    
    
}
