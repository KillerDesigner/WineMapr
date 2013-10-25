require 'typhoeus'
require 'awesome_print'
require 'json'

request = Typhoeus.get("http://api.snooth.com/wines/",
    params: {akey: "uhtup8bko39e2mwdps1w0tr1vdea8oovrc1weykm8kzz2ug6", q: "cabernet sauvignon"})

hash = JSON.parse(request.body)

ap hash