// По нажатию кнопки экран заполняется разноцветными квадратами с фиксированной стороной. Квадраты не пересекаются

import UIKit

class ViewController: UIViewController {
    
    var fillButton = UIButton()
    var textInputField = UITextField()
    var shared = ColorManager.shared
    
    var squareSide = 300
    let xStartOrigin = 0
    var yStartOrigin = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.start()
        self.inputText()
    }
    
    // to be fixed using Display heigh
    func start() {
        self.fillButton = UIButton(frame: CGRect(x: 200, y: 700, width: 100, height: 50))
        self.fillButton.backgroundColor = .blue
        self.fillButton.center.x = self.view.center.x
        self.fillButton.layer.cornerRadius = 20
        self.fillButton.setTitle("Press to fill", for: .normal)
        self.fillButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.view.addSubview(fillButton)
    }
    
    func inputText() {
        self.textInputField = UITextField(frame: CGRect(x: 200, y: 300, width: 200, height: 50))
        self.textInputField.placeholder = "Plese enter side length"
        self.textInputField.textAlignment = .center
        self.textInputField.center.x = self.view.center.x
        self.textInputField.backgroundColor = .lightGray
        self.textInputField.textColor = .white
        self.textInputField.layer.cornerRadius = 20
        self.textInputField.target(forAction: #selector(getInputNumper), withSender: self.textInputField)

        self.view.addSubview(textInputField)
    }
    
    @objc func buttonTapped() {
        self.getInputNumper()
        self.fillSquares()
    }
    
    @objc func getInputNumper() {
        let tempSquareSide = self.textInputField.text ?? "2"
        self.squareSide = Int(tempSquareSide)!
    }
    
    func squareCreation(a: Int, b: Int) {
        let colors = shared.ColorsAndNames()
        let temporaryView = UIView()
        temporaryView.frame = CGRect(x: a, y: b, width: self.squareSide, height: self.squareSide)
        temporaryView.backgroundColor = colors.0
        temporaryView.layer.borderWidth = 3
        temporaryView.layer.borderColor = UIColor.white.cgColor
        
        let label = UILabel(frame: CGRect(x: self.squareSide / 3, y: self.squareSide / 3, width: 50, height: 40))
        label.text = colors.1
        label.textColor = .black
        self.view.addSubview(temporaryView)
        temporaryView.addSubview(label)
    }
    
    func fillSquares() {
        var height = Int(self.view.frame.height) - yStartOrigin
        let xx = self.xStartOrigin
        var tempY = self.yStartOrigin
        
        while height >= self.squareSide {
            let tempX = xx
            self.squareCreation(a: tempX, b: tempY)
            self.fillSquaresHorizontal(xx: self.xStartOrigin, yy: self.yStartOrigin)
            self.yStartOrigin += self.squareSide
            height -= self.squareSide
            tempY += self.squareSide
        }
    }
    
    func fillSquaresHorizontal(xx: Int, yy: Int) {
        var width = Int(self.view.frame.width)
        var xAxis = xx
        let yAxis = yy
        
        while width >= (self.squareSide * 2) {
            self.squareCreation(a: self.squareSide + xAxis, b: yAxis)
            width -= self.squareSide
            xAxis += self.squareSide
        }
        
    }
}

