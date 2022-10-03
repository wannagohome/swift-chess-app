//
//  Bishop.swift
//  ChessApp
//
//  Created by Jinho Jang on 2022/10/02.
//

final class Bishop: Piece {
    
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
        
        let topLeft = min(currentPosition.rank.distanceFromMax, currentPosition.file.distanceFromMin)
        if topLeft != 0 {
            for i in 1 ... topLeft {
                result.insert(currentPosition.goUp(i).goLeft(UInt8(i)))
            }
        }
        
        let topRight = min(currentPosition.rank.distanceFromMax, currentPosition.file.distanceFromMax)
        if topRight != 0 {
            for i in 1 ... topRight {
                result.insert(currentPosition.goUp(i).goRight(UInt8(i)))
            }
        }
        
        let bottomLeft = min(currentPosition.rank.distanceFromMin, currentPosition.file.distanceFromMin)
        if bottomLeft != 0 {
            for i in 1 ... bottomLeft {
                result.insert(currentPosition.goDown(i).goLeft(UInt8(i)))
            }
        }
        
        let bottomRight = min(currentPosition.rank.distanceFromMin, currentPosition.file.distanceFromMax)
        if bottomRight != 0 {
            for i in 1 ... bottomRight {
                result.insert(currentPosition.goDown(i).goRight(UInt8(i)))
            }
        }
        
        return Array(result)
    }
}
