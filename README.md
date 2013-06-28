Regular Expression Koans
========================

A series of tutorials on Regular Expressions.

Learn how to write, read, and use Regular Expressions by completing or correcting
code to make failing Unit Tests pass. Each Koan includes a series of Unit Tests
which illustrate Regular Expression principles and techniques. I have made an effort
to avoid making forward references in the tutorial sequence, but there are enough
back references to earlier Koans that it would be best to complete the Koans in
the order presented.

Ruby's Regular Expression engine is very similar to that of many other
programming languages. It differs only in esoteric details.

To practice, to try out some code before using it in your program, or just to play around,
[rubular](http://rubular.com) is a fantastic Regular Expression resource.  This web tool should be in the Bookmarks list of every programmer.

With many thanks to:
*  Aaron Brown for the original Javascript version of the [Regex Koans](https://github.com/frenchroasted/RegexKoans)
*  [EdgeCase](http://edgecase.com/) for the original, inspired, and inspirational [Ruby Koans](http://rubykoans.com/)

Installation
------------

Checkout or download the zipped version of this project and extract it to a folder.

Usage
-----
* navigate to the directory you extracted your files to in a terminal
* run 'bundle' at the command line
* run 'rake' at the command line
* Edit the .rb file that the rspec results tell you to edit
    * The output will guide you to which line of code needs attention.  For example the output below says that the code to fix is on line 3 of `01_Basics.rb`.  The specific error is `expected a to match /^FILL ME IN$/`.  The `FILL ME IN` is where you need to make changes in `01_Basics.rb` on line 3. 

```
Here's your next assignment:
  Basics -> should demonstrate basic RegEx syntax by replacing /__/ with /a/

The current error:
expected a to match /^FILL ME IN$/

Get in there soldier! There's code to fix:
  /Users/alycit/DBC/ruby_regex_koans/spec/01_Basics.rb:3:in `block (2 levels) in <top (required)>'

Current Progress: [X_________________________________________________] 0/68
```

* run rake again until all the tests are passing.