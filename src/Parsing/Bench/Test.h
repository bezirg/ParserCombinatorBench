  -- Lazy load the inputs
  inpCV <- readFile "data/csv/test.csv"
  inpEX <- readFile "data/expr/test.expr"
  inpUR <- readFile "data/url/test.url"
  inpHT <- readFile "data/http/test.http"
  inpJS <- readFile "data/json/test.json"
  inpCS <- readFile "data/css/test.css"

  -- Strictly load the Text inputs
  tinpCV <- TIO.readFile "data/csv/test.csv"
  tinpEX <- TIO.readFile "data/expr/test.expr"
  tinpUR <- TIO.readFile "data/url/test.url"
  tinpHT <- TIO.readFile "data/http/test.http"
  tinpJS <- TIO.readFile "data/json/test.json"
  tinpCS <- TIO.readFile "data/css/test.css"

  -- Outputs

  let outCV = [["dma code","region","state"],["500","Portland-Auburn","ME"],["501","New York","NY"],["502","Binghamton","NY"],["503","Macon","GA"],["504","Philadelphia","PA"],["505","Detroit","MI"],["506","Boston","MA"],["507","Savannah","GA"],["508","Pittsburgh","PA"],["509","Ft Wayne","IN"],["510","Cleveland","OH"],["511","Washington","DC"],["512","Baltimore","MD"],["513","Flint","MI"],["514","Buffalo","NY"],["515","Cincinnati","OH"],["516","Erie","PA"],["517","Charlotte","NC"],["518","Greensboro","NC"],["519","Charleston","SC"],["520","Augusta","GA"],["521","Providence","RI"],["522","Columbus","GA"],["523","Burlington","VT"],["524","Atlanta","GA"],["525","Albany","GA"],["526","Utica-Rome","NY"],["527","Indianapolis","IN"],["528","Miami","FL"],["529","Louisville","KY"],["530","Tallahassee","FL"],["531","Tri-Cities","TN"],["532","Albany-Schenectady-Troy","NY"],["533","Hartford","CT"],["534","Orlando","FL"],["535","Columbus","OH"],["536","Youngstown-Warren","OH"],["537","Bangor","ME"],["538","Rochester","NY"],["539","Tampa","FL"],["540","Traverse City-Cadillac","MI"],["541","Lexington","KY"],["542","Dayton","OH"],["543","Springfield-Holyoke","MA"],["544","Norfolk-Portsmouth","VA"],["545","Greenville-New Bern-Washington","NC"],["546","Columbia","SC"],["547","Toledo","OH"],["548","West Palm Beach","FL"],["549","Watertown","NY"],["550","Wilmington","NC"],["551","Lansing","MI"],["552","Presque Isle","ME"],["553","Marquette","MI"],["554","Wheeling","WV"],["555","Syracuse","NY"],["556","Richmond-Petersburg","VA"],["557","Knoxville","TN"],["558","Lima","OH"],["559","Bluefield-Beckley-Oak Hill","WV"],["560","Raleigh-Durham","NC"],["561","Jacksonville","FL"],["563","Grand Rapids","MI"],["564","Charleston-Huntington","WV"],["565","Elmira","NY"],["566","Harrisburg-Lancaster-Lebanon-York","PA"],["567","Greenville-Spartenburg","SC"],["569","Harrisonburg","VA"],["570","Florence-Myrtle Beach","SC"],["571","Ft Myers","FL"],["573","Roanoke-Lynchburg","VA"],["574","Johnstown-Altoona","PA"],["575","Chattanooga","TN"],["576","Salisbury","MD"],["577","Wilkes Barre-Scranton","PA"],["581","Terre Haute","IN"],["582","Lafayette","IN"],["583","Alpena","MI"],["584","Charlottesville","VA"],["588","South Bend","IN"],["592","Gainesville","FL"],["596","Zanesville","OH"],["597","Parkersburg","WV"],["598","Clarksburg-Weston","WV"],["600","Corpus Christi","TX"],["602","Chicago","IL"],["603","Joplin-Pittsburg","MO"],["604","Columbia-Jefferson City","MO"],["605","Topeka","KS"],["606","Dothan","AL"],["609","St Louis","MO"],["610","Rockford","IL"],["611","Rochester-Mason City-Austin","MN"],["612","Shreveport","LA"],["613","Minneapolis-St Paul","MN"],["616","Kansas City","MO"],["617","Milwaukee","WI"],["618","Houston","TX"],["619","Springfield","MO"],["620","Tuscaloosa","AL"],["622","New Orleans","LA"],["623","Dallas-Fort Worth","TX"],["624","Sioux City","IA"],["625","Waco-Temple-Bryan","TX"],["626","Victoria","TX"],["627","Wichita Falls","TX"],["628","Monroe","LA"],["630","Birmingham","AL"],["631","Ottumwa-Kirksville","IA"],["632","Paducah","KY"],["633","Odessa-Midland","TX"],["634","Amarillo","TX"],["635","Austin","TX"],["636","Harlingen","TX"],["637","Cedar Rapids-Waterloo","IA"],["638","St Joseph","MO"],["639","Jackson","TN"],["640","Memphis","TN"],["641","San Antonio","TX"],["642","Lafayette","LA"],["643","Lake Charles","LA"],["644","Alexandria","LA"],["646","Anniston","AL"],["647","Greenwood-Greenville","MS"],["648","Champaign-Springfield-Decatur","IL"],["649","Evansville","IN"],["650","Oklahoma City","OK"],["651","Lubbock","TX"],["652","Omaha","NE"],["656","Panama City","FL"],["657","Sherman","TX"],["658","Green Bay-Appleton","WI"],["659","Nashville","TN"],["661","San Angelo","TX"],["662","Abilene-Sweetwater","TX"],["669","Madison","WI"],["670","Ft Smith-Fay-Springfield","AR"],["671","Tulsa","OK"],["673","Columbus-Tupelo-West Point","MS"],["675","Peoria-Bloomington","IL"],["676","Duluth","MN"],["678","Wichita","KS"],["679","Des Moines","IA"],["682","Davenport-Rock Island-Moline","IL"],["686","Mobile","AL"],["687","Minot-Bismarck-Dickinson","ND"],["691","Huntsville","AL"],["692","Beaumont-Port Author","TX"],["693","Little Rock-Pine Bluff","AR"],["698","Montgomery","AL"],["702","La Crosse-Eau Claire","WI"],["705","Wausau-Rhinelander","WI"],["709","Tyler-Longview","TX"],["710","Hattiesburg-Laurel","MS"],["711","Meridian","MS"],["716","Baton Rouge","LA"],["717","Quincy","IL"],["718","Jackson","MS"],["722","Lincoln-Hastings","NE"],["724","Fargo-Valley City","ND"],["725","Sioux Falls","SD"],["734","Jonesboro","AR"],["736","Bowling Green","KY"],["737","Mankato","MN"],["740","North Platte","NE"],["743","Anchorage","AK"],["744","Honolulu","HI"],["745","Fairbanks","AK"],["746","Biloxi-Gulfport","MS"],["747","Juneau","AK"],["749","Laredo","TX"],["751","Denver","CO"],["752","Colorado Springs","CO"],["753","Phoenix","AZ"],["754","Butte-Bozeman","MT"],["755","Great Falls","MT"],["756","Billings","MT"],["757","Boise","ID"],["758","Idaho Falls-Pocatello","ID"],["759","Cheyenne","WY"],["760","Twin Falls","ID"],["762","Missoula","MT"],["764","Rapid City","SD"],["765","El Paso","TX"],["766","Helena","MT"],["767","Casper-Riverton","WY"],["770","Salt Lake City","UT"],["771","Yuma","AZ"],["773","Grand Junction","CO"],["789","Tucson","AZ"],["790","Albuquerque","NM"],["798","Glendive","MT"],["800","Bakersfield","CA"],["801","Eugene","OR"],["802","Eureka","CA"],["803","Los Angeles","CA"],["804","Palm Springs","CA"],["807","San Francisco","CA"],["810","Yakima-Pasco","WA"],["811","Reno","NV"],["813","Medford-Klamath Falls","OR"],["819","Seattle-Tacoma","WA"],["820","Portland","OR"],["821","Bend","OR"],["825","San Diego","CA"],["828","Monterey-Salinas","CA"],["839","Las Vegas","NV"],["855","Santa Barbara","CA"],["862","Sacramento","CA"],["866","Fresno","CA"],["868","Chico-Redding","CA"],["881","Spokane","WA"]]


  let outEX = Add (Add (Sub (Let "t" (Let "abvf" (Let "bqfm" (Var "todl") (Var "sxlzznpv")) (Mul (Sub (Var "rgemt") (Nat 17)) (Mul (Nat 18) (Let "joxidqn" (Var "e") (Var "eghsa"))))) (Let "ckhfzu" (Sub (Sub (Nat 25) (Nat 4)) (Sub (Nat 19) (Var "bmpd"))) (Mul (Add (Add (Var "q") (Var "zoesc")) (Mul (Var "ggftv") (Var "wqnwaax"))) (Mul (Sub (Add (Add (Nat 22) (Var "bssjcti")) (Add (Var "sbqvvtij") (Nat 31))) (Var "e")) (Let "s" (Let "w" (Nat 21) (Nat 2)) (Sub (Sub (Nat 29) (Var "vbkyfum")) (Add (Nat 11) (Var "szzdr")))))))) (Var "lfi")) (Sub (Mul (Add (Add (Sub (Add (Nat 5) (Var "kan")) (Add (Var "yme") (Var "u"))) (Sub (Add (Nat 10) (Nat 28)) (Sub (Nat 11) (Nat 1)))) (Add (Mul (Nat 14) (Let "mhhxuw" (Nat 29) (Nat 12))) (Let "m" (Sub (Var "nkogww") (Nat 22)) (Let "iygrs" (Nat 25) (Var "vewy"))))) (Let "d" (Let "uoudbdp" (Var "aqrqe") (Add (Var "ltkski") (Nat 14))) (Mul (Add (Mul (Var "zjbkfrjl") (Var "xs")) (Let "xa" (Var "mrl") (Var "zqdoirwx"))) (Let "rdfsxye" (Add (Var "z") (Var "uvqsba")) (Sub (Add (Var "lnyttb") (Var "wapxflc")) (Mul (Add (Nat 11) (Nat 16)) (Mul (Nat 1) (Var "uv")))))))) (Mul (Sub (Mul (Let "pr" (Var "nf") (Sub (Var "tiddqe") (Mul (Var "ext") (Nat 17)))) (Nat 5)) (Var "dphgh")) (Var "dh")))) (Mul (Add (Sub (Add (Sub (Let "yrddwtoe" (Nat 17) (Add (Var "cpt") (Let "hvjypqri" (Var "zgbegu") (Var "srdxihwb")))) (Add (Mul (Var "yk") (Nat 31)) (Nat 19))) (Mul (Let "hflcgr" (Var "owfdiik") (Sub (Nat 21) (Let "nsesqduh" (Var "doesk") (Var "jy")))) (Mul (Nat 11) (Mul (Nat 6) (Var "fkg"))))) (Var "zhlayycz")) (Let "gttcxzci" (Let "ytvchaji" (Let "lptbq" (Var "kp") (Nat 29)) (Sub (Add (Nat 16) (Nat 31)) (Mul (Var "ciu") (Mul (Nat 8) (Nat 4))))) (Add (Add (Sub (Mul (Nat 7) (Nat 17)) (Add (Nat 32) (Nat 31))) (Let "d" (Var "kzizu") (Mul (Nat 19) (Sub (Var "rlgbnw") (Var "rzxmji"))))) (Mul (Add (Sub (Sub (Var "bpquf") (Nat 29)) (Mul (Var "yig") (Nat 5))) (Nat 20)) (Mul (Mul (Nat 9) (Mul (Nat 27) (Nat 17))) (Let "zppjkkp" (Let "ilgkp" (Var "simf") (Nat 3)) (Mul (Var "qudqh") (Var "hjyij")))))))) (Let "qpqkguah" (Nat 26) (Mul (Let "omymwvxc" (Nat 16) (Mul (Let "u" (Nat 19) (Add (Var "kq") (Nat 2))) (Sub (Mul (Mul (Var "ygbac") (Nat 18)) (Add (Nat 31) (Nat 17))) (Mul (Sub (Var "qv") (Var "mlairk")) (Sub (Var "d") (Var "qbyngtp")))))) (Let "kdvbyot" (Add (Let "pw" (Mul (Nat 29) (Var "narz")) (Sub (Mul (Var "um") (Nat 26)) (Add (Sub (Var "fwdxqvey") (Nat 25)) (Add (Nat 24) (Nat 24))))) (Let "u" (Mul (Var "j") (Nat 3)) (Add (Mul (Nat 13) (Nat 11)) (Add (Sub (Nat 22) (Var "pa")) (Add (Var "dsbpmwrl") (Nat 1)))))) (Let "gc" (Let "ogo" (Nat 21) (Mul (Var "znp") (Let "wegs" (Var "ubxvmhh") (Nat 28)))) (Let "eamefrgp" (Sub (Nat 16) (Var "jtlkvhop")) (Add (Add (Nat 22) (Var "lbmwa")) (Sub (Sub (Sub (Var "ra") (Var "idqkhx")) (Add (Var "pprvay") (Nat 4))) (Let "cydpq" (Nat 5) (Sub (Nat 13) (Mul (Var "ozlmlw") (Nat 11))))))))))))

  let outUR = [("Aachen",Nothing),("Aalborg",Just "aah"),("Aalesund",Just "aahed"),("Aalst",Just "aahing"),("Aalto",Just "aahs"),("Aarau",Just "aal"),("Aargau",Nothing),("Aarhus",Nothing),("Aaron",Just "aals"),("Aarons rod",Just "aardvark"),("Aaronic",Just "aardwolf"),("Ab",Just "aargh"),("Abadan",Nothing),("Abaddon",Just "aarrghh"),("Abba",Just "aas"),("Abbasid",Just "aasvogel"),("Abbevillian",Just "aba"),("Abbey Theatre",Just "abaca"),("Abdias",Nothing),("Abdul-Hamid II",Just "abaci"),("Abednego",Just "aback"),("Abel",Just "abacus"),("Abelard",Just "abacuses"),("Abeokuta",Just "abaft"),("Aberdare",Just "abaka"),("Aberdeen",Just "abakas"),("Aberdeen Angus",Just "abalone"),("Abib",Just "abalones"),("Abidjan",Just "abamp"),("Abigail",Just "abampere"),("Abilene",Just "abamps"),("Abingdon",Just "abandon"),("Abnaki",Nothing),("Abney level",Just "abapical"),("Abraham",Just "abas"),("Abruzzi",Just "abase"),("Absalom",Just "abased"),("Abu Simbel",Just "abasedly"),("Abu-Bekr",Just "abaser"),("Abukir",Nothing),("Abydos",Nothing),("Abyssinia",Nothing),("Abyssinian cat",Just "abashed"),("Ac",Just "abashes"),("Acadia",Nothing),("Acadian",Just "abasia"),("Acapulco",Just "abasias"),("Accad",Just "abasing"),("Accra",Just "abatable"),("Aceldama",Just "abate"),("Achaea",Nothing),("Achaean",Just "abater"),("Achaean League",Just "abaters"),("Achaemenid",Just "abates"),("Achates",Just "abating"),("Achelous",Just "abatis"),("Achernar",Just "abatises"),("Acheron",Just "abator"),("Achilles",Just "abators"),("Achilles heel",Just "abattis"),("Achilles tendon",Nothing),("Achitophel",Just "abaxial"),("Acis",Just "abaxile"),("Aconcagua",Nothing),("Acre",Just "abbacies"),("Acrilan",Just "abbacy"),("Actaeon",Just "abbas"),("Actium",Nothing),("Acton",Just "abbe"),("Acts of the Apostles",Just "abbes"),("Adam",Just "abbess"),("Adams ale",Nothing),("Adams apple",Just "abbey"),("Adams-needle",Nothing),("Adam-and-Eve",Nothing),("Adamic",Nothing),("Adamite",Just "abbots"),("Adams",Just "abdicate"),("Adams-Stokes syndrome",Nothing),("Adana",Just "abdomens"),("Adapa",Just "abdomina"),("Adar",Just "abduce"),("Adar Sheni",Just "abduced"),("Addams",Nothing),("Addington",Nothing),("Addis Ababa",Just "abduces"),("Addison",Just "abducing"),("Addisons disease",Just "abduct"),("Addressograph",Just "abducted"),("Adelaide",Just "abductor"),("Aden",Just "abducts"),("Adenauer",Just "abeam"),("Adige",Just "abed"),("Adigranth",Nothing),("Adirondack Mountains",Just "abeles"),("Adler",Just "abelian"),("Adm.",Just "abelmosk"),("Admetus",Just "aberrant"),("Admiralty Islands",Just "abet"),("Admiralty Range",Nothing)]

    
  let outHT = HttpRequest {reqMethod = Post, reqURL = "http://www.w3.org/Protocols/rfc2616/rfc2616-sec3.html#sec3.6.1 ", reqHeaders = [("Aachen","aa"),("Aalborg","aah"),("Aalesund","aahed"),("Aalst","aahing"),("Aalto","aahs"),("Aarau","aal"),("Aargau","aalii"),("Aarhus","aaliis"),("Aaron","aals"),("Aaronsrod","aardvark"),("Aaronic","aardwolf"),("Ab","aargh"),("Abadan","aarrgh"),("Abaddon","aarrghh"),("Abba","aas"),("Abbasid","aasvogel"),("Abbevillian","aba"),("AbbeyTheatre","abaca"),("Abdias","abacas"),("Abdul-HamidII","abaci"),("Abednego","aback"),("Abel","abacus"),("Abelard","abacuses"),("Abeokuta","abaft"),("Aberdare","abaka"),("Aberdeen","abakas"),("AberdeenAngus","abalone"),("Abib","abalones"),("Abidjan","abamp"),("Abigail","abampere"),("Abilene","abamps"),("Abingdon","abandon"),("Abnaki","abandons"),("Abneylevel","abapical"),("Abraham","abas"),("Abruzzi","abase"),("Absalom","abased"),("AbuSimbel","abasedly"),("Abu-Bekr","abaser"),("Abukir","abasers"),("Abydos","abases"),("Abyssinia","abash"),("Abyssiniancat","abashed"),("Ac","abashes"),("Acadia","abashing"),("Acadian","abasia"),("Acapulco","abasias"),("Accad","abasing"),("Accra","abatable"),("Aceldama","abate"),("Achaea","abated"),("Achaean","abater"),("AchaeanLeague","abaters"),("Achaemenid","abates"),("Achates","abating"),("Achelous","abatis"),("Achernar","abatises"),("Acheron","abator"),("Achilles","abators"),("Achillesheel","abattis"),("Achillestendon","abattoir"),("Achitophel","abaxial"),("Acis","abaxile"),("Aconcagua","abba"),("Acre","abbacies"),("Acrilan","abbacy"),("Actaeon","abbas"),("Actium","abbatial"),("Acton","abbe"),("ActsoftheApostles","abbes"),("Adam","abbess"),("Adamsale","abbesses"),("Adamsapple","abbey"),("Adams-needle","abbeys"),("Adam-and-Eve","abbot"),("Adamic","abbotcy"),("Adamite","abbots"),("Adams","abdicate"),("Adams-Stokessyndrome","abdomen"),("Adana","abdomens"),("Adapa","abdomina"),("Adar","abduce"),("AdarSheni","abduced"),("Addams","abducens"),("Addington","abducent"),("AddisAbaba","abduces"),("Addison","abducing"),("Addisonsdisease","abduct"),("Addressograph","abducted"),("Adelaide","abductor"),("Aden","abducts"),("Adenauer","abeam"),("Adige","abed"),("Adigranth","abele"),("AdirondackMountains","abeles"),("Adler","abelian"),("Adm","abelmosk"),("Admetus","aberrant"),("AdmiraltyIslands","abet"),("AdmiraltyRange","abetment")], reqBody = Just "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent suscipit elit eget tellus tristique sed tempor purus luctus. Vestibulum in risus quis lacus gravida tincidunt. Mauris dictum vulputate nisi in consectetur. Nullam volutpat aliquet nisi, vel feugiat risus porttitor vitae. Suspendisse tempus pharetra diam, vel iaculis est interdum at. Etiam id pharetra magna. Quisque vel ligula nibh, eu posuere diam.\n\nFusce nec ante magna. Vestibulum et leo nec lorem dapibus viverra. Fusce sit amet volutpat nulla. Vestibulum pretium commodo mauris, quis pulvinar ligula viverra sit amet. Duis vel sagittis lacus. Proin id sapien et lacus venenatis ultricies. Vestibulum neque magna, fringilla ut tristique non, euismod eu quam. Pellentesque mollis gravida lacinia.\n\nSuspendisse ullamcorper vestibulum laoreet. Suspendisse egestas, nunc non congue fermentum, velit dui iaculis mi, in faucibus lacus nisl quis urna. Maecenas pulvinar libero in sapien consectetur gravida. Curabitur a bibendum massa. Nulla sit amet nisl quis quam laoreet fringilla. Curabitur euismod justo in dui gravida sit amet tristique est interdum. Quisque vitae nulla et mauris aliquam interdum vitae eget neque. Aenean accumsan augue felis, ut luctus augue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi non erat tellus. Proin non magna magna, ultricies blandit turpis. Mauris at nibh dolor. Proin tincidunt fringilla lorem sit amet pharetra. Fusce quis lacus tristique mi posuere adipiscing. In libero mauris, pretium ut convallis eget, imperdiet nec odio. Phasellus hendrerit rutrum nulla ac vestibulum.\n\nDonec mollis dignissim ullamcorper. Donec convallis turpis et nibh feugiat suscipit. Aliquam sed elit id lectus consequat ullamcorper eget et mauris. Pellentesque a pellentesque nunc. Donec vel mi nisl, at eleifend justo. Phasellus dictum augue vel neque semper facilisis euismod odio dictum. Vestibulum quis aliquet lacus.\n\nAliquam ut tortor ut odio suscipit mattis. Pellentesque tincidunt arcu non neque auctor feugiat. Cras sem diam, gravida non aliquam ac, lacinia at tortor. Aliquam et consequat risus. In hac habitasse platea dictumst. Mauris tortor augue, sollicitudin in congue vitae, cursus vel magna. Praesent et urna lacus, vel pulvinar sem. Vestibulum hendrerit convallis mi a faucibus. Etiam sem mauris, pellentesque ut tincidunt et, pellentesque vel odio. Nunc purus dui, dapibus at tempor at, fringilla sed lectus. Integer mi sapien, iaculis ut mollis at, fermentum vitae ipsum. Vestibulum a ante eu dui adipiscing adipiscing at pharetra odio.\n"}

  let outJS = JObject (JObj {fromJObj = [("019007b_.mid",JString "2"),("038900b_.mid",JString "0"),("012306b_.mid",JString "2"),("014403b_.mid",JString "1"),("004807b_.mid",JString "-2"),("024440b_.mid",JString "3"),("030200b_.mid",JString "2"),("040100b_.mid",JString "-1"),("038400b_.mid",JString "-3"),("015606b_.mid",JString "0"),("038600b_.mid",JString "3"),("039000b_.mid",JString "0"),("024537b_.mid",JString "-3"),("043400b_.mid",JString "0"),("030100b_.mid",JString "-1"),("028900b_.mid",JString "1"),("010406b_.mid",JString "3"),("011007b_.mid",JString "2"),("017606b_.mid",JString "-2"),("004003b_.mid",JString "-1"),("007807b_.mid",JString "-2"),("017906b_.mid",JString "0"),("018007b_.mid",JString "-1"),("007206b_.mid",JString "0"),("042500b_.mid",JString "0"),("042000b_.mid",JString "0"),("037400b_.mid",JString "-1"),("024522b_.mid",JString "4"),("036600b_.mid",JString "-1"),("040300b_.mid",JString "-1"),("026200b_.mid",JString "2"),("011704b_.mid",JString "1"),("033600b_.mid",JString "3"),("034400b_.mid",JString "-1"),("038700b_.mid",JString "0"),("015505b_.mid",JString "-1"),("015705b_.mid",JString "2"),("000606b_.mid",JString "-2"),("009005b_.mid",JString "-1"),("039900b_.mid",JString "1"),("024514b_.mid",JString "3"),("003806b_.mid",JString "0"),("022701b_.mid",JString "1"),("000306b_.mid",JString "3"),("032900b_.mid",JString "-3"),("024415b_.mid",JString "4"),("027200b_.mid",JString "-1"),("015804b_.mid",JString "1"),("013506b_.mid",JString "0"),("025300b_.mid",JString "3"),("035000b_.mid",JString "-2"),("034700b_.mid",JString "3"),("036000b_.mid",JString "-2"),("031100b_.mid",JString "2"),("039700b_.mid",JString "-1"),("032300b_.mid",JString "3"),("039500b_.mid",JString "3"),("004008b_.mid",JString "-3"),("027000b_.mid",JString "2"),("036300b_.mid",JString "1"),("011106b_.mid",JString "0"),("019705b_.mid",JString "3"),("033100b_.mid",JString "0"),("033500b_.mid",JString "1"),("037300b_.mid",JString "1"),("031400b_.mid",JString "2"),("013906b_.mid",JString "4"),("035400b_.mid",JString "-4"),("015105b_.mid",JString "1"),("035500b_.mid",JString "3"),("041800b_.mid",JString "0"),("028700b_.mid",JString "-1"),("025900b_.mid",JString "1"),("037100b_.mid",JString "0"),("019406b_.mid",JString "-2"),("009307b_.mid",JString "-2"),("017705b_.mid",JString "-2"),("041200b_.mid",JString "-1"),("035700b_.mid",JString "-2"),("025700b_.mid",JString "0"),("004207b_.mid",JString "3"),("008305b_.mid",JString "0"),("031500b_.mid",JString "1"),("010806b_.mid",JString "2"),("013306b_.mid",JString "2"),("008606b_.mid",JString "4"),("031600b_.mid",JString "-2"),("038200b_.mid",JString "0"),("025800b_.mid",JString "2"),("035100b_.mid",JString "-1"),("024417b_.mid",JString "-3"),("025400b_.mid",JString "0"),("041700b_.mid",JString "2"),("002606b_.mid",JString "0"),("025500b_.mid",JString "0"),("026300b_.mid",JString "1"),("043300b_.mid",JString "1"),("031900b_.mid",JString "1"),("036400b_.mid",JString "-1"),("006707b_.mid",JString "3"),("030700b_.mid",JString "-2"),("042300b_.mid",JString "-1"),("019710b_.mid",JString "2"),("033900b_.mid",JString "3"),("001606b_.mid",JString "0"),("040500b_.mid",JString "-1"),("028500b_.mid",JString "-3"),("001405b_.mid",JString "-2"),("014505b_.mid",JString "2"),("008506b_.mid",JString "-2"),("007706b_.mid",JString "-1"),("043100b_.mid",JString "-1"),("032400b_.mid",JString "1"),("040700b_.mid",JString "2"),("016606b_.mid",JString "-2"),("004006b_.mid",JString "-1"),("016406b_.mid",JString "-2"),("015309b_.mid",JString "0"),("004507b_.mid",JString "4"),("001007b_.mid",JString "-2"),("030900b_.mid",JString "-1"),("002506b_.mid",JString "0"),("040200b_.mid",JString "-3"),("039100b_.mid",JString "1"),("034600b_.mid",JString "0"),("025600b_.mid",JString "0"),("014007b_.mid",JString "-3"),("040400b_.mid",JString "0"),("001306b_.mid",JString "-2"),("033700b_.mid",JString "0"),("027600b_.mid",JString "0"),("008906b_.mid",JString "-2"),("006606b_.mid",JString "3"),("015301b_.mid",JString "1"),("039300b_.mid",JString "3"),("042400b_.mid",JString "0"),("040000b_.mid",JString "-3"),("033200b_.mid",JString "1"),("004407b_.mid",JString "-2"),("012606b_.mid",JString "0"),("038300b_.mid",JString "0"),("027400b_.mid",JString "-2"),("000206b_.mid",JString "-1"),("004803b_.mid",JString "-2"),("028100b_.mid",JString "-1"),("036900b_.mid",JString "1"),("022711b_.mid",JString "1"),("042600b_.mid",JString "0"),("035300b_.mid",JString "-2"),("027100b_.mid",JString "2"),("008405b_.mid",JString "2"),("022602b_.mid",JString "-2"),("037900b_.mid",JString "1"),("037200b_.mid",JString "-1"),("006402b_.mid",JString "0"),("018305b_.mid",JString "0"),("011308b_.mid",JString "2"),("038800b_.mid",JString "1"),("035800b_.mid",JString "-1"),("011909b_.mid",JString "0"),("011506b_.mid",JString "1"),("024437b_.mid",JString "-1"),("033000b_.mid",JString "0"),("024425b_.mid",JString "2"),("043000b_.mid",JString "3"),("031300b_.mid",JString "-2"),("007305b_.mid",JString "-2"),("040800b_.mid",JString "-1"),("024432b_.mid",JString "-2"),("026700b_.mid",JString "1"),("035600b_.mid",JString "-2"),("026500b_.mid",JString "0"),("029300b_.mid",JString "0"),("029400b_.mid",JString "1"),("034500b_.mid",JString "-2"),("004311b_.mid",JString "1"),("022707b_.mid",JString "1"),("028300b_.mid",JString "0"),("003306b_.mid",JString "0"),("024462b_.mid",JString "0"),("024403b_.mid",JString "2"),("015408b_.mid",JString "2"),("036800b_.mid",JString "-1"),("034800b_.mid",JString "-2"),("029000b_.mid",JString "-1"),("026000b_.mid",JString "1"),("014806b_.mid",JString "3"),("033800b_.mid",JString "0"),("012705b_.mid",JString "-1"),("029100b_.mid",JString "-1"),("032600b_.mid",JString "-2"),("038100b_.mid",JString "1"),("034200b_.mid",JString "0"),("002806b_.mid",JString "0"),("032800b_.mid",JString "0"),("010207b_.mid",JString "-2"),("015403b_.mid",JString "3"),("012506b_.mid",JString "1"),("034100b_.mid",JString "-1"),("015305b_.mid",JString "0"),("012006b_.mid",JString "2"),("031800b_.mid",JString "1"),("005708b_.mid",JString "-2"),("017807b_.mid",JString "0"),("000408b_.mid",JString "1"),("014406b_.mid",JString "2"),("015905b_.mid",JString "-3"),("024526b_.mid",JString "-3"),("028400b_.mid",JString "0"),("004705b_.mid",JString "-2"),("008807b_.mid",JString "2"),("031200b_.mid",JString "0"),("111800b_.mid",JString "1"),("022709b_.mid",JString "0"),("027500b_.mid",JString "0"),("016907b_.mid",JString "3"),("010306b_.mid",JString "2"),("010107b_.mid",JString "-1"),("024505b_.mid",JString "-1"),("038500b_.mid",JString "3"),("026400b_.mid",JString "1"),("027300b_.mid",JString "-2"),("041600b_.mid",JString "-1"),("024511b_.mid",JString "3"),("029200b_.mid",JString "0"),("029700b_.mid",JString "0"),("040900b_.mid",JString "3"),("043600b_.mid",JString "4"),("041300b_.mid",JString "-1"),("028600b_.mid",JString "0"),("039200b_.mid",JString "-2"),("029800b_.mid",JString "0"),("030300b_.mid",JString "2"),("041400b_.mid",JString "1"),("028200b_.mid",JString "1"),("006704b_.mid",JString "4"),("039400b_.mid",JString "3"),("027900b_.mid",JString "1"),("035200b_.mid",JString "0"),("019412b_.mid",JString "-2"),("030500b_.mid",JString "0"),("024515b_.mid",JString "0"),("009209b_.mid",JString "2"),("005505b_.mid",JString "-2"),("026100b_.mid",JString "2"),("005605b_.mid",JString "-2"),("003907b_.mid",JString "-2"),("007007b_.mid",JString "1"),("009606b_.mid",JString "-1"),("014608b_.mid",JString "-1"),("026800b_.mid",JString "1"),("024410b_.mid",JString "-4"),("024517b_.mid",JString "0"),("037800b_.mid",JString "1"),("017405b_.mid",JString "2"),("002011b_.mid",JString "-1"),("038000b_.mid",JString "-3"),("003706b_.mid",JString "3"),("016806b_.mid",JString "2"),("029900b_.mid",JString "-2"),("030400b_.mid",JString "2"),("033300b_.mid",JString "-2"),("030000b_.mid",JString "1"),("035900b_.mid",JString "3"),("043200b_.mid",JString "1"),("007408b_.mid",JString "0"),("024444b_.mid",JString "2"),("022902b_.mid",JString "-2"),("024528b_.mid",JString "3"),("001106b_.mid",JString "2"),("036200b_.mid",JString "-2"),("036700b_.mid",JString "0"),("037700b_.mid",JString "2"),("024446b_.mid",JString "2"),("027700b_.mid",JString "0"),("036100b_.mid",JString "-2"),("037600b_.mid",JString "3"),("034000b_.mid",JString "0"),("024454b_.mid",JString "-1"),("031000b_.mid",JString "1"),("032200b_.mid",JString "0"),("006507b_.mid",JString "0"),("000507b_.mid",JString "-2"),("028000b_.mid",JString "0"),("000907b_.mid",JString "4"),("003206b_.mid",JString "1"),("042200b_.mid",JString "0"),("032000b_.mid",JString "-1"),("028800b_.mid",JString "0"),("027800b_.mid",JString "1"),("032100b_.mid",JString "-2"),("001707b_.mid",JString "3"),("011606b_.mid",JString "3"),("009408b_.mid",JString "2"),("042800b_.mid",JString "1"),("006502b_.mid",JString "0"),("024540b_.mid",JString "-3"),("011407b_.mid",JString "-2"),("034900b_.mid",JString "-1"),("008107b_.mid",JString "1"),("032500b_.mid",JString "-1"),("042900b_.mid",JString "3"),("033400b_.mid",JString "-2"),("030600b_.mid",JString "-1"),("008008b_.mid",JString "2"),("043500b_.mid",JString "1"),("039600b_.mid",JString "0"),("002007b_.mid",JString "-1"),("016506b_.mid",JString "1"),("039800b_.mid",JString "2"),("032700b_.mid",JString "2"),("006408b_.mid",JString "1"),("012106b_.mid",JString "2"),("006005b_.mid",JString "3"),("037000b_.mid",JString "0"),("042700b_.mid",JString "-3"),("042100b_.mid",JString "0"),("029600b_.mid",JString "0"),("034300b_.mid",JString "-1"),("011205b_.mid",JString "1"),("008707b_.mid",JString "0"),("000707b_.mid",JString "2"),("030800b_.mid",JString "-2"),("018806b_.mid",JString "0"),("037500b_.mid",JString "1"),("041500b_.mid",JString "2"),("009906b_.mid",JString "1"),("003006b_.mid",JString "3"),("040600b_.mid",JString "-1"),("026900b_.mid",JString "1"),("018707b_.mid",JString "-2"),("026600b_.mid",JString "1"),("029500b_.mid",JString "-1"),("041000b_.mid",JString "-2"),("031700b_.mid",JString "2")]})

  let outCS = [("body",[("background-color","#222"),("color","white"),("font-family","\"Bitstream Vera Sans\",sans-serif"),("margin","0"),("padding","0")]),("#container",[("margin","0 10%"),("background-color","#161616"),("padding","16px")]),("#footer",[("margin","10px 10%"),("text-align","center")]),("h1, h2, h3, h4, h5, h6",[("color","#999")]),("td.color",[("height","100px"),("width","200px")]),("ul.color-bar",[("margin","auto 0")]),("ul.color-bar li",[("list-style","none"),("height","100px"),("width","19.9%"),("float","left"),("position","relative")]),("ul.color-bar.mini",[("margin","10px 0")]),("ul.color-bar.mini li",[("height","20px"),("width","50px"),("top","0"),("left","0")]),("ul.color-bar li.active",[("border","2px solid white"),("position","relative"),("top","-2px"),("width","19%")]),("ul.color-bar li a",[("display","block"),("height","100px"),("text-decoration","none")]),("ul.color-bar li span.hex",[("position","absolute"),("left","0"),("top","0"),("padding","4px 6px"),("background-color","#111"),("color","#eee"),("display","none")]),("ul.color-bar li:hover span.hex",[("display","block")]),("ul.color-bar.mini li a",[("height","20px"),("width","50px")]),(".clear",[("clear","both")]),("ul#nav",[("float","right")]),("ul#nav li",[("float","left"),("list-style","none")]),("ul#nav li a",[("padding","6px 10px"),("margin-right","10px"),("background-color","#333")]),("ul#nav li a:hover",[("background-color","#444"),("color","white")]),("a",[("color","white")]),("a:hover",[("color","#ddd")]),("#header h1",[("float","left")]),("table.colorpicker",[("width","auto")]),("table.colorpicker td",[("padding","0")]),(".star-rating,  \n.star-rating a:hover,  \n.star-rating a:active,  \n.star-rating a:focus,  \n.star-rating .current-rating",[("background","url('/images/star_rating.gif') left -1000px repeat-x")]),(".star-rating",[("position","relative"),("width","150px"),("height","30px"),("overflow","hidden"),("list-style","none"),("margin","0"),("padding","0"),("background-position","top left")]),(".star-rating li",[("display","inline")]),(".star-rating a,  \n.star-rating .current-rating",[("position","absolute"),("top","0"),("left","0"),("text-indent","-1000em"),("height","30px"),("line-height","30px"),("outline","none"),("overflow","hidden"),("border","none")]),(".star-rating a:hover,  \n.star-rating a:active,  \n.star-rating a:focus",[("background-position","center left")]),(".star-rating a.one-stars",[("width","20%"),("z-index","6")]),(".star-rating a.two-stars",[("width","40%"),("z-index","5")]),(".star-rating a.three-stars",[("width","60%"),("z-index","4")]),(".star-rating a.four-stars",[("width","80%"),("z-index","3")]),(".star-rating a.five-stars",[("width","100%"),("z-index","2")]),(".star-rating .current-rating",[("z-index","1"),("background-position","bottom left")]),(".star-ratings-block",[("font-size",".75em"),("text-align","center"),("width","100%")]),("input.button",[("background-color","#333"),("padding","4px 6px"),("color","#eee"),("border","0")]),(".theme-header h2, .theme-header h3",[("display","inline")]),(".theme-header h2",[("color","#46727F")]),(".theme-header h3",[("color","#959595"),("font-size","100%")]),(".theme-header .star-ratings-block",[("float","right"),("width","150px")])]
