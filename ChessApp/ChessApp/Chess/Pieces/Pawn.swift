//
//  Pawn.swift
//  ChessApp
//
//  Created by Jinho Jang on 2022/09/27.
//

final class Pawn: Piece {
    
    var type: `Type`
    var currentPosition: Position
    
    init(
        currentPosition: Position,
        type: `Type`
    ) {
        self.currentPosition = currentPosition
        self.type = type
    }
    
    func moveablePosition() -> [Position] {
        guard currentPosition.rank != Rank.min
                && currentPosition.rank != Rank.max else {
            return []
        }
        
        if type == .white { return [currentPosition.goUp()] }
        if type == .black { return [currentPosition.goDown()] }
        
        return []
    }
}
