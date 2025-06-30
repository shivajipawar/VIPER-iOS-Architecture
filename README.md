# VIPER Architecture Diagram

```
 +--------+         +-------------+         +-------------+         +--------+
 |        |   1     |             |   2     |             |   3     |        |
 |  View  +-------->+  Presenter  +-------->+ Interactor  +-------->+ Entity |
 |        |         |             |         |             |         |        |
 +--------+         +------+------+         +------+------+         +--------+
                          |                         |
                    4     |                         |   5
                          v                         v
                     +----+-----+             +-----+----+
                     |  Router  |<------------+  API / DB |
                     +----------+    6        +----------+
```

🔧 VIPER Component Responsibilities

1. View
Displays UI elements and receives user input.
Passes user interactions to the Presenter.
Doesn’t contain any business logic.

2. Interactor
Contains the business logic.
Handles data fetching (from API, DB, etc.).
Sends the result to Presenter.

3. Presenter
Middleman between View and Interactor.
Takes input from View and asks Interactor to process.
Takes output from Interactor and formats it for the View.

4. Entity
Contains plain model/data objects.
Often used in Interactor.
Doesn’t contain business logic or UI code.

5. Router (Wireframe)
Handles navigation and screen transitions.
Creates module and injects dependencies.



🧠 Responsibilities Recap
# Component	  Responsibility
  View	      Displays UI, forwards events to Presenter
  Presenter	  Handles logic, talks to View, Interactor, Router
  Interactor	Executes business logic, works with Entity
  Entity	    Plain data model
  Router	    Handles screen navigation and module creation


✅ Example Scenario: Login
View: User taps Login → sends event to Presenter
Presenter: Validates → tells Interactor to authenticate
Interactor: Checks credentials, maybe from API
Entity: User model used here
Interactor → Presenter: Success/failure
Presenter → View: Show message or navigate
Presenter → Router: Navigate to Home if successful

📌 Why Use VIPER?
✅ High modularity
✅ Testable components
✅ Scales well for large codebases
✅ Clear separation of responsibilities

🚫 When Not to Use?
For simple apps, VIPER might be overkill.
Has boilerplate and more files to manage.

