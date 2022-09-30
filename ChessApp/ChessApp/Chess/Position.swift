//
//  Position.swift
//  ChessApp
//
//  Created by Jinho Jang on 2022/09/30.
//

struct Position {
    var file: File
    var rank: Rank
}

struct Rank: Comparable {
    
    static let min: Rank = Rank(1)!
    static let max: Rank = Rank(8)!
    
    var value: Int
    
    init?(_ position: Int) {
        self.value = position
        if validate() == false { return nil }
    }
    
    private func validate() -> Bool {
        let range = Rank.min...Rank.max
        return range.contains(self)
    }
    
    static func < (lhs: Rank, rhs: Rank) -> Bool {
        lhs.value < rhs.value
    }
}


struct File: Comparable {
    
    static let min: File = File("A")!
    static let max: File = File("H")!
    
    var value: String
    
    init?(_ position: String) {
        self.value = position
        if validate() == false { return nil }
    }
    
    private func validate() -> Bool {
        let range = File.min...File.max
        return range.contains(self)
    }
    
    static func < (lhs: File, rhs: File) -> Bool {
        lhs.value < rhs.value
    }
}
