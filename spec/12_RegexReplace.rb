describe "Regex Replace" do
	# Sometimes, you want to do more than just FIND some text, or validate
  # its format. You may want to construct new strings from old strings.
  # Most (all?) programming languages and editors that provide Regular
  # Expression operations have some kind of "replace" function. This
  # works just like a "Find-and-Replace" tool that is common in any
  # decent text editor, but it adds the power of Regular Expressions
  # to the "Find" part, and it adds Regex capture groups to the
  # "Replace" part.
  
  # Note: Every language and text editor has a different way of referencing
  # capture groups in the Replace operation, so be sure to check the
  # documentation before using this tool.
  
  # Once you've done find/replace using Regex, you'll never go back.
  
  it "simple replacement" do
    
    newString = "dog cat pony".replace( /cat/, 'lemming' )
    
    newString.should eql('__')
  end
  
  it "String.replace is safe even when there is no match" do
    original = "a b a b a b"
    
    newString = original.replace(/x/, "z")
    
    newString.should eql('__')
  end
  
  it "String.replace will replace the full match (or each full match with //g) with the new string" do
    original = '<div id="someId">Hello</div>'
    
    newString = original.replace(/^<div id="([^"]+)">.*?<\/div>$/, 'newId')
    
    newString.should eql('__')
  end
  
  it "to reference a capture group, use $n inside the replacement string" do
    
    # Note: Since Javascript, $ is a special character in the replacement string,
    # to put a literal $ in the replacement string, say $$
    
    original = '<div id="someId">Hello</div>'
    
    newString = original.replace(/^<div id="([^"]+)">.*?<\/div>$/, '$1')
    
    newString.should eql('__')
  end
  
  it "to match a full string but only replace a portion, use group captures carefully" do
    
    original = '<div id="someId">Hello</div>'
    
    newString = original.replace(/^<div id="([^"]+)">(.*?)<\/div>$/, '<div id="$2">$1</div>')
    
    newString.should eql('__')
  end
  
  # By combining all the earlier lessons of capture groups and repeating character logic
  # that we've already covered with backreferences to those captured groups in
  # replacement strings, Regular Expression replacement can be a very powerful tool
  # in a wide variety of circumstances.
  
  it "make a URL into an HTML link" do
    url = 'http://www.google.com/'
    
    fixThisPattern = /__/
    fixThisReplacementString = '__'
    
    newString = url.replace(fixThisPattern, fixThisReplacementString)
    
    newString.should eql('<a href="http://www.google.com/">http://www.google.com/</a>')
  end
  
  it "reformat a date string" do
    originalDate = '20120229'
    
    fixThisPattern = /__/
    fixThisReplacementString = '__'
    
    newDate = originalDate.replace(fixThisPattern, fixThisReplacementString)
    
    newDate.should eql('02/29/2012')
  end
  
  it "strip the comment from this HTML code" do
    html = '<h1>My Title</h1> <!-- useless comment --> <br/>'
    
    fixThisPattern = /__/
    fixThisReplacementString = '__'
    
    newHtml = html.replace(fixThisPattern, fixThisReplacementString)
    
    newHtml.should eql('<h1>My Title</h1>  <br/>')
  end
end