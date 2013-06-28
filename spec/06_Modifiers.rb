describe "Modifiers" do
   __ = 0

  it "regular expressions don't have to be case-sensitive" do
    # In many programming languages, especially those that
    # use the /^whatever$/ pattern syntax, modifiers are single
    # characters that come after the //. 
    # 
    # To make a JavaScript Pattern non-case-sensitive, begin the
    # put "i" after the //.
    # 
    # Note: Some programming languages do not support modifiers like
    # this. These languages typically have a flag that can be set
    # within the pattern string to toggle case-sensitivity. Refer
    # to the language API to see how to make a case-insensitive match
    # in your language.
    
    fixThisPattern = /^abc$/
    
     'abc'.should match(fixThisPattern)
     'ABC'.should match(fixThisPattern)
     'AbC'.should match(fixThisPattern)
    
    fixThisPattern.source.should_not match(/\[/)
  end

  it "treat string as multiple lines" do
    # //m -> input string is multiple lines, so
    # ^ and $ match begin-end of each line, separated
    # by line feed. ^ and $ match intermediate
    # "lines" within input string
    
    fixThisPattern = /^.*$/
    
    matches = "abc\nxyz".match(fixThisPattern)
    
     'abc\nxyz' .should match(fixThisPattern)
    
    matches.length.should eql(2)
    matches[0].should eql("__")
    matches[1].should eql("__")
    
    fixThisPattern.source.should_not match(/n/)
  end
end