# smart_pension - Ruby Developer Test
Write a ruby script that parses webserver.log, and outputs two lists:
 - list of web pages ordered by visits (descending)
 - list of web pages ordered by unique IP address visits (descending)
 
 ## Running the script
 1. Make sure [ruby 3.1.2](https://www.ruby-lang.org/en/downloads/) is installed
 2. Clone the repo
 3. Go to the repo and run `bundle install`
 4. Run specs with `rspec`
 5. Run the script `./parser.rb webserver.log`

 ```bash
 ./parser.rb webserver.log

 SORT BY HITS DESC
 path: /about/2 views: 90
 path: /contact views: 89
 path: /index views: 82
 path: /about views: 81
 path: /help_page/1 views: 80
 path: /home views: 78

 SORT BY UNIQUE_HITS DESC
 path: /index unique_views: 23
 path: /home unique_views: 23
 path: /contact unique_views: 23
 path: /help_page/1 unique_views: 23
 path: /about/2 unique_views: 22
 path: /about unique_views: 21
 ```

## Implementation
### Scanner
I created two classes, the base class `Scanner` and the sub-class `PageViewScanner`. The latter caters specifically to the contents in `webserver.log`. It will scan for and return `path` and `ip_address`.

A scanner sub-class needs to implement the `each_line` method.

### Repository
I created two classes, the base class `Repository` and the sub-class `PageViewRepository`. The latter store page views so we can sort them by the number of views or unique views.

A repository sub-class needs to implement the `store` method.

### PageViewParser
I created a wrapper for both `Scanner` and `Repository` objects. This is the glue that receives a file, scans for the `ip_address` and `path` and outputs it.

## Extensibility
I created two base classes `Scanner` and `Repository` that act as a guide when implementing new requirements in the future, i.e. a log with different format, sort using another attribute, etc

Fellow developers can extend these base classes to meet future requirements.

I did not create a base class `Parser` since I didn't find a good abstraction for it. I went for the specific `PageViewParser` class for ease and simplicity. 

## TODO
- Make `PageViewScanner` robust by validating if `path` and `ip_address` fits a certain format, i.e. `path` is a valid URL format, `ip_address` is a valid IP address
- Make it possible to output the lists to a file

## Summary
I'm aware that my implementation only fits the requirements of this test and may not be future-proof, especially when new requirements come in. I encourage anyone to try new methods, do not hold on to the current implementation especially when it makes development hard.
