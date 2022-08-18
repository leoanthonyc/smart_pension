# smart_pension - Ruby Developer Test
Write a ruby script parses webserver.log, and outputs two lists:
 - list of web pages ordered by visits (descending)
 - list of web pages ordered by unique IP address visits (descending)
 
 ## Running the script
 ```bash
 ./parser.rb webserver.log
 ```

## Implementation
### Scanner
Create a scanner object that caters specifically to the contents in webserver.log, it will scan for `path` and `ip_address` from the log and store it into the repository.

A scanner needs to implement the `each_line` method. 

### Repository
Create a repository to store page visits. The repository is also responsible for the sorting of its entries.

A repository needs to implement the `store` method.

I created the sub-class `PageViewRepository` to meet the sorting requirements. Adding these sorting methods to the base class isn't advisable since `hits` and `unique_hits` only makes sense in the page view context.
2. `sort_by_hits`
3. `sort_by_unique_hits`

## Extensibility
I created two base classes `Scanner` and `Repository` that act as a guide when implementing new requirements in the future, i.e. a log with different format, sort using another attribute, etc

Fellow developers can extend these base classes to meet future requirements.

## Nice to have
Create an abstraction for a page visit for easy storage and sorting. 
