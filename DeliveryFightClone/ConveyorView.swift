//
//  ConveyorView.swift
//  DeliveryFightClone
//
//  Created by akio0911youtube on 2021/02/28.
//

import Foundation
import UIKit

final class ConveyorView: UIView {
    @IBOutlet private weak var fruitImageView1: UIImageView!
    @IBOutlet private weak var fruitImageView2: UIImageView!
    @IBOutlet private weak var fruitImageView3: UIImageView!
    @IBOutlet private weak var fruitImageView4: UIImageView!
    @IBOutlet private weak var fruitImageView5: UIImageView!
    @IBOutlet private weak var fruitImageView6: UIImageView!
    @IBOutlet private weak var fruitImageView7: UIImageView!
    @IBOutlet private weak var fruitImageView8: UIImageView!
    @IBOutlet private weak var fruitImageView9: UIImageView!

    private var fruitImageViews: [UIImageView] {
        [
            fruitImageView1,
            fruitImageView2,
            fruitImageView3,
            fruitImageView4,
            fruitImageView5,
            fruitImageView6,
            fruitImageView7,
            fruitImageView8,
            fruitImageView9,
        ]
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }

    private func clearFruitImageViews() {
        fruitImageViews.forEach {
            $0.image = nil
        }
    }

    private func loadNib() {
        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            view.frame = bounds
            addSubview(view)

            clearFruitImageViews()
        }
    }

    func configure(conveyor: Conveyor) {
        clearFruitImageViews()
        fruitImageViews[conveyor.fruitPosition].image = #imageLiteral(resourceName: "apple")
    }
}
