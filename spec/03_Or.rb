describe "Or" do

	it "should demonstrate that pipe character ( | ) is a regex OR" do

		thisPatternWorks = /dog|cat/
		var fixThisPattern = /__/

		'dog'.should match(thisPatternWorks)
		'cat'.should match(thisPatternWorks)

		'hearts'.should match(fixThisPattern)
		'clubs'.should match(fixThisPattern)

	end
end