//
//  UpDownView.swift
//  DeliveryFightClone
//
//  Created by akio0911youtube on 2021/02/28.
//

import UIKit

final class UpDownView: UIView {
    private var didTapUpHandler: () -> Void = {}
    private var didTapDownHandler: () -> Void = {}

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }

    private func loadNib() {
        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            view.frame = bounds
            addSubview(view)
        }
    }

    func configure(didTapUp: @escaping () -> Void,
                   didTapDown: @escaping () -> Void) {

        self.didTapUpHandler = didTapUp
        self.didTapDownHandler = didTapDown
    }
    
    @IBAction func didTapUp(_ sender: Any) {
        didTapUpHandler()
    }

    @IBAction func didTapDown(_ sender: Any) {
        didTapDownHandler()
    }
}
