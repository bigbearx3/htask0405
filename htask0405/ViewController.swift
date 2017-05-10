//
//  ViewController.swift
//  htask0405
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var segmentControlTheme: UISegmentedControl!
    @IBOutlet weak var labelUpDown: UILabel!
    @IBOutlet weak var buttonUpDown: UIButton!
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
    
    @IBAction func swittchTheme(_ sender: UISegmentedControl) {
       setTheme(style: themes[segmentControlTheme.selectedSegmentIndex])        
    }
    
    private func setTheme(style : Style){
        buttonUpDown.layer.borderWidth = CGFloat(style.buttonStyle.borderWidth)
        buttonUpDown.layer.borderColor = style.buttonStyle.borderColor
        buttonUpDown.layer.cornerRadius = CGFloat(style.buttonStyle.cornerRadius)    
        buttonUpDown.titleLabel?.font = style.buttonStyle.titleFont
        buttonUpDown.titleLabel?.textColor = style.buttonStyle.titleColor
        buttonUpDown.titleLabel?.text = style.buttonStyle.title
        
        labelUpDown.font = style.labelStyle.titleFont
        labelUpDown.textColor = style.labelStyle.titleColor
        labelUpDown.text = style.labelStyle.title
        
        labelOnOff.font = style.labelStyle.titleFont
        labelOnOff.textColor = style.labelStyle.titleColor
        labelOnOff.text = style.labelStyle.title
        
        labelSteper.font = style.labelStyle.titleFont
        labelSteper.textColor = style.labelStyle.titleColor
        labelSteper.text = style.labelStyle.title
        
        labelSlider.font = style.labelStyle.titleFont
        labelSlider.textColor = style.labelStyle.titleColor
        labelSlider.text = style.labelStyle.title
        
        imageViewOnOff.image = style.imageViewStyle.image
        
        hSlider.isEnabled = style.sliderStyle.enable
        
        steper.isHidden = style.steperStyle.hidden
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelUpDown.text = ""
        labelOnOff.text = switchImageOnOff.isOn ? "On" : "Off"
        labelSteper.text = String (steper.value)
        labelSlider.text = String (hSlider.value)
        setTheme(style: themes[segmentControlTheme.selectedSegmentIndex])
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

