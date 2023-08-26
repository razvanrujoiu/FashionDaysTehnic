//
//  Inject.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 26.08.2023.
//

@propertyWrapper
struct Inject<I> {
    let wrappedValue: I
    init() {
        //Resolve the interface to an implementation.
        self.wrappedValue = Resolver.shared.resolve(I.self)
    }
}
