# kindred

Application is based on MVVM architecture.
I have implemented the app with GameList as one of the module. I have not used any third party sdk in the app and have written my own implementation of Network layer and image caching for lazy loading. I have also added some unit test cases.

In ideal scenario where I would have been working on a full fledge application, I would use cocoapods for dependency management. Even in this current application I would have used Alamofire, SwiftyJson and RxSwift. I would also use Alamofire for lazy loading instead of custom class that I have created here.

My approach to work on an application would begin with sequence diagram so that I am aware of complete user flows in the application. I would then create an architecture digram depicting classes with protocols. Once architecture is finalised I can start development by first implementing skeleton with the protocols and then do the real implementations.
And of course it will be followed by unit test cases.
I normally try to break the application into layers and follow SOLID principles during development.
