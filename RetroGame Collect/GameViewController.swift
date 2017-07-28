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
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    
    var imagePicker = UIImagePickerController()
    var game : Game? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        if game != nil {
            titleTxtField.text = game?.title
            consolaTxtField.text = game?.consola
            image.image = UIImage(data: game!.picture! as Data)
            add.setTitle("Update", for: .normal)
            deleteBtn.isHidden = false
        } else {
            print("no Game!")
        }
        

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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
       let gameImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        image.image = gameImage
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func CameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func addTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let game =  Game(context: context)
        game.title = titleTxtField.text
        game.consola = consolaTxtField.text
        game.picture = UIImagePNGRepresentation(image.image!)! as NSData
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
}
