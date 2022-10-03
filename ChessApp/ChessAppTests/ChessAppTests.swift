//
//  ChessAppTests.swift
//  ChessAppTests
//
//  Created by Jinho Jang on 2022/09/27.
//

import XCTest
@testable import ChessApp

class ChessAppTests: XCTestCase {
    func testExample() throws {
        let bishop = Bishop(
            currentPosition: Position(file: File("D"), rank: Rank(5)),
            type: .white
        )
        print(bishop.moveablePosition()!)
    }

}
