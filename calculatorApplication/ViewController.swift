//
//  ViewController.swift
//  calculatorApplication
//
//  Created by 김재우 on 3/28/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let horizontalStackView = UIStackView()
    let verticalStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureUI()
        setConstraints()
    }

    func configureUI() {
        [label, verticalStackView].forEach {
            view.addSubview($0)
        }
        label.textColor = .white
        label.text = "0"
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .black
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
       
        let buttonTitles = [
            ["7", "8", "9", "+"],
            ["4", "5", "6", "-"],
            ["1", "2", "3", "*"],
            ["AC", "0", "=", "/"]
            ]
        
        for row in buttonTitles {
            let horizontalStackView = UIStackView()
            horizontalStackView.axis = .horizontal
            horizontalStackView.backgroundColor = .black
            horizontalStackView.spacing = 10
            horizontalStackView.distribution = .fillEqually
                
            for title in row {
                let button = UIButton()
                button.setTitle(title, for: .normal)
                button.titleLabel?.font = .boldSystemFont(ofSize: 30)
                button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
                button.setTitleColor(.white, for: .normal)
                button.layer.cornerRadius = 40
                
                let isOperator = ["+", "-", "*", "/", "=", "AC"].contains(title)
                button.backgroundColor = isOperator ? .orange : UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
                
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)

                
                button.snp.makeConstraints { $0.width.height.equalTo(80) }
                horizontalStackView.addArrangedSubview(button)
            }
            verticalStackView.addArrangedSubview(horizontalStackView)
        }
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        guard let buttonText = sender.currentTitle else { return }
        var currentText = label.text ?? "0"
        
        if buttonText == "AC" {
            label.text = "0"
            return
        }
        
        if buttonText == "=" {
            if let result = calculate(expression: currentText) {
                label.text = String(result)
            } else {
                label.text = "Error"
            }
            return
        }
        
        if currentText == "0" {
            currentText = buttonText // 첫 숫자가 0이면 교체
                } else {
                    currentText += buttonText // 기존 값에 추가
        }
                
                // 맨 앞에 0이 있다면 제거 (단, 0만 있는 경우는 제외)
        if currentText.count > 1, currentText.hasPrefix("0") {
            currentText = String(currentText.dropFirst())
        }
        label.text = currentText
    }
   
    func calculate(expression: String) -> Int? {
            let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
    
    func setConstraints() {
        label.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().inset(200)
            $0.height.equalTo(100)
        }
        
        horizontalStackView.snp.makeConstraints {
            $0.height.equalTo(80)
        }
        verticalStackView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.top.equalTo(label.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
        }
    }
    
}

