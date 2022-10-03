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
    
    func moveablePosition() -> String? {
        guard currentPosition.rank != Rank.min
                && currentPosition.rank != Rank.max else {
            return nil
        }
        
        var nextRank = currentPosition.rank.value
        if type == .white { nextRank -= 1 }
        if type == .black { nextRank += 1 }
        
        return currentPosition.file.value + "\(nextRank)"
    }
}
