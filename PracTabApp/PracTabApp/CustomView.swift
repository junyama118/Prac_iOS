//
//  CustomView.swift
//  PracTabApp
//
//  Created by 山平潤 on 2020/06/04.
//  Copyright © 2020 山平潤. All rights reserved.
//

import UIKit

class CustomView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    private struct Const {
        static let subviewFrame = CGRect(x: 10, y: 10, width: 300, height: 100)
        static let labelFrame = CGRect(x: 10, y: 10, width: 220, height: 30)
    }

    // コードで初期化する場合
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }

    // xibを使用する場合
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // xibを使用した場合に呼ばれる
    override func awakeFromNib() {
        super.awakeFromNib()
        initializeView()
    }

    private func initializeView() {
        let subview = UIView(frame: Const.subviewFrame)
        subview.backgroundColor = .red
        addSubview(subview)

        let label = UILabel(frame: Const.labelFrame)
        label.text = "hogehoge"
        label.backgroundColor = .clear
        subview.addSubview(label)
    }
    
}
