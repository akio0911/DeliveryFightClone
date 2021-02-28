//
//  ViewController.swift
//  DeliveryFightClone
//
//  Created by akio0911youtube on 2021/02/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var conveyorView1: ConveyorView!
    @IBOutlet private weak var conveyorView2: ConveyorView!
    @IBOutlet private weak var conveyorView3: ConveyorView!
    @IBOutlet private weak var conveyorView4: ConveyorView!
    @IBOutlet private weak var conveyorView5: ConveyorView!

    @IBOutlet private weak var upDownView1: UpDownView!
    @IBOutlet private weak var upDownView2: UpDownView!
    @IBOutlet private weak var upDownView3: UpDownView!
    @IBOutlet private weak var upDownView4: UpDownView!
    @IBOutlet private weak var upDownView5: UpDownView!


    private var conveyorViews: [ConveyorView] {
        [
            conveyorView1,
            conveyorView2,
            conveyorView3,
            conveyorView4,
            conveyorView5,
        ]
    }

    private var upDownViews: [UpDownView] {
        [
            upDownView1,
            upDownView2,
            upDownView3,
            upDownView4,
            upDownView5,
        ]
    }

    private var conveyors: [Conveyor] = [
        Conveyor(fruitPosition: 2),
        Conveyor(fruitPosition: 3),
        Conveyor(fruitPosition: 4),
        Conveyor(fruitPosition: 5),
        Conveyor(fruitPosition: 6),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        zip(conveyors, conveyorViews)
            .forEach {
                $1.configure(conveyor: $0)
            }

        func didTapUp(index: Int) {
            conveyors[index].up()
            conveyorViews[index].configure(conveyor: conveyors[index])
        }

        func didTapDown(index: Int) {
            conveyors[index].down()
            conveyorViews[index].configure(conveyor: conveyors[index])
        }

        upDownViews.enumerated()
            .forEach { offset, upDownView in
                upDownView
                    .configure(
                        didTapUp: {
                            didTapUp(index: offset)
                        },
                        didTapDown: {
                            didTapDown(index: offset)
                        }
                    )
            }
    }
}
