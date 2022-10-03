//
//  PieceTests.swift
//  ChessAppTests
//
//  Created by Jinho Jang on 2022/10/03.
//

import XCTest
@testable import ChessApp

final class PieceTests: XCTestCase {
    func testBishop() {
        // given
        let bishop = Bishop(
            currentPosition: Position(file: File("D"), rank: Rank(5)),
            type: .white
        )
        
        //then
        XCTAssertEqual(
            bishop.moveablePosition().sorted(),
            [
                Position(file: File("C"), rank: Rank(6)),
                Position(file: File("B"), rank: Rank(7)),
                Position(file: File("A"), rank: Rank(8)),
                Position(file: File("E"), rank: Rank(6)),
                Position(file: File("F"), rank: Rank(7)),
                Position(file: File("G"), rank: Rank(8)),
                Position(file: File("C"), rank: Rank(4)),
                Position(file: File("B"), rank: Rank(3)),
                Position(file: File("A"), rank: Rank(2)),
                Position(file: File("E"), rank: Rank(4)),
                Position(file: File("F"), rank: Rank(3)),
                Position(file: File("G"), rank: Rank(2)),
                Position(file: File("H"), rank: Rank(1)),
            ].sorted()
        )
    }
    
    func testRook() {
        // given
        let rook = Rook(
            currentPosition: Position(file: File("D"), rank: Rank(5)),
            type: .white
        )
        
        XCTAssertEqual(
            rook.moveablePosition().sorted(),
            [
                Position(file: File("A"), rank: Rank(5)),
                Position(file: File("B"), rank: Rank(5)),
                Position(file: File("C"), rank: Rank(5)),
                Position(file: File("E"), rank: Rank(5)),
                Position(file: File("F"), rank: Rank(5)),
                Position(file: File("G"), rank: Rank(5)),
                Position(file: File("H"), rank: Rank(5)),
                Position(file: File("D"), rank: Rank(1)),
                Position(file: File("D"), rank: Rank(2)),
                Position(file: File("D"), rank: Rank(3)),
                Position(file: File("D"), rank: Rank(4)),
                Position(file: File("D"), rank: Rank(6)),
                Position(file: File("D"), rank: Rank(7)),
                Position(file: File("D"), rank: Rank(8)),
            ].sorted()
        )
    }
}
