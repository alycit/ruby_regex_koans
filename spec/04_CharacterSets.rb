describe "Character Sets" do
	it 'use [ ] to allow more than one possible character in this position' do
    workingPattern = /^d[iu]g$/
    
    fixThisPattern = /^__$/
    
    'dig'.should match(workingPattern)
    'dug'.should match(workingPattern)
    
    'spin'.should match(fixThisPattern)
    'span'.should match(fixThisPattern)
    'spun'.should match(fixThisPattern)
  end
  
  it "use - to specify a range of characters inside [ ]" do
    workingPattern = /^[a-c][a-c][0-9]$/
    
    fixThisPattern = /^__$/
    
    'bc3'.should match(workingPattern)
    'aa8'.should match(workingPattern)
    
    'Azy'.should match(fixThisPattern)
    'Dyy'.should match(fixThisPattern)
    'Bxx'.should match(fixThisPattern)
  end
  
  it "since - is a special character inside [ ], you must escape it with backslash" do
    fixThisPattern = /^__$/
    
    '1+2'.should match(fixThisPattern)
    '2-3'.should match(fixThisPattern)
    '4*6'.should match(fixThisPattern)
  end
  
  it "mixing single characters and ranges is okay" do
    workingPattern = /^[a-zA-Z][a-zA-Z][0-4abc]$/
    
    fixThisPattern = /^__$/
    
    'dG2'.should match(workingPattern)
    'ZZb'.should match(workingPattern)
    
    '#444444'.should match(fixThisPattern)
    '#ffffff'.should match(fixThisPattern)
    '#c0c0c0'.should match(fixThisPattern)
  end
  
  it "caret negates the character set: 'Must Be One Of These' becomes 'Must NOT Be One Of These'" do
    workingPattern = /^x[^a-z]z$/

    fixThisPattern = /^__$/
    
    'x3z'.should match(workingPattern)
    'xYz'.should match(workingPattern)
    
    '3.2'.should match(fixThisPattern)
    '5 8'.should match(fixThisPattern)
    '3x3'.should match(fixThisPattern)
  end
end