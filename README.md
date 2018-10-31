# HealthyMindsChallenge
Create a TabController app that contains TableViewControllers and a ViewController. The TableViewControllers will display the Modules, Parts, Series, Activities and Tasks. The Activities will display if it is completed or not. If the activity is complete the date it was completed will be displayed.  

Approach:  
1. Create a data structure that conforms to the Codable protocol.
2. Create a data access object (DAO) that serialize the given JSON file into data strcuture from above.
3. Create a storyborad that contain the UI: TabBarController, NavigationController and multiple TableViewControllers.
4. In the first TableViewController call the DAO in #2 and retrieve the serialed data to present.
5. Allow the user to navigate from Module to Parts to Series to Activities and view related tasks.
