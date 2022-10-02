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
    
    static let min: Rank = Rank(1)
    static let max: Rank = Rank(8)
    
    private var _value: Int
    var value: Int {
        get { return _value }
        set {
            self._value = clamp(newValue, in: Rank.min.value...Rank.max.value)
        }
    }
    
    init(_ value: Int) {
        self._value = value
    }
    
    static func < (lhs: Rank, rhs: Rank) -> Bool {
        lhs.value < rhs.value
    }
    
    private func clamp(_ value: Int, in limits: ClosedRange<Int>) -> Int {
        return Swift.min(Swift.max(value, limits.lowerBound), limits.upperBound)
    }
}


struct File: Comparable {
    
    static let min: File = File("A")
    static let max: File = File("H")
    
    private var _value: String
    var value: String {
        get { return _value }
        set {
            self._value = clamp(newValue, in: File.min.value...File.max.value)
        }
    }
    
    init(_ value: String) {
        self._value = value
    }
    
    static func < (lhs: File, rhs: File) -> Bool {
        lhs.value < rhs.value
    }
    
    private func clamp(_ value: String, in limits: ClosedRange<String>) -> String {
        return Swift.min(Swift.max(value, limits.lowerBound), limits.upperBound)
    }
}
