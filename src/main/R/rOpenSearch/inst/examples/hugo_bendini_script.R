# Hugo Bendini's script hbendini@dsr.inpe.br
library(htm2txt)

# parameters
west  <- -53.635253906
south <- -18.62282178608876
east  <- -52.940368652343
north <- -18.205871127330347
date.ini <- "2018-04-01"
date.end <- "2019-03-31"
cloud <- 20

# build url
url.target <- sprintf("http://www.dpi.inpe.br/datasearch/granule.json?&bbox=%s,%s,%s,%s&path=&row=&band=&start=%s&end=%s&count=%s&startIndex=1&dataset=S2SR", west, south, east, north, date.ini, date.end, cloud)
print(url.target)

#
text <- htm2txt::gettxt(url.target)
y <- strsplit(text, "[[:space:]]+")
df <- as.data.frame(y)
target <- df$c.........features...................geometry..............coordinates......[grep(".tif",df$c.........features...................geometry..............coordinates......)]
target <- as.vector(target)

# set user's home
setwd(Sys.getenv("HOME"))

# download
for (i in 1:length(target[-grep("NDVI",target)])) {
    utils::download.file(substr(target[-grep("NDVI",target)][i], 2, 165),
                  destfile = substr(target[-grep("NDVI",target)][i], 136, 165),
                  method = "curl")
}

for (i in 1:length(target[grep("NDVI",target)])) {
    utils::download.file(substr(target[grep("NDVI",target)][i], 2, 166),
                  destfile = substr(target[grep("NDVI",target)][i], 136, 166),
                  method = "curl")
}

