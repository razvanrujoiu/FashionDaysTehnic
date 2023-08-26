//
//  DIContainer.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 26.08.2023.
//

import Foundation
import Swinject

func buildContainer() -> Container {
    let container = Container()
    
    // MARK: - Mappers
    container.register(ProductDataToDomainMapper.self) { _ in
        ProductDataToDomainMapper()
    }.inObjectScope(.container)
    container.register(ProductRemoteDataToDataModelMapper.self) { _ in
        ProductRemoteDataToDataModelMapper()
    }.inObjectScope(.container)
    container.register(ProductDomainToPresentationMapper.self) { _ in
        ProductDomainToPresentationMapper()
    }.inObjectScope(.container)
    
    // MARK: - DataSources
    container.register(ProductDataSourceType.self) { _ in
        ProductRemoteDataSource()
    }.inObjectScope(.container)
    
    container.register(ProductRepositoryType.self) { _ in
        ProductDataRepository()
    }.inObjectScope(.container)
    
    container.register(ProductUseCase.self) { _ in
        ProductUseCase()
    }.inObjectScope(.container)
    
    container.register(ProductDomainFacadeType.self) { _ in
        ProductDomainFacade()
    }
    
    container.register(CoreNetworkingAPIProtocol.self) { _ in
        CoreNetworkingController()
    }

    return container
}
