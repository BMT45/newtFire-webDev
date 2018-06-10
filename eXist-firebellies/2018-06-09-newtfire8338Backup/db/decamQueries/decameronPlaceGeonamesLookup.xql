xquery version "3.0";
declare default element namespace "http://www.tei-c.org/ns/1.0"; 
let $decamColl := collection('/db/decameron/')
let $engdecameron := doc('/db/decameron/engDecameronTEI.xml')/*
let $itdecameron := doc('/db/decameron/itDecameron.xml')/*
let $engplaceNames := $engdecameron//text//placeName
let $itMarkedplaces := $itdecameron//text//name[@type="place"]
let $itplaceNames := $itdecameron//place/@*[contains(name(), "it")]/normalize-space(string())
let $itplaceAttNames :=$itdecameron//place/@*/name()
let $itplaceGen := $itdecameron//place
let $imaginary := $itplaceGen/@imaginary/string()
let $italianCity :=  $itplaceGen/@itcity

let $placeType := $itplaceGen/@type

let$placeIsCity := $itplaceGen[@type="city"]

let $othcity := $itplaceGen/@othcity/string()

(:ebb 2016-04-15 I haven't explored all the different possibilities here, but the Italian file has lots of specialized information encoded about places and types. You could extract all the cities and use their Italian names to plot on a map. :)

(:  :let $dValuesCityList:= distinct-values($placeIsCity[not(contains(., '('))]):)
let $dValuesCityList:= distinct-values($engplaceNames)
for $city in $dValuesCityList
(:  :let $stuff:= "London":)
let $url := concat("http://api.geonames.org/search?q=", $city, "&amp;username=ebeshero")
let $urlDoc := concat("&amp;quot;", $url, "&amp;quot;")
return $url
    

