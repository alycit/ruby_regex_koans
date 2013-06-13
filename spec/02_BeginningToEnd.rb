describe "Beginning to End" do
  it '^ anchors RegEx to beginning of the string' do
     'dog cat pony'.should_not match(/^cat/)    # This one already works

     'dog cat pony'.should match(/^___/)        # Fix this one so it passes
  end

  it '$ anchors RegEx to the end of the string' do
     'dog cat pony'.should_not match(/cat$/)  # This one already works

     'dog cat pony'.should match(/___$/)      # Fix this one so it passes
  end

  it 'use both to match the entire input' do
     'dog cat pony'.should_not match(/^cat$/)  # This one already works

     'dog cat pony'.should match(/^___$/)      # Fix this one so it passes
  end

  it 'a RegEx without any anchors will match a substring anywhere in the input' do
     # try using "bc" in the RegEx

     'abcd'.should match(/___/)
  end
end