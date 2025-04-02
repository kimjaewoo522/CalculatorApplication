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
        label.text = "12345"
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

                
                button.snp.makeConstraints { $0.width.height.equalTo(80) }
                horizontalStackView.addArrangedSubview(button)
            }
            verticalStackView.addArrangedSubview(horizontalStackView)
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

