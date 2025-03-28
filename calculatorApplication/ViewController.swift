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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureUI()
        setConstraints()
    }

    func configureUI() {
        view.addSubview(label)
        label.textColor = .white
        label.text = "12345"
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 60)
    }
    
    func setConstraints() {
        label.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(100)
        }
    }
    
}

