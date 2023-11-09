# HealthPrep
![Image](https://img.shields.io/badge/HeathPrep-Green
) ![Image](https://img.shields.io/badge/Xcode-Green) ![Image](https://img.shields.io/badge/SwiftUI-Green
) ![Image](https://img.shields.io/badge/MVVM%20Architecture-Green
) ![Image](https://img.shields.io/badge/Swift-Green) ![Image](https://img.shields.io/badge/Portfolio%20Project-Green
) 


## Motivation
My motivation for this project was to create a mock up app that I could use in my portfolio to showcase the different [Swift](https://developer.apple.com/documentation/swift/) / [SwiftUI](https://developer.apple.com/documentation/swiftui/) skills that I am learning.  I wanted to build out a project that would allow me to showcase the new skills I learn, as well as have a visual of how my knowledge has grown. I decided to go with a healthy meal prep concept as it is a template that I could see myself using down the road for future projects. I will be building this project out in several different phases. (More information on this can be found in the **Future Modifications** section below.) 


## Project Objectives

![Image](https://img.shields.io/badge/Healthy%20Meal%20Prep%20Concept-Green
) ![Image](https://img.shields.io/badge/MVVM-Green
) ![Image](https://img.shields.io/badge/View-Green
) ![Image](https://img.shields.io/badge/Authentication-Green
) ![Image](https://img.shields.io/badge/E-Commerce-Green
) ![Image](https://img.shields.io/badge/Persistence-Green
)
* Mock up template of a healthy meal prep concept
* Developed using the [MVVM](https://www.geeksforgeeks.org/mvvm-model-view-viewmodel-architecture-pattern-in-android/) model architecture
* Full performance / appearance on different devices
* Create an item [view](https://developer.apple.com/documentation/swiftui/view/)
* Create an item detail view
* Create a meal plan view
* Create a meal plan detail view
* Create an order view that includes shopping cart / full functioning order capabilities
* Create a user view
* Add [user authentication](https://developer.apple.com/documentation/authenticationservices/)
* Implement [Cloud Firestore](https://firebase.google.com/docs/firestore) database backend to store user information for [persistance](https://medium.com/@rashadsh/data-persistance-in-swift-different-ways-to-save-your-data-954cd2559a75#:~:text=There%20are%20three%20different%20types,(such%20as%20using%20iCloud).)
* Custom color / graphics / accessibility revisions


##  Project Description / Features 

![Image](https://img.shields.io/badge/MVVM-Green
) ![Image](https://img.shields.io/badge/JSON-Green
) ![Image](https://img.shields.io/badge/Bundle-Decodable-Green
) ![Image](https://img.shields.io/badge/Item-Green
) ![Image](https://img.shields.io/badge/MealPlan-Green
) ![Image](https://img.shields.io/badge/Favorites-Green
) ![Image](https://img.shields.io/badge/MealPlanFavorites-Green
) 

My end goal with this app is to create a template for a meal prep app that will allow a user to self authenticate by logging into the app with a username and password. The user will be able to order meal plans, as well as any additional items they may be interested in. I also want to provide item and meal plan information, since dietary information is of such importance. I think that this will be a good app for me in terms of continuous improvement. Building this app out will allow me to showcase the new skills I am learning, as well as show off my increasing knowledge of **Swift** and **SwiftUI**. 

When I started building out this project the first thing I wanted to focus on was creating the **item** and **meal plan** views for the user. I wanted the user to be able to look at each individual item and meal plan that is being offered through this service. *Each view would contain the item or meal plan's basic information, an [image](https://developer.apple.com/documentation/swiftui/image/), and a description*. 

My thoughts were to create two Swift files. One for items, and one for meal plans where I could house the basic information. I decided that the best route was to create two [JSON](https://www.json.org/json-en.html) files that I could use to add items / meal plans. This would be beneficial in the event that items or meal plans were added or edited. The **JSON** files could be edited / revised and our application would update accordingly. In future applications this would also be beneficial as the general information would obviously change.

**Developing using the MVVM model was one of my objectives**, so I started by creating two new JSON files. One for items, and one for meals. Then I created two new Swift files, one for **Item** and one for **MealPlan**. Each of these Swift files would inherit data from its respective JSON file. 

Then I would create two new **SwiftUI** views. One that would show the user the list of items, and one that would show the user the list of meal plans.

Next, I would build in the functionality that allowed the user to navigate into a new **SwiftUI** view for each item or meal plan by clicking the item or meal plan in their respective list. This new view would include the descriptive information for the particular item or meal plan. *The user could then add that respective item or meal plan to their **favorites***.  

Both **Item** & **MealPlan** would be referenced in **ItemView** & **MealPlanView**. In turn, both ItemView and MealPlanView would navigate to **ItemDetailView** and **MealPlanDetailView**.

Lastly, I planned on adding a **HomeView** that would include the application or businesses primary logo. This could be used as the view that is shown when the user opens the app. Along with this addition I planned on adding a **[TabView](https://developer.apple.com/documentation/swiftui/tabview/)** that could be used to navigate to the different views within the application. This would provide for a better user experience. Additionally, I wanted to have this feature added before I started building out future features in this application.  

---

### JSON
I focused on building two mock up **JSON** files that I could use for the data behind the items and meal plans that I would present in this app. Each JSON file includes pertinent information for either the items, or the meal plans. These files would allow for basic changes to menu items / meal plans (which is common) at any time via the JSON files. *This would mean I would need to include a Swift file that provided the code necessary to decode the JSON data into something we could use in Swift*. The **Bundle-Decodable** file serves this purpose. 

` items.json `
` meals.json `

---
### Bundle-Decodable
` Bundle-Decodable.swift `

I created the Bundle-Decodable Swift file initially with assistance from Paul Hudson [@TwoStraws](https://github.com/twostraws)  when I was completing the [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui) course. This is now a piece of code that I use in many projects. This code is basically an extension on Bundle that includes a [function](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions/) called decode. *This **function** utilizes generics, guard statements, and returns the loaded json data for swiftUI to utilize. The guard statements will cause fatal errors if the data does not load correctly*. This is a very handy piece of code. Thanks Paul!

#### ex.
>  guard let data = try? Data(contentsOf: url) else {
fatalError("Failed to load \(file) from bundle") 
}

---
### Item
`Item.swift `

I created a Swift file called Item.swift. I started by creating a [struct](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures/) called Item. This **struct** would need to have both [Codable](https://developer.apple.com/documentation/swift/codable/) and [Identifiable](https://developer.apple.com/documentation/swift/identifiable/) protocol conformances since we are working with a JSON file. *Each item has a unique id*. I then added [constant variables](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/) that would coincide with each of the descriptors in my items.json file. 

` id, name, type, serving, description, imageCredit, price, healthFacts `

Next I created two static variables that would present a preview item. The first was an array of Item called **allItems**, which was decoded from our Bundle. The second variable is called **example** and is the first item in our **allItems** array. 

#### ex. 

> static let allItems: [Item] = Bundle.main.decode("items.json") 
static let example = allItems[0] 

---
### MealPlan

`MealPlan.swift `

Next I created a new Swift file called MealPlan.swift. I then created a new struct called MealPlan. I added Codable, and Identifiable conformance as I did with my Item struct. Then I added [constant variables](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/) that would coincide with the descriptors in my meals.json file. 

` id, name, meals, type, description, imageCredit, price, mainOfferings, sides `

Again, just like I did with my Item struct I created two [static variables](https://www.hackingwithswift.com/read/0/18/static-properties-and-methods) that would present a preview. The first was an array of MealPlan called allMealPlans, which was decoded from our Bundle. The second variable is called example and is the first meal plan in our allMealPlans array. 

#### ex.

> static let allMealPlans: [MealPlan] = Bundle.main.decode(meals.json)
> static let example = allMealPlans[0]
---

### Favorites / MealPlanFavorites

One of the important features of creating a pleasant user experience is allowing the user to **favorite** particular items or meal plans that they enjoy. *Ultimately this will be built into / included in the userView aspect of this project*. 

I created the **Favorites** Swift file initially with assistance from Paul Hudson [@TwoStraws](https://github.com/twostraws) when I was completing the [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui) course. 

The file includes a class called **Favorites**. It conforms to the [ObservableObject](https://developer.apple.com/documentation/combine/observableobject/) protocol. This will enable us to edit favorites in different views by using [@StateObject](https://developer.apple.com/documentation/swiftui/stateobject/) / [@EnvironmentObject](https://developer.apple.com/documentation/swiftui/environmentobject/).

*Inside the class I created two private variables called **items** and **saveKey***.

Our Favorites class includes an [init()](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization/) that returns decoded **JSON** information on the item. If the item is a favorite it is returned to the items array of favorites. 

There are four [functions](https://www.hackingwithswift.com/read/0/11/functions) included in our **Favorites** class that will provide the functionality needed for a user to add an item to favorites, or to remove the item from favorites.

**Contains**
```
func contains(_ item: Item) -> Bool {
items.contains(item.id)
}
```
This function is used in **ItemView**. It allows us to show the heart.fill **[SF Symbol](https://developer.apple.com/design/human-interface-guidelines/sf-symbols/)** alongside a particular item if the user has added it as a favorite. This was done by adding an **@StateObject** variable of favorites to ItemView. (*This is addressed again in the ItemView section*.)

**Save**
```
func save() {
if let data = try? JSONEncoder().encode(items) {
	UserDefaults.standard.set(data, forKey: saveKey)
	}
}
```

This function allows us to save the users favorites preferences to their **[UserDefaults](https://developer.apple.com/documentation/foundation/userdefaults)**. We call this save function inside both the **Add** and **Remove** functions. 

**Add**

``` 
func add(_ item: Item) {
	objectWillChange.send()
	items.insert(item.id)
	save()
}	
```

**Remove**

```
func remove(_item: Item) {
	objectWillChange.send()
	items.remove(item.id)
	save()
}
```
These are the functions that enable the user to add or remove a particular item from their favorites.  Both of these functions call the **save()** function, which adjusts the users **UserDefaults**. These functions are implemented in **ItemDetailView** by adding an **@EnvironmentObject** variable of favorites. More on this in the **ItemDetailView** section. 

*Now that I had the basic files in place for our JSON files, Bundle-Decodable, Favorites, and our Item and MealPlan structs I could start implementing the views that would allow our users to browse the different items and meal plans!*

---
## Architecture / Features
![Image](https://img.shields.io/badge/ItemView-Green
) ![Image](https://img.shields.io/badge/ItemDetailView-Green
) ![Image](https://img.shields.io/badge/ItemInfoView-Green
) ![Image](https://img.shields.io/badge/MealPlanView-Green
) ![Image](https://img.shields.io/badge/MealPlanDetailView-Green
) ![Image](https://img.shields.io/badge/MealPlanInfoView-Green
) ![Image](https://img.shields.io/badge/WelcomeView-Green
) ![Image](https://img.shields.io/badge/HomeView-Green
)

### ItemView
---
` ItemView.swift `

When envisioning what the item view would look like to the user I decided ultimately to go with a [list](https://developer.apple.com/design/human-interface-guidelines/lists-and-tables/). I thought that it would be a cool feature to allow the users to either [search](https://developer.apple.com/design/human-interface-guidelines/search-fields/) for an item in the list, or to [sort](https://developer.apple.com/documentation/foundation/filters_and_sorting/) the list as they see fit. *This feature would gain importance as items are added in real world applications, etc*. 


#### Sorting & Filtering our list
I started by adding the following [@State](https://developer.apple.com/documentation/swiftui/state/) properties to **ItemView** that would track the appropriate changes when the user either searches, or filters the list of items:

```
@State private var searchText = ""
@State private var sortType = SortType.default // (enum SortType)
@State private var showingSortOptions = false
```
I then created two [computed properties](https://www.avanderlee.com/swift/computed-property/) that would facilitate the search and filter features for the user. 

>**filteredItems**
>**sortedItems**

The **filteredItems** variable states if the search text box is empty, return the default list to the user. If something is entered in the search text box, return those items. This is done by returning this code:

``` 
return items.filter {
$0.name.localizedCaseInsensitiveContains(searchText) }
```

*This feature will be incorporated in our SwiftUI as a search bar.*

---
The **sortedItems** variable contains a [switch statement](https://www.hackingwithswift.com/sixty/3/8/switch-statements) that will allow the user to filter the list of items by three different cases:

* default
* alphabetical
* type (main entree or side)

The switch statement changes the case of our **@State private variable sortType**. To do this I created an [enum](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/enumerations/) called **SortType**. This enum includes a case of **default, alphabetical, and type**. The **@State** variable of sortType was then set to equal SortType.default. Whew!!

*This feature will be incorporated as a button.*

---

#### List of Items

The actual list of items is displayed to the user using a [NavigationView](https://developer.apple.com/documentation/swiftui/navigationview/) that includes a List of sorted items. The List accepts a [closure](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/) where we pass an item in. Inside of the closure we include a [NavigationLink](https://developer.apple.com/documentation/swiftui/navigationlink/) that includes **ItemDetailView** (A new view that includes the item information. More on this view below). The label for the NavigationLink includes an image as well as the name of the item and the serving size. The label was created by nesting a [VStack](https://developer.apple.com/documentation/swiftui/vstack/) inside of an [HStack](https://developer.apple.com/documentation/swiftui/hstack/). I used several modifiers to adjust the image. 

**Screenshot**

*The list of items*
![Image](https://github.com/beamthecode/HealthPrep/blob/main/ItemView-List.jpg?raw=true)


---
#### Favorites

`@StateObject var favorites = Favorites()`

Within the list I wanted to include an image to show whether the user had favorited a particular item. The actual button to favorite an item is found in **ItemDetailView**. I added an **@StateObject** variable of favorites that would track whether an item had been favorited. This would be presented as an **SF Symbol** in the shape of a red heart. This was implemented with the following code, which uses our **contains()** function from our **Favorites.swift** file.

```
if favorites.contains(item) {
	Spacer()
	Image(systemName: "heart.fill")
		.foregroundColor(.red)
}
```

Additional information on favorites and their implementation in **ItemView, ItemDetailView, MealPlanView**, and **MealPlanDetailView** can be found above in the **Favorites** section.

Lastly, I added a **[navigationTitle](https://developer.apple.com/documentation/realitykit/realityviewcontent/body/navigationtitle(_:)-1bx9d/)** of "Items". Then I had to implement the search and filter features mentioned above. Under the navigationTitle I added the following code to add the search box:

`.searchable(text: $searchText, prompt: "Search for an Item")`

I added a [toolbar](https://developer.apple.com/documentation/swiftui/view/toolbar(content:)-5w0tj) that included a button that would allow the user to sort the list by one of our three options (default, alphabetical, or by dish type). This button presents the **arrow.up.arrow.down** SF Symbol. I then added a [confirmation dialog](https://developer.apple.com/documentation/swiftui/view/confirmationdialog(_:ispresented:titlevisibility:presenting:actions:)-9ibgk) that would provide the three buttons that would allow the user to sort the list. 

**Screenshots**

---
*Typing a A in the search box*
![Image](https://github.com/beamthecode/HealthPrep/blob/main/ItemViewSearch-1.jpg?raw=true)

*Adding letters to the search*
![Image](https://github.com/beamthecode/HealthPrep/blob/main/ItemViewSearch-2.jpg?raw=true)

*The sort feature button*

![Image](https://github.com/beamthecode/HealthPrep/blob/main/SortButton-1.jpg?raw=true)

*Tapping on the sort button*

![Image](https://github.com/beamthecode/HealthPrep/blob/main/SortButton-2.jpg?raw=true)

*When the user favorites an item in ItemDetailView. Notice the heart!*

![Image](https://github.com/beamthecode/HealthPrep/blob/main/ItemViewFavorites1.jpg?raw=true)





---

### WelcomeView

 I briefly want to touch on **WelcomeView**. One of my goals in building the layout was to provide the user a great viewing experience no matter what size of device that they were using. To do this, I added a new SwiftUI view called WelcomeView. This is a view that would be presented to the user when they tapped into **ItemView**. This would only be done if they were using larger devices such as iPads. The code for WelcomeView is basically just two **Text** fields. The first text field welcomes the user to **HealthPrep** and the second **Text** field provides instruction to the user on how to navigate the ItemView. On larger devices the list appears as a menu on the left hand side of the screen. Once the user taps into the list on a particular item **WelcomeView** is dismissed. It does not appear again. It is solely to provide a good user experience on larger devices. I think this is a nice addition. 
 
*WelcomeView presented on an iPad*

![Image](https://github.com/beamthecode/HealthPrep/blob/main/WelcomeView-1.jpg?raw=true)

![Image](https://github.com/beamthecode/HealthPrep/blob/main/WelcomeView-2.jpg?raw=true)

---

### ItemDetailView
---
`ItemDetailView.swift`

Once the user taps an item in our list in **ItemView** the user navigates to a new view called **ItemDetailView**. This new view will present an image of the item, important basic facts, a description of the item, and the health facts of the item. Lastly there will be a **button** where a user can add the item to their **favorites**. 

I started by adding a [ScrollView](https://developer.apple.com/documentation/swiftui/scrollview/). Inside of the ScrollView I added a **VStack**. Next I nested a [ZStack](https://developer.apple.com/documentation/swiftui/zstack/) inside of the VStack with an **alignment** of **bottomTrailing**. Inside of the **ZStack** I added an Image. Below the image I added a **Text** field.  Both the image and text include several **modifiers**. This is the code that presents the item image and photo credit to the user. The photo credit text appears in the bottom right hand corner of the image. 

The code syntax looks like this

```
ScrollView {
	VStack {
		 ZStack(alignment: .bottomTrailing) {
			Image(decorative: item.id)
				.modifiers
	        Text(item.imageCredit)
	           .modifiers
		}
	}
}
```

**ItemInfoView**

At this point I wanted to present the important basic facts of the item to the user. With user experience in mind, again I thought about different device sizes. What if we wanted to add basic facts in the future? Layouts would differ across device sizes. In thinking about this I decided to add a new **SwiftUI** view called **ItemInfoView**. We could present this view in **ItemDetailView**

I decided that **ItemInfoView** would include two placeholder facts, serving size and price. I started by creating two **variables**. 

>var price: String {
>String(repeating: "$", count: item.price)
>}
>
>var serving: String {
>item.serving
>}

Inside the body I added a [Group](https://developer.apple.com/documentation/swiftui/group/). The **Group** contains two **VStacks**. Each VStack contains two **Text** fields. One text field serves as a title, and the other text field presents the serving and price for the respective item. 

```
Group {
	VStack {
		Text()
			.modifier()
		Text()
			.modifier()
}
	VStack {
		Text()
			.modifier()
		Text()
			.modifier()

	}
}
```
Back in **ItemDetailView** I now had to incorporate **ItemInfoView** into our layout.

I added two new variables (**sizeClass** & **typeSize**) that included the [@Environment](https://developer.apple.com/documentation/swiftui/environment) property wrapper.

`@Environment(\.horizontalSizeClass) var sizeClass`
`@Environment(\.dynamicTypeSize) var typeSize`

I also added a variable called favorites that would would watch our **@ObservableObject** of **Favorites**. To do this I added the [@EnvironmentObject](https://developer.apple.com/documentation/swiftui/environmentobject) property wrapper.

`@EnvironmentObject var favorites: Favorites`

Now back inside of our **VStack** in **ItemDetailView** I added an **HStack** This is where we will add our code to provide for viewing our **ItemInfoView**. I utilized both our **sizeClass** and **typeSize** variables here by using an [if else statement](https://www.hackingwithswift.com/read/0/8/conditional-statements). 

If the user is on a device that is larger **ItemInfoView** will be presented slightly differently. This depends on the number of facts we are presenting to the user about the item. I like this code. As this is a template I hope to use for future projects this code already provides built in functionality. 

```
HStack {
	if sizeClass == .compact && typeSize > .large {
		VStack(spacing: 10) {
			ItemInfoView(item: item) }

	} else {
	 ItemInfoView(item: item)
	}
}
 ```

Next I wanted to present the item description, health facts, and favorites button to the user. 

I added a **Group**. Inside of the group I added three **Text** fields. One for the item description, one for a **title** of health facts,  and one for the health facts themselves. 

Then below that I added a **Button**. The favorites button needed to allow the user to either add the item to their favorites, or if the item was already a favorite, to remove it from their favorites. (More on this functionality in the **Favorites** section above). Thus the text that is presented to the user is based on an optional. To do this I added an **if else statement** to the button. Basically is the item a favorite? If so present "Remove from Favorites" to the user. If the item is not a favorite, "Add to Favorites" is presented to the user. 

*The code for this looks like this:*

```
Group {
	Text()
		.modifier()
	Text()
		.modifier()
	Text()
	.modifier()

   Button(favorites.contains(item) ? 
	   "Remove from Favorites" : "Add to Favorites) {
		if favorites.contains(item) {
			favorites.remove(item)
		} else {
		favorites.add(item)
	}
}
```

Lastly, I added a [navigationTitle](https://developer.apple.com/documentation/swiftui/view/navigationtitle(_:)-43srq) of the item name. My app was starting to come together!

**Screenshots**

*ItemDetailView on iPhone 15 Pro*

![Image](https://github.com/beamthecode/HealthPrep/blob/main/ItemDetailView-Pro1.jpg?raw=true)

*ItemDetailView on an iPad*

![Image](https://github.com/beamthecode/HealthPrep/blob/main/ItemDetailView-iPad1.jpg?raw=true)

---

### MealPlanView
---
`MealPlanView.swift`

I really liked the way that the list looked in **ItemView** so I ultimately decided to build out **MealPlanView** in the same way. I think that the list layout provides a good template in terms of adding meal plans in the future. For this mock up application I decided to add three meal plans to start. 

*I wanted to include the same search, sort, and favorite capabilities that I did in* **ItemView** and **ItemDetailView**. 

To incorporate these features into **MealPlanView** I added three **@State** properties to support sort / search functionality:

>@State private var searchText = ""
>@State private var sortedType = SortedType.default
>@State private var showingSortOptions = false

*I created an enum called SortedType that includes three cases: default, alphabetical, and name.* You will notice that the **@State private var sortedType** references the default case of **SortedType**. 

I then added this **@StateObject** to support our **Favorites** functionality.

>@StateObject var mealFavorites = MealPlanFavorites()

The variable mealFavorites references our **@ObservableObject** Favorites from our `Favorites.swift` file. (More in depth detail above in the Favorites section.)

I then created the same two computed properties that I had in **ItemView** that assist with the search and sort functionality.

```
var filteredMealPlans: [MealPlan] {
// contains an if else statement that returns filtered searchText
}

var sortedMealPlans: [MealPlan] {
// includes a switch statement that returns sorted meal plans 
based on one of three sortedTypes (.default, .alphabetical, .name) 
} 
```

With that functionality out of the way I could go about building out the list. With each meal plan in the list I wanted to present an image, as well as the name and a small placeholder description of the meal plan. 

Each meal plan would be a **navigationLink** into **MealPlanDetailView** where the user could read more about the respective meal plan they had tapped on. The basic architecture would include a **NavigationView** with a **List** of (sortedMealPlans) inside of it. The list includes a **closure** that takes in mealPlan. The label for the list includes an **HStack** that includes an **image** with several modifiers applied to it. Inside of the HStack I nested a **VStack** that includes the two text fields for the meal plan name and short description. 

*Here is the basic syntax of our list*:

```
NavigationView {
	List(sortedMealPlans) { mealPlan in
		NavigationLink {
			MealPlanDetailView(mealPlan: mealPlan)
				} label: {
					HStack {
						Image(mealPlan.type)
							.modifiers()
						VStack {
						Text(mealPlan.name)
						Text("\(mealPlan.meals")
				}
			}
		}
	}
}
```
I added this piece of code that would show a heart next to our meal plan information if the particular meal plan had been favorited by the user.

```
if mealFavorites.contains(mealPlan) {
	Spacer()
	Image(systemName: "heart.fill)
	.foregroundColor(.red)
}
```

Lastly I added the following features to **MealPlanView** (More on these particular items and their build out can be found in **ItemView**.)

*  **navigationTitle** of Meal Plans
* **.searchable** text box that would allow the user to search for a particular meal plan. (Gains more importance as meal plans / items are added.)
* **.toolbar** that adds the arrow up arrow down **SF Symbol** to the upper right hand corner of the app. 
* **.confirmationDialogue** that references our toolbar and allows the user to sort the list of meal plans by either the default setting, alphabetically, or by meal plan. 
* **WelcomeView()** This view is presented when a user is on larger devices such as an iPad. This view presents a welcome message as well as instructions on how to use the app. (More on this above in the **WelcomeView** section.)

The code syntax for this looks like:

```
.navigationTitle()
.searchable()
.toolbar {
	Button {
	} label: {
		Label()
		}
	}

	.confirmationDialogue() {
	Button() { }
	Button() { }
	Button() { }
	}

	WelcomeView()
}
```

**Screenshots**

*The list of available meal plans.*

![Image](https://github.com/beamthecode/HealthPrep/blob/main/MealPlanView-1.jpg?raw=true)

*When the sort button is tapped*

![Image](https://github.com/beamthecode/HealthPrep/blob/main/MealPlanViewSort1.jpg?raw=true)

*When a meal plan is tapped as a favorite in MealPlanDetailView. Notice the heart!*

![Image](https://github.com/beamthecode/HealthPrep/blob/main/MealPlanView-Favorites1.jpg?raw=true)


*MealPlanView (list of meal plans with WelcomeView) presented on iPad*

![Image](https://github.com/beamthecode/HealthPrep/blob/main/MealPlanView-iPad1.jpg?raw=true)


---
### MealPlanDetailView
---
`MealPlanDetailView.swift`

Once the user taps a meal plan in **MealPlanView** the user is navigated to a new view called **MealPlanDetailView**. This view includes an image of the final prepared meal plan, basic important facts, a description, main entrees included in the meal plan, as well as the sides included in the meal plan. At the bottom of the view there is also a button where the user can add the particular meal plan to their favorites.

First I added these **@Environment** and **@EnvironmentObject** variables. (Please see **ItemInfoView** and **Favorites** sections above for more information.)

>@Environment(\.horizontalSizeClass) var sizeClass
>@Environment(\.dynamicTypeSize) var typeSize
>@EnvironmentObject var mealFavorites: MealPlanFavorites

To create the layout I started by adding a **ScrollView**. Inside of the ScrollView I added a **VStack**. Then inside the VStack I nested a **ZStack** that contains an **Image** (photo of meal plan) and a **Text** field (containing image credit). After the ZStack, but still nested in the VStack I added an **HStack**. This HStack contains the code for different device presentation that I referenced in **ItemDetailView** as well as **ItemInfoView**. Inside the Hstack I nested a VStack that contains the code from **MealPlanInfoView**. (Please see **ItemInfoView** for more information on the code for this view. It is identical code, so I chose not to duplicate that section.) Both sizeClass and typeSize are related to presenting **MealPlanInfoView** to the user on different sized devices. 

Below the HStack,  still in the VStack the HStack was nested in, I nested a **Group**.  This group contains five **Text** fields as well as our **Favorites** button. The five text fields provide the following:

* The meal plan description
* A title of "Entrees"
* The list of entrees
* A  title of "Sides"
* The list of sides

The favorites button itself contains an **if else statement**. This statement includes an optional that presents either "Remove from Favorites" or "Add to Favorites" to the user depending on if the user has favorited the meal plan or not. 

The basic code syntax of this view:

```
ScrollView {
	VStack() {
		ZStack() {
			Image()
				.modifiers()
			Text()
		}
		
		HStack {
			VStack {
			}
		}
		.modifiers()

		Group {
		Text()
		Text()
		Text()
		Text()
		Text()

		Button() {
		
			}
		}
	}
}
```
Lastly I added a **navigationTitle** of the meal plans name. I really liked the way that this looked to the user! (For additional information on coding for this view please see **ItemDetailView**.)

**Screenshots**

*MealPlanDetailView on  iPhone 15 Pro*

![Image](https://github.com/beamthecode/HealthPrep/blob/main/MealPlanDetailView1.jpg?raw=true)

![Image](https://github.com/beamthecode/HealthPrep/blob/main/MealPlanDetailView2.jpg?raw=true)

*MealPlanDetailView presented on iPad*

![Image](https://github.com/beamthecode/HealthPrep/blob/main/MealPlanDetailView-iPad1.jpg?raw=true)


---

### HomeView / ContentView
---
`HomeView.swift` `ContentView.swift`

Now that I had built out the views for items and meal plans I decided to build out a new view called **HomeView**.  This view would present a mock up logo and the name of the app. Along with this new view I wanted to create a [TabView](https://developer.apple.com/documentation/swiftui/tabview/) in [ContentView](https://www.hackingwithswift.com/books/ios-swiftui/understanding-the-basic-structure-of-a-swiftui-app#:~:text=ContentView.,to%20use%20in%20your%20app.) that would present tabs at the bottom of the screen. This would include a tab for **HomeView**, **ItemView**, **MealPlanView**, and eventually **OrderView** and **UserView** when I build out those views and features in future modifications to this app. This would allow the user to be able to navigate between the tabs at will. Currently I am looking at HomeView as a placeholder view. The functionality of this view will most likely be altered as I build out the future phases of this project. *I did want to include this view in the current update as it gives the app a real world feel as well as presention, and it reinforces all of the work that I am doing. It feels good to be building this project out!*

Here is the syntax for **HomeView**:

```
ZStack {
	
	VStack {
		Image()
			.modifiers()
		Text()
			.modifiers()
	}	
}
```
Now back in **ContentView** I went about creating the **TabView**. 

Here is the syntax for **ContentView**:

```
TabView {
	HomeView()
		.tabItem {
			Label()
		}

	ItemView()
		.tabItem {
			Label()
		}

	MealPlanView()
		.tabItem {
			Label()
		}
}
```

Voila! At this point I was feeling really good about my progress on the first phase of this project build out. I think that my work on this project shows my understanding of [Swift](https://developer.apple.com/swift/) and [SwiftUI](https://developer.apple.com/xcode/swiftui/). I am looking forward to growing my knowledge and skills. I can't wait to build out the next phase! 


**Screenshots**

*The tabview layout*

![Image](https://github.com/beamthecode/HealthPrep/blob/main/TabView1.jpg?raw=true)

*HomeView presented on iPhone 15 Pro*

![Image](https://github.com/beamthecode/HealthPrep/blob/main/HomeView1.jpg?raw=true)

*HomeView presented on iPad*

![Image](https://github.com/beamthecode/HealthPrep/blob/main/HomeView-iPad.jpg?raw=true)



---

## Future Modifications

![Image](https://img.shields.io/badge/OrderView%20-%20Green
) ![Image](https://img.shields.io/badge/UserView%20-%20Green
) ![Image](https://img.shields.io/badge/UserAuthentication%20-%20Green
) ![Image](https://img.shields.io/badge/Cloud%20Firestore%20-%20Green
) ![Image](https://img.shields.io/badge/Custom%20color%20%26%20graphics%20-%20Green
)
* Create an order view(s) that includes shopping cart / full functioning order capabilities
* Create a user view that will include user information / favorites 
* Add user [authentication](https://developer.apple.com/documentation/authenticationservices)
* Implement  [Cloud Firestore](https://firebase.google.com/docs/firestore)  database backend to store user information / favorites / orders for  [persistance](https://medium.com/@rashadsh/data-persistance-in-swift-different-ways-to-save-your-data-954cd2559a75#:~:text=There%20are%20three%20different%20types,(such%20as%20using%20iCloud).)
* Custom color / graphics / accessibility revisions
* Continuous improvement

---
## Notes

I would like to say thank you for checking this project out. I hope that the read me provided you a good amount of the information, logic, and images to support my project objectives and theme. If you have any suggestions or advice please reach out! I want to consistently gain more knowledge. I love to learn, so please let me know any ways that I can improve. I want to be the biggest asset I can to those that I work for and work with. Thank you!

All images included in this mock up app were downloaded from [Unsplash](https://unsplash.com). Credit to photographers is included on each image presented in the app. 

---

## Credit

![Image](https://img.shields.io/badge/Thank%20You-Green
) ![Image](https://img.shields.io/badge/Paul%20Hudson-%40TwoStraws-Green
) ![Image](https://img.shields.io/badge/100%20Days%20of%20SwiftUI%20-%20Green
) ![Image](https://img.shields.io/badge/Codecademy%20-%20Green
) ![Image](https://img.shields.io/badge/iOS%20Developer-%20Green
)


First I would like to thank Paul Hudson [@TwoStraws](https://github.com/twostraws) for being such a great teacher. I learned so much completing the [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui) course. I subscribe to [Hacking With Swift](https://www.hackingwithswift.com). I have gained very valuable pieces of code that I can use and reuse in future apps that I build out. I look forward to learning much more as I continue my journey. Why sharpen your pencil when you can start drawing, right? Thanks again, Paul!

I would also like to thank [Codecademy](https://www.codecademy.com). I completed their iOS Developer Career Path. They were my first introduction to Swift and SwiftUI. They provided me with a cost effective way to start gaining the knowledge to pursue a career as a developer. For that I will always be sincerely grateful. I even contributed to their website! One of my first experiences working with **Github** was contributing to [Codecademy Docs](https://github.com/Codecademy/docs). I actually wrote the text file for the [.foregroundColor](https://www.codecademy.com/resources/docs/swiftui/viewmodifier/foregroundColor) modifier! Thank you Codecademy!



## License

**MIT License 2023**
