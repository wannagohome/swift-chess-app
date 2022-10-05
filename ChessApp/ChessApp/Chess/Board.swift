//
//  Board.swift
//  ChessApp
//
//  Created by Jinho Jang on 2022/09/27.
//

protocol Boardable {
    func movePiece(from: String, to: String) -> Bool
}

final class Board: Boardable {
    
    private var pieces: [Piece]
    
    init() {
        pieces = []
        for file in File.min ... File.max {
            let blackPawnPostion = Position(file: file, rank: Rank(2))
            let whitePawnPostion = Position(file: file, rank: Rank(7))
            pieces.append(Pawn(currentPosition: blackPawnPostion,type: .black))
            pieces.append(Pawn(currentPosition: whitePawnPostion, type: .white))
        }
        
        pieces.append(Rook(currentPosition: Position(file: File("A"), rank: Rank(1)), type: .black))
        pieces.append(Rook(currentPosition: Position(file: File("H"), rank: Rank(1)), type: .black))
        pieces.append(Rook(currentPosition: Position(file: File("A"), rank: Rank(8)), type: .white))
        pieces.append(Rook(currentPosition: Position(file: File("H"), rank: Rank(8)), type: .white))
        
        pieces.append(Bishop(currentPosition: Position(file: File("C"), rank: Rank(1)), type: .black))
        pieces.append(Bishop(currentPosition: Position(file: File("F"), rank: Rank(1)), type: .black))
        pieces.append(Bishop(currentPosition: Position(file: File("C"), rank: Rank(8)), type: .white))
        pieces.append(Bishop(currentPosition: Position(file: File("F"), rank: Rank(8)), type: .white))
    }
    
    func movePiece(from: String, to: String) -> Bool {
        guard let fromIndex = pieces.firstIndex(where: { $0.currentPosition.description == from }) else {
            return false
        }
        if let toIndex = pieces.firstIndex(where: { $0.currentPosition.description == to }) {
            if pieces[toIndex].type == pieces[fromIndex].type {
                return false
            }
            pieces[fromIndex].currentPosition = Position(to)
            pieces.remove(at: toIndex)
        } else {
            pieces[fromIndex].currentPosition = Position(to)
        }
        
        return true
    }
}
