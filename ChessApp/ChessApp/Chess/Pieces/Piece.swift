//
//  Piece.swift
//  ChessApp
//
//  Created by Jinho Jang on 2022/09/30.
//

protocol Piece {
    var type: `Type` { get }
    var currentPosition: Position { get set }
    func moveablePosition() -> [Position]
}

enum `Type` {
    case white
    case black
}
