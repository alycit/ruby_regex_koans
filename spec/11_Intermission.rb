describe "Intermission" do
	__ = 0
  
  #Koans 1 through 10 teach enough about Regular Expressions
  #to handle most common RegEx scenarios. This Koan is a series
  #of puzzles and problems to solve with Regular Expressions
  #to help cement your understanding as well as provide some
  #more Real World examples.
  
  #Note: The starter patterns (like /__/) will NOT include
  #the ^ $ hints that were used in the earlier Koans. It's up
  #to you to decide whether you want to capture the whole
  #string or just a substring to solve the puzzle.
  
  it "Find City, State, and Zip code" do
    #Assumptions:
    #  * US Addresses (no Canadian provinces, etc.)
    #  * Common American address format: City, ST 12345
    #  * Comma separating City and State is optional
    #  * US State will always use two uppercase letter abbreviation
    
    fixThisPattern = /__/
    
    #in matches1[cityGroup], etc., set the index to find each value
    cityGroup  = __
    stateGroup = __
    zipGroup   = __
    
    matches1 = fixThisPattern.exec(' Columbus, OH 43215'           )
    matches2 = fixThisPattern.exec(' San Francisco, CA 94118-4503' )
    matches3 = fixThisPattern.exec(' APO AE 09499-0074'            )
    matches4 = fixThisPattern.exec(' Port St. Lucie FL 34952'      )
    
    #Debug:
    #jasmine.log("Debug: " + matches1);
    
    city1  = matches1[cityGroup]
    state1 = matches1[stateGroup]
    zip1   = matches1[zipGroup]
    
    city2  = matches2[cityGroup]
    state2 = matches2[stateGroup]
    zip2   = matches2[zipGroup]
    
    city3  = matches3[cityGroup]
    state3 = matches3[stateGroup]
    zip3   = matches3[zipGroup]
    
    city4  = matches4[cityGroup]
    state4 = matches4[stateGroup]
    zip4   = matches4[zipGroup]
    
    city1.should eql('Columbus')
    state1.should eql('OH')
    zip1.should eql('43215')
    
    city2.should eql('San Francisco')
    state2.should eql('CA')
    zip2.should eql('94118-4503')
    
    city3.should eql('APO')
    state3.should eql('AE')
    zip3.should eql('09499-0074')
    
    city4.should eql('Port St. Lucie')
    state4.should eql('FL')
    zip4.should eql('34952')
  end
  
  it "Parse URL, detect invalid format" do
    #Assumptions:
    #  * Only accept these protocols: http, https, ftp, sftp, ssh
    #  * server is required, may be numeric (IPv5) or named
    #  * server name may only be one word (e.g. 'localhost')
    #  * port is optional
    #  * directory and file name are both optional
    #  * directory, if present, will always end in /
    #  * GET parameters are optional
    #  * any missing value will be "" (instead of null)
    
    fixThisPattern = /^(http)(:)/
    
    protocolGroup  = __
    serverGroup    = __
    portGroup      = __
    directoryGroup = __
    fileGroup      = __
    getParamsGroup = __
    
    #valid
    matches1 = fixThisPattern.exec( 'http://www.google.com/'                                )
    matches2 = fixThisPattern.exec( 'https://mysearch.com/search.jsp?q=regular+expressions' )
    matches3 = fixThisPattern.exec( 'ftp://192.168.0.100/home/myself/music/'                )
    matches4 = fixThisPattern.exec( 'ssh://localhost/etc/passwd'                            )
    matches5 = fixThisPattern.exec( 'http://127.0.0.1:8080/Admin/index.jsp'                 )
    
    #invalid
    matches6 = fixThisPattern.exec( 'google.com'                  )
    matches7 = fixThisPattern.exec( 'gopher://oldserver.arpanet/' )

    protocol1   = matches1.length > protocolGroup  ? matches1[protocolGroup]  : ""
    server1     = matches1.length > serverGroup    ? matches1[serverGroup]    : ""
    port1       = matches1.length > portGroup      ? matches1[portGroup]      : ""
    directory1  = matches1.length > directoryGroup ? matches1[directoryGroup] : ""
    file1       = matches1.length > fileGroup      ? matches1[fileGroup]      : ""
    getParams1  = matches1.length > getParamsGroup ? matches1[getParamsGroup] : ""
    
    protocol2   = matches2.length > protocolGroup  ? matches2[protocolGroup]  : ""
    server2     = matches2.length > serverGroup    ? matches2[serverGroup]    : ""
    port2       = matches2.length > portGroup      ? matches2[portGroup]      : ""
    directory2  = matches2.length > directoryGroup ? matches2[directoryGroup] : ""
    file2       = matches2.length > fileGroup      ? matches2[fileGroup]      : ""
    getParams2  = matches2.length > getParamsGroup ? matches2[getParamsGroup] : ""
    
    protocol3   = matches3.length > protocolGroup  ? matches3[protocolGroup]  : ""
    server3     = matches3.length > serverGroup    ? matches3[serverGroup]    : ""
    port3       = matches3.length > portGroup      ? matches3[portGroup]      : ""
    directory3  = matches3.length > directoryGroup ? matches3[directoryGroup] : ""
    file3       = matches3.length > fileGroup      ? matches3[fileGroup]      : ""
    getParams3  = matches3.length > getParamsGroup ? matches3[getParamsGroup] : ""
    
    protocol4   = matches4.length > protocolGroup  ? matches4[protocolGroup]  : ""
    server4     = matches4.length > serverGroup    ? matches4[serverGroup]    : ""
    port4       = matches4.length > portGroup      ? matches4[portGroup]      : ""
    directory4  = matches4.length > directoryGroup ? matches4[directoryGroup] : ""
    file4       = matches4.length > fileGroup      ? matches4[fileGroup]      : ""
    getParams4  = matches4.length > getParamsGroup ? matches4[getParamsGroup] : ""
    
    protocol5   = matches5.length > protocolGroup  ? matches5[protocolGroup]  : ""
    server5     = matches5.length > serverGroup    ? matches5[serverGroup]    : ""
    port5       = matches5.length > portGroup      ? matches5[portGroup]      : ""
    directory5  = matches5.length > directoryGroup ? matches5[directoryGroup] : ""
    file5       = matches5.length > fileGroup      ? matches5[fileGroup]      : ""
    getParams5  = matches5.length > getParamsGroup ? matches5[getParamsGroup] : ""
    
    #http://www.google.com/
    protocol1.should eql('http')
    server1.should eql('www.google.com')
    port1.should eql('')
    directory1.should eql('')
    file1.should eql('')
    getParams1.should eql('')
    
    #https://mysearch.com/search.jsp?q=regular+expressions
    protocol2.should eql('https')
    server2.should eql('mysearch.com')
    port2.should eql('')
    directory2.should eql('')
    file2.should eql('search.jsp')
    getParams2.should eql('?q=regular+expressions')
    
    #ftp://192.168.0.100/home/myself/music/
    protocol3.should eql('ftp')
    server3.should eql('192.168.0.100')
    port3.should eql('')
    directory3.should eql('home/myself/music/')
    file3.should eql('')
    getParams3.should eql('')
    
    #ftp://192.168.0.100/home/myself/music/
    protocol4.should eql('ssh')
    server4.should eql('localhost')
    port4.should eql('')
    directory4.should eql('etc/')
    file4.should eql('passwd')
    getParams4.should eql('')
    
    #http://127.0.0.1:8080/Admin/index.jsp
    protocol5.should eql('http')
    server5.should eql('127.0.0.1')
    port5.should eql(':8080')
    directory5.should eql('Admin/')
    file5.should eql('index.jsp')
    getParams5.should eql('')
    
    #google.com
    matches6.should be_nil
    
    #gopher://oldserver.arpanet/
    matches7.should be_nil
    
  end

end