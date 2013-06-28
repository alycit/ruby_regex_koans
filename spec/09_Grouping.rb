describe "Grouping" do
  # Until now, we have used special characters and modifiers like ? and +
  # with single characters. All regular expression operators can also be
  # applied to sequences by grouping the sequence inside ( ) like
  # "ababababab" =~ /^(ab)+$/
  
  it "the cat is optinal" do
    
    fixThisPattern = /^DogCatPony$/
    
    'DogCatPony'.should match(fixThisPattern)
    'DogPony'.should match(fixThisPattern)
  end
  
  it "anything goes as long as we get to keep the pony" do
    
    fixThisPattern = /^DogCatPony$/
    
    'DogCatPony'.should match(fixThisPattern)
    'DogPony'.should match(fixThisPattern)
    'CatPony'.should match(fixThisPattern)
    'DogDogDogDogCatPony'.should match(fixThisPattern)
  end
  
  it "you can nest regular expression operations inside ( )" do
    
    fixThisPattern = /^DogCatPony$/
    
    'DogCatPony'.should match(fixThisPattern)
    'DogCatsPony'.should match(fixThisPattern)
    'DogPony'.should match(fixThisPattern)
    'CatPony'.should match(fixThisPattern)
    'DogDogDogDogCatsPony'.should match(fixThisPattern)
  end
  
  it "you can nest ( ) inside ( )" do
    
    fixThisPattern = /^__$/
    
    'abcd'.should match(fixThisPattern)
    'abcdabcdabcd'.should match(fixThisPattern)
    'ababababcdabab'.should match(fixThisPattern)
  end
  
  it "Real World 3: very VERY basic email address verification" do
    # Assumptions:
    #   * email address is composed of [username]@[domain]
    #   * both username and domain are required
    #   * username portion of email may contain letters, numbers, _ - . +
    #   * domain is composed of [letters/numbers].[letters/numbers]....repeat
    #   * in domain, . is the separator between each unit. Domain cannot begin or end with .
    #   * email address will be all in lowercase
    # 
    # Note that this is an oversimplification of the real email address
    # syntax requirements. In fact, using a regular expression to check
    # the full email address specification (http://www.ietf.org/rfc/rfc822.txt)
    # is very, very complicated. In this case, as with many others,
    # it is important to understand the business rules that apply, and
    # to not over-engineer. Here, we're agreeing that these are the only
    # rules we care about for email addresses, so our regex doesn't need
    # to worry about all the other stuff.
    
    fixThisPattern = /^__$/
    
    # Hint: Develop the regex in pieces. First make a pattern that
    # matches the username part, then one section of the domain,
    # then allow multiple domain sections, then glue it all together.
    # 
    # Just like writing a program, a complicated regular expression
    # can often be broken into smaller, simpler pieces and then
    # assembled into the final whole.
    
    # valid
    'myname@internet.com'.should match(fixThisPattern)
    'my_name2@server16.subdomain.internet.org'.should match(fixThisPattern)
    'jdoe87@college.edu'.should match(fixThisPattern)
    'jdoe87+myalias@gmail.com'.should match(fixThisPattern)
    'my.really.long.first-name@internet.co.uk'.should match(fixThisPattern)
    
    # invalid
    'myname@internet..com'.should_not match(fixThisPattern)
    'myname@internet'.should_not match(fixThisPattern)
    'myname'.should_not match(fixThisPattern)
    'myname!@internet.com'.should_not match(fixThisPattern)
    'myname@internet.my-subdomain.com'.should_not match(fixThisPattern)
    'MyName@internet.com'.should_not match(fixThisPattern)
  end
end