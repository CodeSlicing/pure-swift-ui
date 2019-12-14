//
//  SFSymbol.swift
//  
//
//  Created by Adam Fordyce on 07/12/2019.
//

public struct SFSymbol: View {
    
    private let systemName: String
    
    public init(_ sfSymbol: SFSymbolName) {
        self.init(sfSymbol.rawValue)
    }
    
    public init(_ systemName: String) {
        self.systemName = systemName
    }
    
    public var body: Image {
        Image(systemName: systemName)
    }
}
