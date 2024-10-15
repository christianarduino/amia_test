# Dog Explorer App

A Flutter application designed to explore dog images by breed and sub-breed, offering functionalities such as viewing random images or lists of images for selected breeds. The app also allows users to manage their favorite breeds and access them from the home page.

## Project Structure

The project is organized following a modular structure that respects Clean Architecture principles, facilitating scalability and maintainability. Below is an overview of the directory structure:

### Architecture

```
-- lib/
    -- core/ 
       |-- network/
           |-- dio.dart # Sets up the Dio client for network requests
       |-- app_router.dart # Configures routing with go_router
       |-- constants.dart # Holds app-wide constants
    -- features/
       |-- explore_breeds/ # Manages displaying dog images by breed/sub-breed
       |-- home/ # Home page for managing favorites and accessing "explore_breeds"
    -- shared/ # Contains shared data, domain, and presentation layers
       |-- data/
       |-- domain/
       |-- presentation/
    -- app.dart # Sets up app configuration and theme
    -- main.dart # App entry point

```


## Feature Structure

Each feature in this project follows a structured approach with three main layers: **data**, **domain**, and **presentation**. This setup ensures a clear separation of concerns, improving maintainability and testability.

### Layer Explanation

- **Data Layer**:  
  This layer is responsible for handling data sources and repositories. It manages API calls, local caching, and data serialization. It serves as the bridge between the app's core data sources (e.g., network, local storage) and the domain layer.

  Example components:
  - API services
  - Models for data parsing (with `json_annotation` and `json_serializable`)
  - Repository implementations (which handle data retrieval and manipulation)

- **Domain Layer**:  
  The domain layer in this project focuses on defining entities and repository interfaces. It abstracts the details of data access, allowing the `presentation` layer to interact with data through repository interfaces without needing to know the specifics of data fetching or caching.

  Example components:
  - Entities (pure data models)
  - Repository interfaces (contracts that the data layer implements)

  Unlike some architectures, this project does not use `UseCases`. Instead, repositories are accessed directly from the `presentation` layer, either through `Notifier` classes or directly via `FutureProviders`.

- **Presentation Layer**:  
  This layer manages the UI and state management of the feature. It includes widgets, state notifiers, and providers using `Riverpod` to manage the state of the feature. Notifiers or `FutureProviders` are used to interact with repositories and handle network requests, updating the UI as necessary.

## JSON Serialization

For JSON serialization, **json_annotation** and **json_serializable** are used to generate data classes in the data layer, simplifying the process of mapping API responses to Dart objects. While **freezed** could have been an option for handling immutability and sealed classes, it was not necessary for this project's scope.

## Features

- **Random Breed Images**: Fetch and display a random image of a selected dog breed.
- **Breed Image Lists**: Fetch a list of images for a chosen breed.
- **Sub-Breed Support**: Choose a sub-breed (e.g., "Corgi Pembroke" or "Corgi Cardigan") to view random images or image lists.
- **Favorites Management**: Manage a list of favorite breeds for easy access from the home page.