//
//  Theme.swift
//  htask0405
//

import UIKit

enum Theme{
    case minimal(Style.ButtonStyle)
    case normal(Style.ButtonStyle, Style.LabelStyle)
    case advansed(Style.ButtonStyle, Style.LabelStyle, Style.ImageViewStyle, Style.SliderStyle, Style.StepperStyle)
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

class ThemeChanger{
    private weak var root : UIViewController?
    //private var allViewControllers : [UIViewController] = []
    private var deepChange = false
    
    private func getRoot(viewController : UIViewController)->UIViewController{
        let thisViewController = viewController.parent
        if thisViewController != nil{
            //allViewControllers.append(thisViewController!)
            return getRoot(viewController: thisViewController!)
        }
        else{
            //allViewControllers.append(viewController)
            return viewController
        }
    }
    
    init(current : UIViewController){
        root = getRoot(viewController: current)
    }
    
    private func setButtonStyle(style : Style.ButtonStyle, for button : UIButton){
        button.layer.borderWidth = style.borderWidth
        button.layer.borderColor = style.borderColor
        button.layer.cornerRadius = style.cornerRadius
        button.setTitle(style.title, for: UIControlState.normal)
        button.setTitleColor(style.titleColor, for: UIControlState.normal)
        button.setTitleColor(style.titleColor, for: UIControlState.normal)
    }
    
    private func setButtonTheme(theme : Theme, for button : UIButton){
        switch theme {
        case .minimal(let style ),
             .normal(let style, _),
             .advansed(let style, _, _, _, _):
            setButtonStyle(style: style, for: button)
        }
    }
    
    private func setLabelStyle(style : Style.LabelStyle, for label : UILabel){
        label.font = style.titleFont
        label.textColor = style.titleColor
        label.text = style.title
    }
    
    private func setLabelTheme(theme : Theme, for label : UILabel){
        switch theme {
        case .normal(_, let style),
             .advansed(_, let style, _, _, _):
            setLabelStyle(style: style, for: label)
        default:
            return
        }
    }
    
    private func setImageViewTheme(theme : Theme, for imageView : UIImageView){
        switch theme {
        case .advansed(_, _, let style, _, _):
            setImageViewStyle(style: style, for: imageView)
        default:
            return
        }
    }
    
    private func setSliderTheme(theme : Theme, for slider : UISlider){
        switch theme {
        case .advansed(_, _, _, let style, _):
            setSliderStyle(style: style, for: slider)
        default:
            return
        }
    }
    
    private func setStepperTheme(theme : Theme, for stepper : UIStepper){
        switch theme {
        case .advansed(_, _, _, _, let style):
            setStepperStyle(style: style, for: stepper)
        default:
            return
        }
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
    
    private func setSlyleForUIVievs(style : Style, for views : [UIView]){
        for view in views{
            if deepChange {setSlyleForUIVievs(style : style, for : view.subviews)}
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
    
    private func setThemeForUIViews(theme : Theme, for views : [UIView]){
        for view in views {
            if deepChange {setThemeForUIViews(theme : theme, for : view.subviews)}
            switch view {
            case view where view is UIButton :
                setButtonTheme(theme : theme, for: view as! UIButton)
            case view where view is UILabel :
                setLabelTheme(theme : theme, for: view as! UILabel)
            case view where view is UIImageView :
                setImageViewTheme(theme : theme, for: view as! UIImageView)
            case view where view is UISlider :
                setSliderTheme(theme : theme, for: view as! UISlider)
            case view where view is UIStepper :
                setStepperTheme(theme : theme, for: view as! UIStepper)
            default:
                continue
            }
        }
    }
    
    private func setThemeForViewController(theme : Theme,for current : UIViewController?){
        guard current != nil else{
            return
        }
        for item in current!.childViewControllers{
            setThemeForViewController(theme : theme, for : item)
        }
        setThemeForUIViews(theme : theme, for: current!.view.subviews)
    }
    
    
    private func setStyleForViewController(style : Style,for current : UIViewController?){
        guard current != nil else{
            return
        }
        for item in current!.childViewControllers{
            setStyleForViewController(style: style, for : item)
        }
        setSlyleForUIVievs(style: style, for: current!.view.subviews)
    }
    
    func setTheme(theme : Theme){
        setThemeForViewController(theme : theme, for : root)
    }
    
    func setStyle(style : Style){
        setStyleForViewController(style: style,for: root)
    }
}

let themeKit  : [Theme] = [
    .minimal(Style.ButtonStyle(borderWidth: 2, borderColor : UIColor.blue.cgColor, cornerRadius : 4, titleFont : UIFont(name: "Noteworthy", size : 12)!, titleColor: UIColor.red , title : "MyTitle1")),
    
    .normal(Style.ButtonStyle(borderWidth: 4, borderColor : UIColor.magenta.cgColor, cornerRadius : 8, titleFont : UIFont(name: "Arial", size : 16)!, titleColor: UIColor.orange , title : "MyTitle2"),
            Style.LabelStyle(titleFont : UIFont(name: "Arial", size : 16)!, titleColor: UIColor.blue , title : "MyLTitle2")),
    
    .advansed(Style.ButtonStyle(borderWidth: 8, borderColor : UIColor.yellow.cgColor, cornerRadius : 16, titleFont : UIFont(name: "Papyrus", size : 20)!, titleColor: UIColor.gray , title : "MyTitle3"),
              Style.LabelStyle(titleFont : UIFont(name: "Papyrus", size : 20)!, titleColor: UIColor.red , title : "MyTitle3"),
              Style.ImageViewStyle(image: #imageLiteral(resourceName: "firefox")),
              Style.SliderStyle(enable : true),
              Style.StepperStyle(hidden : true))]

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
