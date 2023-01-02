//
//  SharedStorageRepository.swift
//  iDeaBox
//
//  Created by Maxim Brishten on 7.03.22.
//

import Foundation
import CoreData

final class SharedStorageRepository: StorageRepository {
    private let modelName: String

    private lazy var managedObjectContext: NSManagedObjectContext = {
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = self.persistentStoreCoordinator
        return context
    }()

    private lazy var managedObjectModel: NSManagedObjectModel = {
        guard let modelURL = Bundle.main.url(forResource: self.modelName, withExtension: "momd") else {
            fatalError("Unable to find data model")
        }

        guard let model = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Unable to load data model")
        }

        return model
    }()

    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)

        let fileManager = FileManager.default
        let storeName = "\(self.modelName).sqlite"

        // documents directory
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]

        // persistent store directory
        let persistentStoreURL = documentsDirectory.appendingPathComponent(storeName)

        do {
            // add persistent store
            let options = [NSMigratePersistentStoresAutomaticallyOption : true,
                                  NSInferMappingModelAutomaticallyOption: true]
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: persistentStoreURL, options: options)
        } catch {
            fatalError("Unable to add persistent store")
        }

        return coordinator
    }()

    //MARK: - Init

    init(modelName: String) {
        self.modelName = modelName
    }

    func saveWeather(weatherModel: WeatherModel) {
        let weather = Weather(context: self.managedObjectContext)

        weather.temperature = weatherModel.main.temp
        weather.lastUpdated = Date()

        do {
            try managedObjectContext.save()
        } catch {
            fatalError("Unable to save weather")
        }

    }

    func fetchWeather() -> WeatherModel? {
        let fetchRequest = Weather.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: #keyPath(Weather.lastUpdated), ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        var weatherModel: WeatherModel?

        managedObjectContext.performAndWait {
            do {
                if let weather = try fetchRequest.execute().first {
                    weatherModel = WeatherModel(main: Main(temp: weather.temperature))
                } else {
                    weatherModel = WeatherModel(main: Main(temp: 22.0))
                }
            } catch {
                weatherModel = WeatherModel(main: Main(temp: 22.0))
                fatalError("Unable to save weather")
            }
        }

        return weatherModel
    }
}
