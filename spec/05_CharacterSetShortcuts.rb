describe "Character Set Shortcuts" do
	it "dot (.) matches anything" do
    fixThisPattern = /^__$/
    
    'dig'.should match(fixThisPattern)
    'dug'.should match(fixThisPattern)
    'd g'.should match(fixThisPattern)
    'd3g'.should match(fixThisPattern)
    'd!g'.should match(fixThisPattern)
    'd(g'.should match(fixThisPattern)
    
    fixThisPattern.source.should match(/\./)
  end
  
  it "dot (.) matches anything... except line-feed" do
    fixThisPattern = /^d.g$/
    
    'd\ng'.should match(fixThisPattern)
  end
  
  it "dot (.) matches dot (.) when used inside [ ]" do
    fixThisPattern = /^__$/
    
    '3.1'.should match(fixThisPattern)
    '3,1'.should_not match(fixThisPattern)
  end
  
  it "to match a dot (.) outside of [ ], it must be escaped with backslash" do
    fixThisPattern = /__$/
    
    'Every sentence must end with a period.'.should match(fixThisPattern)
    'What about questions?'.should_not match(fixThisPattern)
  end
  
  it "backslash-d matches any digit, like [0-9]" do
    # backslash-d is entered like:  \d
    
    fixThisPattern = /^__$/
    
    '1234'.should match(fixThisPattern)
    '3281'.should match(fixThisPattern)
    '5555'.should match(fixThisPattern)
    '9329'.should match(fixThisPattern)
    
    fixThisPattern.source.should match(/d/)
  end
  
  it "backslash-w matches any word character, plus _, like [a-zA-Z0-9_]" do
    # Note: \w may behave differently in other programming languages.
    # for example, numbers may or may not be included. Refer to the
    # language Regular Expression or Pattern API before using \w.

    fixThisPattern = /^__$/
    
    'Dog'.should match(fixThisPattern)
    'cAt'.should match(fixThisPattern)
    '_x_'.should match(fixThisPattern)
    
    fixThisPattern.source.should match(/w/)
  end
  
  it "backslash-s matches any whitespace character" do
    # Whitespace is:
    #   <space>          ( )
    #   tab              (\t)
    #   line feed        (\n)
    #   carriage return  (\r)
    #   form feed        (\f)
    #   vertical tab     (\v)
    # or [ \t\n\r\f\v]
    
    fixThisPattern = /^__$/
    
    '   '.should match(fixThisPattern)
    'x\ny'.should match(fixThisPattern)
    '\t_Z'.should match(fixThisPattern)
    
    fixThisPattern.source.should match(/s/)
  end
  
  it "backslash-D, backslash-W, backslash-S match non-digit, non-word, and non-whitespace" do
    # /\D/ is the same as /[^\d]/
    # /\W/ is the same as /[^\w]/
    # /\S/ is the same as /[^\s]/
    # /\S/ is NOT the same as /[\w\d]/ - why?
    
    whatStringFitsThePattern = "__"
    
     whatStringFitsThePattern .should match(/^[\S][\S][\S]$/)
     whatStringFitsThePattern .should match(/^[^\w\d][^\w\d][^\w\d]$/)
  end
  
  it "character set shortcuts can be used inside [ ]" do
    fixThisPattern = /^__$/
    
    'Dog'.should match(fixThisPattern)
    ' 2 '.should match(fixThisPattern)
    
    fixThisPattern.source.should match(/[\\]/)
  end
end