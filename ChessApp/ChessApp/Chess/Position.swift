//
//  Position.swift
//  ChessApp
//
//  Created by Jinho Jang on 2022/09/30.
//

struct Position: Hashable {

    var file: File
    var rank: Rank
    
    init(_ str: String) {
        if str.count != 2 { fatalError() }
        file = File(String(str.dropFirst()))
        rank = Rank(Int(String(str.dropLast()))!)
    }
    
    init(file: File, rank: Rank) {
        self.file = file
        self.rank = rank
    }
    
    func goUp(_ k: Int = 1) -> Position {
        var position = self
        position.rank.value += k
        return position
    }
    
    func goDown(_ k: Int = 1) -> Position {
        var position = self
        position.rank.value -= k
        return position
    }
    
    func goLeft(_ k: UInt8 = 1) -> Position {
        var position = self
        position.file.value = String(UnicodeScalar(Character(file.value).asciiValue! - k))
        return position
    }
    
    func goRight(_ k: UInt8 = 1) -> Position {
        var position = self
        position.file.value = String(UnicodeScalar(Character(file.value).asciiValue! + k))
        return position
    }
}

extension Position: Comparable {
    static func < (lhs: Position, rhs: Position) -> Bool {
        lhs.description < rhs.description
    }
}

extension Position: CustomStringConvertible {
    var description: String {
        "\(file.value)\(rank.value)"
    }
}

struct Rank: Comparable, Hashable {
    
    static let min: Rank = Rank(1)
    static let max: Rank = Rank(8)
    static var size: Int { Rank.max - Rank.min }
    
    private var _value: Int
    var value: Int {
        get { return _value }
        set {
            self._value = clamp(newValue, in: Rank.min.value...Rank.max.value)
        }
    }
    
    var distanceFromMin: Int { self - Rank.min }
    var distanceFromMax: Int { Rank.max - self }
    
    init(_ value: Int) {
        self._value = value
    }
    
    static func < (lhs: Rank, rhs: Rank) -> Bool {
        lhs.value < rhs.value
    }
    
    static func - (lhs: Rank, rhs: Rank) -> Int {
        lhs.value - rhs.value
    }
    
    private func clamp(_ value: Int, in limits: ClosedRange<Int>) -> Int {
        return Swift.min(Swift.max(value, limits.lowerBound), limits.upperBound)
    }
}


struct File: Hashable {
    
    static let min: File = File("A")
    static let max: File = File("H")
    static var size: Int { File.max - File.min }
    
    private var _value: String
    var value: String {
        get { return _value }
        set {
            self._value = clamp(newValue, in: File.min.value...File.max.value)
        }
    }
    
    var distanceFromMin: Int { self - File.min }
    var distanceFromMax: Int { File.max - self }
    
    init(_ value: String) {
        self._value = value
    }
    
    static func - (lhs: File, rhs: File) -> Int {
        Int(Character(lhs.value).asciiValue! - Character(rhs.value).asciiValue!)
    }
    
    private func clamp(_ value: String, in limits: ClosedRange<String>) -> String {
        return Swift.min(Swift.max(value, limits.lowerBound), limits.upperBound)
    }
}


extension File: Comparable {
    static func < (lhs: File, rhs: File) -> Bool {
        lhs.value < rhs.value
    }
}

extension File: Strideable {
    func advanced(by n: Int) -> File {
        File(String(UnicodeScalar(Character(self.value).asciiValue! + UInt8(n))))
    }
    
    func distance(to other: File) -> Int {
        self - other
    }
}
