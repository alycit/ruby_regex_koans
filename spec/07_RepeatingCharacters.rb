describe "Repeating Characters" do
	it "use ? to match Zero or One of a character" do
    # If a character is optional, follow it with a ?
    # in the pattern
    
    fixThisPattern = /^__$/
    
    'son'.should match(fixThisPattern)
    'soon'.should match(fixThisPattern)
    'sooon'.should_not match(fixThisPattern)
  end
  
  it "use + to match One Or More of a character" do
    var thisPatternWorks = /^so+n$/
    
    fixThisPattern = /^__$/
    
    'son'.should match(thisPatternWorks)
    'soon'.should match(thisPatternWorks)
    'soooooooon'.should match(thisPatternWorks)
    'sun'.should_not match(thisPatternWorks)
    
    'x y'.should match(fixThisPattern)
    'x     y'.should match(fixThisPattern)
    'xy'.should_not match(fixThisPattern)
  end
  
  it "use * to match Zero Or More of a character" do
    fixThisPattern = /^__$/
    
    'x y'.should match(fixThisPattern)
    'x     y'.should match(fixThisPattern)
    'xy'.should match(fixThisPattern)
  end
  
  it "use {n} to match a specific count of repeated characters" do
    
    thisPatternWorks = /^xy{3}z$/
    
    fixThisPattern = /^__$/
    
    'xyyyz'.should match(thisPatternWorks)
    
    '614-555-1234'.should match(fixThisPattern)
    '6145551234'.should match(fixThisPattern)
    '614-555-123'.should_not match(fixThisPattern)
    
    fixThisPattern.source.should match(/\{/)
  end
  
  it "use {n,m} to match a range number of repeated characters" do
    
    thisPatternWorks = /^xy{2,5}z$/
    
    fixThisPattern = /^__$/
    
    'xyyyz'.should match(thisPatternWorks)
    'xyyz'.should match(thisPatternWorks)
    'xyyyyyz'.should match(thisPatternWorks)
    'xyz'.should_not match(thisPatternWorks)
    
    '3.1'.should match(fixThisPattern)
    '3.142'.should match(fixThisPattern)
    '3.14159'.should_not match(fixThisPattern)
    
    fixThisPattern.source.should match(/\{/)
  end
  
  it "use {n,} for 'at least n' and {,m} for 'not more than m' repeated characters" do
    fixThisPattern = /^__$/
    
    'a  b'.should match(fixThisPattern)
    'a                                                                 b'.should match(fixThisPattern)
    'a b'.should_not match(fixThisPattern)
    
    fixThisPattern.source.should match(/\{/)
  end
  
  it "repeater characters (?, +, etc.) also work with character sets and shorthand sets like ., backslash-d, etc." do
    # We will try to match a floating point number.
    # Assumptions:
    #   The number must be positive
    #   There must be a whole number part (before the decimal)
    #   There must be a fractional part (after the decimal)
    #   Either or both of these parts may be zero (0)
    
    fixThisPattern = /^__$/
    
    '3.14159'.should match(fixThisPattern)
    '0.9'.should match(fixThisPattern)
    '12345.67890'.should match(fixThisPattern)
    '777'.should_not match(fixThisPattern)
    
    fixThisPattern.source.should match(/[d\[]/)
    fixThisPattern.source.should match(/[*+]/)
    
    # Important Lesson:
    # When writing a regular expression, it is always important to thoroughly
    # define and understand the requirements and assumptions. The regular expression
    # language is very precise. If the requirements are vague or not well-
    # understood, the regex will be unreliable for edge cases.
  end
  
  it "repeater characters are special characters that must be backslash-escaped to match in strings" do
    'x*y=z'.should match(/^__$/)
  end
  
  it ".* can match any amount of anything... except newline" do
    
    ''.should match(/^.*$/)   # here are a couple of free ones for you
    'jgi493ujitgj8g*##@!uiofg893ign4q389A*(eu89*(#=U*@UJ()()0jijge'.should match(/^.*$/)
    
    '__'.should_not match(/^.*$/)   # fix this string to make the test pass
  end
  
  it "use a character set to match anything, including newline" do

    'The quick brown fox\njumped over the lazy dog.\n'.should match(/^__*$/)

  end
  
  it "repeater characters are NOT special characters when used inside [ ]" do
    fixThisPattern = /^__$/
    
    'x*y=z'.should match(fixThisPattern)
    'x+y=z'.should match(fixThisPattern)
  end
  
  it "Real World: Match a quotation" do
    # Assumptions:
    #   The quotation will begin and end with "
    #   The quotation will be a single line (no newlines)
    #   Any other character besides newline may appear in the quotation
    
    fixThisPattern = /^__$/
    
    '"Here today, gone tomorrow."'.should match(fixThisPattern)
    '"Secant, tangent, and cosine. 3.14159!"'.should match(fixThisPattern)
    
    # This example is incomplete and not robust enough for real life.
    # We will learn some techniques to improve it in later Koans.
  end
end