//
//  Piece.swift
//  ChessApp
//
//  Created by Jinho Jang on 2022/09/30.
//

protocol Piece {
    var type: `Type` { get }
    var currentPosition: Position { get set }
    func moveablePosition() -> String?
}

enum `Type` {
    case white
    case black
}

struct Position {
    var row: String
    var column: String
}
