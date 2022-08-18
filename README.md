# smart_pension - Ruby Developer Test

## Write a ruby script parses webserver.log, and outputs two lists:
 - list of web pages ordered by visits (descending)
 - list of web pages ordered by unique IP address visits (descending)
 
 ## Solution
 ```bash
 ./parser.rb webserver.log
 ```

## Implementation
### Scanner
Create a scanner object that caters specifically to the contents in webserver.log, this object will be used to gather entries from the log and store it into the repository.

### Repository
Create a repository to store page visits (path and IP address). The repository is also responsible for the sorting of its entries.

## Nice to have
Create an abstraction for a page visit for easy storage and sorting. 
