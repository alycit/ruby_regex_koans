describe "Basics" do
	it 'should demonstrate basic RegEx syntax by replacing /__/ with /a/' do
    	'a'.should match(/__/)
  	end

  	it 'should show that a RegEx that is the same as the string will match' do
  		'abcd'.should match(/__/)
  	end

  	it 'should show that a RegEx is case sensitive' do
  		'AbCd'.should match(/__/)
  	end

  	it 'should show that whitespace matters' do
  		'ab cd'.should match(/__/)
  	end

  	it 'should show that testing for does-not-match is useful' do
  		'abcd'.should_not match(/abcd/)
  	end
end