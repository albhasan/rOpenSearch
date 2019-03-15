osd.url <- "http://eo-virtual-archive4.esa.int/search/ASA_IM__0P/description"
response.type <- "application/rdf+xml"

osd.url <- "http://www.dpi.inpe.br/datasearch"
response.type <- "application/atom+xml"

df.params <- GetOSQueryables(osd.url, response.type)
df.params$value[df.params$type == "count"] <- 30
df.params$value[df.params$type == "time:start"] <- "2010-01-10"
df.params$value[df.params$type == "time:end"] <- "2010-01-31"
res <- Query(osd.url, response.type, df.params)
res

# opensearch.description <- osd.url
