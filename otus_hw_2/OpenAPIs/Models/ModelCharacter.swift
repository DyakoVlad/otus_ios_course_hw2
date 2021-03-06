//
// ModelCharacter.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



public struct ModelCharacter: Codable, Identifiable {

    public var id: Int?
    public var name: String?
    public var status: String?
    public var species: String?
    public var gender: String?
    public var location: Location?
    public var image: String?

    public init(id: Int?, name: String?, status: String?, species: String?, gender: String?, location: Location?, image: String?) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.gender = gender
        self.location = location
        self.image = image
    }


}

