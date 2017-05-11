//
//  Theme.swift
//  htask0405
//

import UIKit

enum Theme{
    case first(style : Style)
    case second(style : Style)
    case third(style : Style)
}

class ThemeChanger{
    private weak var root : UIViewController?
    private var allViewControllers : [UIViewController] = []
    private var deepChange = false
    
    private func getRoot(viewController : UIViewController)->UIViewController{
        let thisViewController = viewController.parent
        if thisViewController != nil{
            allViewControllers.append(thisViewController!)
            return getRoot(viewController: thisViewController!)
        }
        else{
            allViewControllers.append(viewController)
            return viewController
        }
    }
    
    var discriptionViewControllers : String{
        var result = ""
        for item in allViewControllers{
            result += item.description + "\n"
        }
        return result
    }
    
    init(currentViewController : UIViewController){
        root = getRoot(viewController: currentViewController)
    }
    
    private func setButtonStyle(style : Style.ButtonStyle, for button : UIButton){
        button.layer.borderWidth = style.borderWidth
        button.layer.borderColor = style.borderColor
        button.layer.cornerRadius = style.cornerRadius
        button.setTitle(style.title, for: UIControlState.normal)
        button.setTitleColor(style.titleColor, for: UIControlState.normal)
        button.setTitleColor(style.titleColor, for: UIControlState.normal)
    }
    
    private func setLabelStyle(style : Style.LabelStyle, for label : UILabel){
        label.font = style.titleFont
        label.textColor = style.titleColor
        label.text = style.title
    }
    
    private func setImageViewStyle(style : Style.ImageViewStyle, for imageView : UIImageView){
        imageView.image = style.image
    }
    
    private func setSliderStyle(style : Style.SliderStyle, for slider : UISlider){
        slider.isEnabled = style.enable
        //slider.isHidden = sliderStyle.hidden
    }
    
    private func setStepperStyle(style : Style.StepperStyle, for stepper : UIStepper){
        //stepper.isEnabled = stepperStyle.enable
        stepper.isHidden = style.hidden
    }
    
    private func setSlyleForUIViev(style : Style, for views : [UIView]){
        for view in views{
            if deepChange {setSlyleForUIViev(style : style, for : view.subviews)}
            switch view {
            case view where view is UIButton :
                setButtonStyle(style: style.buttonStyle, for: view as! UIButton)
            case view where view is UILabel :
                setLabelStyle(style: style.labelStyle, for: view as! UILabel)
            case view where view is UIImageView :
                setImageViewStyle(style: style.imageViewStyle, for: view as! UIImageView)
            case view where view is UISlider :
                setSliderStyle(style: style.sliderStyle, for: view as! UISlider)
            case view where view is UIStepper :
                setStepperStyle(style: style.stepperStyle, for: view as! UIStepper)
            default:
                continue
            }
        }
    }
    
    func setStyle(style : Style){
        for viewController in allViewControllers {
            setSlyleForUIViev(style : style, for : viewController.view.subviews)
        }
    }
}

struct Style{
    struct ButtonStyle{
        let borderWidth : CGFloat
        let borderColor : CGColor
        let cornerRadius : CGFloat
        let titleFont : UIFont
        let titleColor : UIColor
        let title : String
    }
    
    struct LabelStyle {
        let titleFont : UIFont
        let titleColor : UIColor
        let title : String
    }
    
    struct ImageViewStyle{
        let image : UIImage
    }
    
    struct SliderStyle{
        let enable : Bool
    }
    
    struct StepperStyle{
        let hidden : Bool
    }
    
    let buttonStyle : ButtonStyle
    let labelStyle : LabelStyle
    let imageViewStyle : ImageViewStyle
    let sliderStyle : SliderStyle
    let stepperStyle : StepperStyle
}

let themes = [Style(buttonStyle : Style.ButtonStyle(borderWidth: 2, borderColor : UIColor.blue.cgColor, cornerRadius : 4, titleFont : UIFont(name: "Noteworthy", size : 12)!, titleColor: UIColor.red , title : "MyTitle1"),
                    labelStyle :Style.LabelStyle(titleFont : UIFont(name: "Noteworthy", size : 12)!, titleColor: UIColor.green , title : "MyLTitle1"),
                    imageViewStyle : Style.ImageViewStyle(image: #imageLiteral(resourceName: "firefox")),
                    sliderStyle : Style.SliderStyle(enable : true),
                    stepperStyle : Style.StepperStyle(hidden : false)),
              
              Style(buttonStyle : Style.ButtonStyle(borderWidth: 4, borderColor : UIColor.magenta.cgColor, cornerRadius : 8, titleFont : UIFont(name: "Arial", size : 16)!, titleColor: UIColor.orange , title : "MyTitle2"),
                    labelStyle :Style.LabelStyle(titleFont : UIFont(name: "Arial", size : 16)!, titleColor: UIColor.blue , title : "MyLTitle2"),
                    imageViewStyle : Style.ImageViewStyle(image: #imageLiteral(resourceName: "safari")),
                    sliderStyle : Style.SliderStyle(enable : false),
                    stepperStyle : Style.StepperStyle(hidden : false)),
              
              Style(buttonStyle : Style.ButtonStyle(borderWidth: 8, borderColor : UIColor.yellow.cgColor, cornerRadius : 16, titleFont : UIFont(name: "Papyrus", size : 20)!, titleColor: UIColor.gray , title : "MyTitle3"),
                    labelStyle :Style.LabelStyle(titleFont : UIFont(name: "Papyrus", size : 20)!, titleColor: UIColor.red , title : "MyTitle3"),
                    imageViewStyle : Style.ImageViewStyle(image: #imageLiteral(resourceName: "chrome")),
                    sliderStyle : Style.SliderStyle(enable : true),
                    stepperStyle : Style.StepperStyle(hidden : true))]
