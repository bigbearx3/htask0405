//
//  ViewController.swift
//  htask0405
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelUpDown: UILabel!
    @IBOutlet weak var labelOnOff: UILabel!
    @IBOutlet weak var imageViewOnOff: UIImageView!
    @IBOutlet weak var labelSteper: UILabel!
    @IBOutlet weak var labelSlider: UILabel!
    @IBOutlet weak var switchImageOnOff: UISwitch!
    @IBOutlet weak var steper: UIStepper!
    @IBOutlet weak var hSlider: UISlider!
    @IBAction func downAction(_ sender: UIButton) {
        labelUpDown.text = "Down"
    }
    
    @IBAction func upAction(_ sender: UIButton) {
        labelUpDown.text = "Up"
    }
    
    @IBAction func OnOffImage(_ sender: UISwitch) {
        labelOnOff.text = switchImageOnOff.isOn ? "On" : "Off"
        imageViewOnOff.isHidden = !switchImageOnOff.isOn
    }
    @IBAction func sliderValueChange(_ sender: UISlider) {
        labelSlider.text = String (hSlider.value)
    }
    
    @IBAction func steperValueChange(_ sender: Any) {
        labelSteper.text = String (steper.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelUpDown.text = ""
        labelOnOff.text = switchImageOnOff.isOn ? "On" : "Off"
        labelSteper.text = String (steper.value)
        labelSlider.text = String (hSlider.value)        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

