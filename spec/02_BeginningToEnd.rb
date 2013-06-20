describe "Beginning to End" do
  it 'shows that ^ anchors RegEx to beginning of the string' do
     'dog cat pony'.should_not match(/^cat/)    # This one already works

     'dog cat pony'.should match(/^__/)        # Fix this one so it passes
  end

  it 'shows that $ anchors RegEx to the end of the string' do
     'dog cat pony'.should_not match(/cat$/)  # This one already works

     'dog cat pony'.should match(/__$/)      # Fix this one so it passes
  end

  it 'shows that you can use both ^ and $ to match the entire input' do
     'dog cat pony'.should_not match(/^cat$/)  # This one already works

     'dog cat pony'.should match(/^__/)      # Fix this one so it passes
  end

  it 'shows that a RegEx without any anchors will match a substring anywhere in the input' do
     # try using "bc" in the RegEx

     'abcd'.should match(/__/)
  end
end