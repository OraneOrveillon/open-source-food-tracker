# Flutter template using GetX package

I use this repo as a template for my personal Flutter projects. It is using a modular MVC architecture. Still improving. 🫡

## Packages
### GetX

This template uses a core package, [get](https://pub.dev/packages/get), which enables :
- State management
- Dependency injection
- Routing
- HTTP client

But also other things that are not implemented here :
- Snackbars / dialogs / bottomsheets
- Shared preferences
- Internationalization
- Theme changing
- Validators

It has the benefit to have a single lightweight solution for all these usages instead of having to add several packages. For example one for the state management, another for the HTTP client, another for the router, etc... 

### Dartz

[dartz](https://pub.dev/packages/dartz) enables better error handling, especially with API calls.

## Architecture overview

```yaml
- /lib
  # Global components
  - /components
  # Contains everything related to local and remote data
  - /core
    - /theme
      # Color constants 
      - colors.dart
      # Custom themes (light and dark)
      - themes.dart
    # I added my const values in utils but you can also add yours extensions and helper functions / classes
    - /utils
      # Your enums if they exist
      - enums.dart
      # Error messages
      - errors.dart
      # Padding constants used on screens
      - paddings.dart
      # String constants used on screens
      - texts.dart
      # Form validators
      - validators.dart  
  - /data
    # Models specifics to your retrieved data
    - /models
      - example_model.dart
    # API's, local database, shared preferences, Firebase, etc...
    - /services
      - example_repository.dart
  # List of different modules, each one corresponding to a screen in your app
  - /modules
    # Module name
    - /example
      # Local components (if they exist)
      - /components
      # Dependency injection
      - example_binding.dart
      # Deals with states and user inputs
      - example_controller.dart
      # Presentation layer
      - example_page.dart
  - /routes
    # Get pages 
    - pages.dart
    # Route names
    - routes.dart
  main.dart
```

## How to use it?
See [how to create a new repository from a template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template).