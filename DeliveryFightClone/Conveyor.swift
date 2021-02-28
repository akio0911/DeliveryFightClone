//
//  Conveyor.swift
//  DeliveryFightClone
//
//  Created by akio0911youtube on 2021/02/28.
//

import Foundation

struct Conveyor {
    var fruitPosition: Int

    let fruitPositionRange = 0...8

    mutating func up() {
        fruitPosition = max(
            fruitPositionRange.lowerBound,
            fruitPosition - 1
        )
    }

    mutating func down() {
        fruitPosition = min(
            fruitPositionRange.upperBound,
            fruitPosition + 1
        )
    }
}
