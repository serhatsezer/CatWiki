# Cat Wiki

This app uses https://thecatapi.com/ in order to fetch cat related data 

# Project structure

This project uses MVVM-C with some RxSwift if only needed. 
Inside main structure I prefer to structure app as moduler manner. If later in some other project requires some screen and almost same functionality, it can be easly moved to the new project just drag-and-drop way. 

## View Controller
Inside UIViewContoller I only do view bindings and view communications. Network call also happening here but it can also be seperated into some type of Repository class. But in my network layer I already separated into two different layer so in that way if caching or persistance operations can be injected there.

Another thing in view controller is that contains State enum value every time in code any of enum value changed controller update itself or notify neccessary components if needed.

## Testing

In testing I usually prefer verbose function names in that way If I want to export any logs it can be human-readable. I also used Nimble for matching framework. I would've also use Quick in order for to make BDD-style test but for that project I couldn't find proper scenario. 

In networking layer I mocked with real JSON data and also mocked networking layer so it can be easly tasted for each cases.  