//
//  ViewController.swift
//  Bull's Eye
//
//  Created by sisitha jayawardhane on 5/7/20.
//  Copyright © 2020 Sisitha Jayawardhane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Target: UILabel!
    @IBOutlet weak var Slider: UISlider!
    @IBOutlet weak var HitMeBtn: UIButton!
    @IBOutlet weak var TotalScore: UILabel!
    @IBOutlet weak var Round: UILabel!
    var round = 0
    var Score = 0
    @IBOutlet weak var InfoView: UIView!
    @IBOutlet var MainView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        InfoView.isHidden = true
        Target.text = String(Int.random(in: 0...100))
        Slider.maximumValue = 100
        Slider.minimumValue = 0
        Slider.value = 50
    }
    
    func title()->String{
        if differ() == 0{
            return "Perfect!"
        }
        else if differ()<=5{
            return "You alomost had it!"
        }
        else if differ()<=10{
            return "Not so bad!"
        }
        else{
            return "Are you even Trying???"
        }
    }
    func differ()->Int{
        abs(Int(Target.text!)! - Int(Slider.value))
    }
    func score()->Int{
        if differ()>10{
            return 0
        }
        else if differ()>5{
            return (100 - differ())}
        else if differ()>0{
            return (100 - differ())+50
        }else{
            return 200
        }
    }
    
    @IBAction func HitMeBtnPressed(_ sender: Any) {
        let alert = UIAlertController.init(title:title(), message: "The Slider's value is \(Int(Slider.value.rounded()))\nYou scored \(score()) points this round", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        alert.addAction(UIAlertAction(title: "Done", style: .cancel, handler:{(_) in
    
            self.Score = self.Score + self.score()
            self.TotalScore.text = "\(self.Score)"
            self.round += 1
            self.Round.text = "\(self.round)"
            print(self.score())
            print(self.Score)
            self.Target.text = String(Int.random(in: 0...100))
            
        }))
    }
    @IBAction func StartOverBtnPressed(_ sender: Any) {
        TotalScore.text = "0"
        Round.text = "0"
        Slider.value = 50
        Target.text = String(Int.random(in: 0...100))
    }
    @IBAction func InnfoBtnPressed(_ sender: Any) {
        InfoView.isHidden = false
        //MainView.isHidden =true
    }
    @IBAction func BackBtnPressed(_ sender: Any) {
        InfoView.isHidden = true
    }
    

}

