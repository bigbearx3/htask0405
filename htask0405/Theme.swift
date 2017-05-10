//
//  Theme.swift
//  htask0405
//

import UIKit

enum Theme{
    case first(style : Style)
    case second(style : Style)
    case third(style : Style)
    
    /*var values : () -> Style{
        switch self{
        case .first : return( Style())
        case .second : return(Style())
        case .third : return(Style())
        }
    }*/
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
    
    struct SteperStyle{
        let hidden : Bool
    }

    
    let buttonStyle : ButtonStyle
    let labelStyle : LabelStyle
    let imageViewStyle : ImageViewStyle
    let sliderStyle : SliderStyle
    let steperStyle : SteperStyle
}

let themes = [Style(buttonStyle : Style.ButtonStyle(borderWidth: 2, borderColor : UIColor.blue.cgColor, cornerRadius : 4, titleFont : UIFont(name: "Noteworthy", size : 12)!, titleColor: UIColor.red , title : "MyTitle1"),
                    labelStyle :Style.LabelStyle(titleFont : UIFont(name: "Noteworthy", size : 12)!, titleColor: UIColor.green , title : "MyLTitle1"),
                    imageViewStyle : Style.ImageViewStyle(image: #imageLiteral(resourceName: "firefox")),
              sliderStyle : Style.SliderStyle(enable : true),
              steperStyle : Style.SteperStyle(hidden : false)),
              
              Style(buttonStyle : Style.ButtonStyle(borderWidth: 4, borderColor : UIColor.magenta.cgColor, cornerRadius : 8, titleFont : UIFont(name: "Arial", size : 16)!, titleColor: UIColor.orange , title : "MyTitle2"),
                    labelStyle :Style.LabelStyle(titleFont : UIFont(name: "Arial", size : 16)!, titleColor: UIColor.blue , title : "MyLTitle2"),
                    imageViewStyle : Style.ImageViewStyle(image: #imageLiteral(resourceName: "safari")),
                    sliderStyle : Style.SliderStyle(enable : false),
                    steperStyle : Style.SteperStyle(hidden : false)),
              
              Style(buttonStyle : Style.ButtonStyle(borderWidth: 8, borderColor : UIColor.yellow.cgColor, cornerRadius : 16, titleFont : UIFont(name: "Papyrus", size : 20)!, titleColor: UIColor.gray , title : "MyTitle3"),
                    labelStyle :Style.LabelStyle(titleFont : UIFont(name: "Papyrus", size : 20)!, titleColor: UIColor.red , title : "MyTitle3"),
                    imageViewStyle : Style.ImageViewStyle(image: #imageLiteral(resourceName: "chrome")),
                    sliderStyle : Style.SliderStyle(enable : true),
                    steperStyle : Style.SteperStyle(hidden : true))]
