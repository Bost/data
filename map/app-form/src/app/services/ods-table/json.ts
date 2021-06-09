import * as o from './ods'
import * as g from './geo'

function processTableRowUmap(requestFormat, row) {
    const address      = row[o._address]
    const cityDistrict = row[o._cityDistrict]
    const name         = row[o._name]
    const desc         = row[o._desc]
    const goal         = row[o._goal]
    const activity     = row[o._activity]
    const coordinates  = row[o._coordinates]
    const logos        = row[o._logo]
    const normAddr     = g.normalizeAddress(address)
    const descMarkdown = desc.split(/\s+/).map(g.encodeLine)

    let logosMarkdown = ""
    if (logos) {
        let arrMarkdown = logos.split(/\s+/).map((s) => {
            return "{{" + s + "}}\n"
        })
        logosMarkdown = arrMarkdown.concat()
        // console.log("arrMarkdown.concat(): " + arrMarkdown.concat())
    }
    else {
        console.log("logos " + logos + "; " + name)
    }
    // let allFeatures
    if (coordinates) {
        // console.log('coordinates : '+ coordinates)
        let obj: any =
            [{
                "type": "Feature",
                "properties": {
                    "geocoding": { "name": "" },
                    "description": logosMarkdown +
                        address + "\n\n" +
                        descMarkdown + "\n\n" +
                        "Aktiv in Stadtteil(en): " + cityDistrict + "\n\n"+
                        "Ziele des Vereins: " + goal + "\n\n"+
                        "Aktivitätsbereiche: " + activity,

                    "search_address": normAddr,
                    "search_district": cityDistrict,
                    "search_desc": desc,
                    "search_goal": goal,
                    "search_activity": activity,
                    "name" : name
                },
                "geometry": {
                    "type": "Point",
                    "coordinates": coordinates.split(/\s+/)
                    // (read-string (format "[%s]" coordinates))
                }}]
        let allFeatures: JSON = <JSON> obj
        return allFeatures
    }
    else {
        console.log(name + ": TODO talk to the Nominatim address resolver API")
    }
}

function processTableRowAngular(requestFormat, row) {
    const address      = row[o._address]
    const contact      = row[o._contact]
    const cityDistrict = row[o._cityDistrict]
    const name         = row[o._name]
    const desc         = row[o._desc]
    const goal         = row[o._goal]
    const activity     = row[o._activity]
    const coordinates  = row[o._coordinates]
    const logos        = row[o._logo]
    const links        = row[o._webPage]
    const normAddr     = g.normalizeAddress(address)
    const descMarkdown = desc.split(/\s+/).map(g.encodeLine)

    let logosMarkdown = ""
    if (logos) {
        let arrMarkdown = logos.split(/\s+/).map((s) => {
            return "{{" + s + "}}\n"
        })
        logosMarkdown = arrMarkdown.concat()
        // console.log("arrMarkdown.concat(): " + arrMarkdown.concat())
    }
    else {
        // console.log("logos " + logos + "; " + name)
    }

    // TODO send HTTP request with this json-obj to an API service. This service
    // inserts the data in the dbase

    if (coordinates) {
        let addrLines = []
        if (normAddr != "keine öffentliche Anschrift") {
            addrLines = normAddr.split(/, /)
        }

        // See association.ts
        let obj : any
        {
            let postcode : String  // TODO is postcode a string or integer?
            let city : String
            let postcode_city = addrLines[1]
            if (postcode_city) {
                let postcode_city_split = postcode_city.split(/\s+/)
                postcode = postcode_city_split[0]
                city = postcode_city_split[1]
            }
            // TODO better parsing of the address-field is needed
            // any undefined addressLine is pruned from the JSON object
            obj = {
                "addressLine1?": addrLines[0],
                "addressLine2?": addrLines[1],
                "addressLine3?": addrLines[2],
                "street?": addrLines[0],
                "postcode?": postcode,
                "city?": city,
                "country?": "",
            }
        }
        let Address : JSON = <JSON> obj

        const lat_lon = coordinates.split(/\s+/).map(parseFloat)
        obj = {
            "lat": lat_lon[0],
            "lng": lat_lon[1],
        }
        let LatLng : JSON = <JSON> obj

        let arrContacts = new Array()
        if (contact) {
            // we'got just 1 contact
            let Contact : JSON
            // console.log("contact: " + contact)
            // TODO better parsing of the contact-field is needed
            let contactDetails = contact.split(/\n/)
            obj = {
                "id?": "",
                "name?": "",
                "mail?": contactDetails[1],
                "phone?": contactDetails[0],
                "fax?": "",
                "associationId?": "",
            }
            Contact = <JSON> obj
            arrContacts.push(Contact)
        }

        let arrLinks = new Array()
        if (links) {
            let linkList = links.split(/\s+/)
            for (var i = 0; i < linkList.length; i++) {
                var url = linkList[i]
                obj = {
                    "id?": "",
                    "linkText?": "",
                    "url": url,
                    "associationId?": "",
                }
                let Link : JSON = <JSON> obj
                arrLinks.push(Link)
            }
        }

        let arrSocialMedias = new Array()
        {
            // TODO for the social media classification see `encodeLine`
            obj = {
                "id?": "",
                "linkText?": "",
                "url": "",
                "associationId?": "",
            }
            let Link : JSON = <JSON> obj
            // export enum SocialMediaPlatform {
            //     FACEBOOK = 'Facebook',
            //     INSTAGRAM = 'Instagram',
            //     TWITTER = 'Twitter',
            //     PINTEREST = 'Pinterest',
            //     SNAPCHAT = 'Snapchat',
            //     LINKEDIN = 'LinkedIn',
            //     WHATSAPP = 'WhatsApp',
            //     YOUTUBE = 'YouTube',
            //     OTHER = 'Other'
            // }
            let SocialMediaPlatform = 'Facebook'
            obj = {
                "platform?": SocialMediaPlatform,
            }
            let SocialMediaLinkBase : JSON = <JSON> obj
            // extends Link
            let SocialMediaLink = { ...Link, ...SocialMediaLinkBase}
            arrSocialMedias.push(SocialMediaLink)
        }

        obj = {
            "format?": 'plain', // 'plain' | 'html'
            "text": "",
        }
        let TextBlock : JSON = <JSON> obj

        let arrImages = new Array()
        if (logos) {
            let logoList = logos.split(/\s+/)
            for (var i = 0; i < logoList.length; i++) {
                var url = logoList[i]
                obj = {
                    "id?": "",
                    "url": url,
                    "altText?": "",
                    "associationId?": "",
                }
                let Image : JSON = <JSON> obj
                arrImages.push(Image)
            }
        }

        let activityList
        if (activity) {
            activityList = activity.split(/, /)
        }
        let districtList
        if (cityDistrict) {
            districtList = cityDistrict.split(/, /)
        }

        obj = {
            "id": "",
            "name": name,
            "shortName?": undefined,
            "goals?": TextBlock,
            "activities?": TextBlock,
            "contacts?": arrContacts,
            "links?": arrLinks,
            "socialMedia?": arrSocialMedias,
            "images?": arrImages,
            "activityList?": activityList,
            "districtList?": districtList,
        }
        // extends Address, LatLng
        let Association : JSON = <JSON> obj

        return { ...Association, ...Address, ...LatLng }
        // return {...LatLng}
    }
    else {
        console.log(name + ": TODO talk to the Nominatim address resolver API")
        return {}
    }
}

export const _umap = '_umap'
export const _geojson = '_geojson'
function calcGeoData(odsTable) {
    const format = _geojson
    // odsTable = odsTable.slice(odsTable.length - 1, odsTable.length - 0)
    // console.log(odsTable)
    return odsTable.map((tableRow, format) => {
        // return processTableRowUmap(format, tableRow)
        return processTableRowAngular(format, tableRow)
    })
}

function isNotEmpty(value) {
    return Object.keys(value).length !== 0
}

let fs = require("fs")
let odsTable = o.calcReadTable()
let jsonObjectFull = calcGeoData(odsTable)
// remove empty elements
let jsonObject = jsonObjectFull.filter(isNotEmpty)

const fout = "./out.umap"
fs.writeFile(fout, JSON.stringify(jsonObject, null, 4), (err) => {
    if (err) {
        console.error(err)
        return
    }
    console.log(fout + " containing "+ jsonObject.length + " elements created")
})
