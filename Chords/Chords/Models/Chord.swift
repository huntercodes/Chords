//
//  Chord.swift
//
//  Created by hunter downey on 9/18/22.
//

import Foundation

public struct Chord: Hashable, Equatable, Decodable {
    let key: String
    let suffix: String
    let positions: [Position]
    
    public struct Position: Hashable, Equatable, Decodable {
        let baseFret: Int
        let barres: [Int]
        let frets: [Int]
        let fingers: [Int]
    }
}
