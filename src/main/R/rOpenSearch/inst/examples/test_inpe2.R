library(rOpenSearch)

# setup
osd.url <- "http://www.dpi.inpe.br/datasearch"
response.type <- "application/atom+xml"

# get service's parameters
df.params <- GetOSQueryables(osd.url, response.type)

# parmeters
west  <- -53.635253906
south <- -18.62282178608876
east  <- -52.940368652343
north <- -18.205871127330347
date.ini <- "2018-04-01"
date.end <- "2019-03-31"
cloud <- 20 # NOTE: not used!

# fill in the parameters
df.params$value[df.params$type == "geo:box"]    <- paste(west, south, east, north, sep = ',')
df.params$value[df.params$type == "time:start"] <- date.ini
df.params$value[df.params$type == "time:end"]   <- date.end
df.params$value[df.params$type == "count"]      <- 20
df.params$value[df.params$type == "startIndex"] <- 1
df.params$value[df.params$type == "dataset"]    <- "S2SR"
# NOTE: there is no CLOUD in the service's parameters

res <- Query(osd.url, response.type, df.params)
res

# hugo's    urlhttp://www.dpi.inpe.br/datastore/Repository/Archive//granule.atom?3=20&10=S2SR&1=-53.635253906%2C-18.6228217860888%2C-52.940368652343%2C-18.2058711273303&4=1&6=2019-03-31&5=2018-04-01
# package's http://www.dpi.inpe.br/datasearch/granule.json?&bbox=-53.635253906,-18.6228217860888,-52.940368652343,-18.2058711273303&path=&row=&band=&start=2018-04-01&end=2019-03-31&count=20&startIndex=1&dataset=S2SR

