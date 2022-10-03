//
//  Rook.swift
//  ChessApp
//
//  Created by Jinho Jang on 2022/10/03.
//

final class Rook: Piece {
    
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
        var result: Set<Position> = []
        
        for i in 0 ... File.size {
            let position = Position(file: File.min, rank: currentPosition.rank)
            result.insert(position.goRight(UInt8(i)))
        }
        
        for i in 0 ... Rank.size {
            let position = Position(file: currentPosition.file, rank: Rank.min)
            result.insert(position.goUp(i))
        }
        
        result.remove(currentPosition)
        
        return Array(result)
    }
}

