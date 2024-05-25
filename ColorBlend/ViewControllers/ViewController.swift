//
//  ViewController.swift
//  ColorBlend
//
//  Created by Vladimir Dmitriev on 25.05.24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var firstColorLabel: UILabel!
    @IBOutlet var secondColorLabel: UILabel!
    @IBOutlet var resultColorLabel: UILabel!
    
    @IBOutlet var firstColorButton: UIButton!
    @IBOutlet var secondColorButton: UIButton!
    
    @IBOutlet var resultColorView: UIView!
    
    var activeButton: UIButton!
    var firstColor: UIColor = .red
    var secondColor:UIColor = .blue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstColorButton.backgroundColor = firstColor
        secondColorButton.backgroundColor = secondColor
        
        updateResultColorLabel()
    }
    
    @IBAction func showColorPicker(_ sender: UIButton) {
        activeButton = sender
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        colorPicker.supportsAlpha = true
        present(colorPicker, animated: true)
    }
}

extension ViewController: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        guard let button = activeButton else { return }
        let selectedColor = viewController.selectedColor
        button.backgroundColor = selectedColor
        
        if button == firstColorButton {
            firstColor = selectedColor
        } else if button == secondColorButton {
            secondColor = selectedColor
        }
        
        updateResultColorLabel()
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        activeButton = nil
    }
}

private extension ViewController {
    
    func updateResultColorLabel() {
        let mixedColor = mixColor(firstColor: firstColor, secondColor: secondColor)
        resultColorView.backgroundColor = mixedColor
    }
    
    func mixColor(firstColor: UIColor, secondColor: UIColor) -> UIColor {
        var redOne: CGFloat = 0
        var greenOne: CGFloat = 0
        var blueOne: CGFloat = 0
        var alfaOne: CGFloat = 0
        
        var redTwo: CGFloat = 0
        var greenTwo: CGFloat = 0
        var blueTwo: CGFloat = 0
        var alfaTwo: CGFloat = 0
        
        firstColor.getRed(&redOne, green: &greenOne, blue: &blueOne, alpha: &alfaOne)
        secondColor.getRed(&redTwo, green: &greenTwo, blue: &blueTwo, alpha: &alfaTwo)
        
        let mixedColor = UIColor(
            red: (redOne + redTwo) / 2,
            green: (greenOne + greenTwo) / 2,
            blue: (blueOne + blueTwo) / 2,
            alpha: (alfaOne + alfaTwo) / 2
        )
        
        return mixedColor
    }
}
