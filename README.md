# MarvelCharacters

## Architecture
- Used clean + MVVM architecture
- Divided project into three main layers: Data, Domain, and Presentation
- There are two more layers Application and Infrastructure for all the app-level classes and networking
- Dependency diagram is as below for the data, domain, and presentation layers,

![Diagram](https://miro.medium.com/max/1400/1*N3ypUNMUGv87qUL57JyqJA.png)

## Third-party dependencies:
- Used swift package manager to add SDWebImage and TinyConstraints.

## UI
- Designed UI programmatically using UIKit for the app. Used TinyConstraints to manage `autolayout` programmatically.

## API/Web services
- Used URLSession to call APIs. Used `async await` to manage concurrency.

## Security
- To use HTTP-only URL, added exception domain instead of allowing arbitrary loads for the app transport security
- Stored API keys in encrypted format in the user-defined settings in the build settings and decrypted them at the time of use.
- Ultimately used obfuscated keys instead of the clean one

## Error handling
- Handle all the possible errors by throwing an exception wherever needed. Handle all the errors with the try-catch block and use `UIAlertController` to display it.

## Unit tests
- Written all the possible unit test cases wherever needed.

## Other
- Followed `SOLID` principles
- Used proper access modifiers for all the classes, methods and properties
- Followed protopol-oriented programming 
- All most code is highly scalable and independent

## References
 - https://tech.olx.com/clean-architecture-and-mvvm-on-ios-c9d167d9f5b3
 - https://www.splinter.com.au/2019/05/05/obfuscating-keys/
 - https://medium.com/swift-india/secure-secrets-in-ios-app-9f66085800b4
 - https://github.com/roberthein/TinyConstraints
 - https://github.com/SDWebImage/SDWebImage
