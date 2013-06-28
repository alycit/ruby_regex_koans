describe "Greedy vs Minimal" do
	it "Remember: the String.match() method will return the matched text" do
    # Remember that the match() method will provide the text matched
    # by the pattern. The match() returns an array so that, if the 
    # pattern is a global pattern (#g), all matches can be returned
    # at once.
    # 
    # We will be using the matched value to complete the tests in this Koan.
    
    matches = 'aabbbcc'.match( /b+/ )

    matches[0].should eql('__')
    
  end
  
  it "* and + are 'greedy' and may match more text than you intend" do
    matches = '"One","Two","Three"'.match( /".*"/ )
    
    matches[0].should eql('"One"')    # Change '"One"' so the test passes
  end
  
  # Greedy character matching is a common downfall of many regular expressions.
  # In short, when * or + is used, the regex engine will attempt to use that
  # repeat instruction to capture as much of the string as possible while still
  # satisfying the other criteria in the regex. This can sometimes lead to
  # unexpected results, as illustrated above.
  #
  # Fortunately, this greedy behavior can be easily toggled on and off, as we'll
  # see below. In the case of the One,Two,Three Koan, there are two ways we can
  # match just the "One" portion of the string:
  #   * Use a negative character set
  #   * Turn off greedy matching and use "reluctant" or "minimal" matching instead
  
  it "use a negative character set to control the greedy match" do
    workingMatches = '"One","Two","Three"'.match( /"[^"]*"/ )
    
    tagMatches = '<span class="bold">Hello, world!</span>'.match( /__/ )
    
    workingMatches[0].should eql('"One"')
    
    tagMatches[0].should eql('<span class="bold">')
  end
  
  it "use minimal match to capture the substring" do
    # To change * and + to non-greedy, minimal matching,
    # use *? and +? instead.
    
    fixThisPattern = /__/
    
    matches = '<span class="bold">Hello, world!</span>'.match(fixThisPattern)

    matches[0].should eql('<span class="bold">')
    
    fixThisPattern.source.should_not match(/\[/)
  end
  
  
  # Side note: Have you noticed that none of the above regex patterns use
  # ^ $ like most of the other patterns in earlier Koans?
  #
  # Do you know why?
  
  
  # Remember: 
  #   * and + are greedy by default.
  #   . does not match linefeed (\n), so .* is greedy until it encounters a \n

end