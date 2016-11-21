# iOS Swift Assessment: Core Data

### Goals
Create an application that has no user interface, but prints to the console a list of authors and their books. This content should be stored in Core Data.

## Instructions
* Create a new Xcode project with Core Data included.
* Move the Core Data Stack from the `AppDelegate` to a new class called `CoreDataStack`.
  * Set this up as a singleton with a `sharedInstance`.
  * Add a property called `library`, which is of type `[Book]`.
* The `Book` type is unrecognized, so set up your `xcdatamodeld` with two entities: `Author` and `Book`.
  * Each author has a name.
  * Each book has a title.
  * Books have one author.
  * Authors can have more than one book.
* In `CoreDataStack`, create a function named `generateTestData()`. This should insert the four following books and authors into Core Data. For the sake of this assesment, make the authors and add books to them, not the other way around.
  * *The Swift Programming Language* by Apple Inc.
  * *Hacking with Swift* by Paul Hudson
  * *Pro Swift* by Paul Hudson
  * *Advanced Swift* by Chris Eidhof
* Add a `fetchData()` function in `CoreDataStack` that fills `library` with all the `Book` entities stored in Core Data.
* In your `AppDelegate` file, make sure your `library` is up-to-date and print out its contents in a human-readable format.
* Bask in the glory of your Core Data-enabled app!
