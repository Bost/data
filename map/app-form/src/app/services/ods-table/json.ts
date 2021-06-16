import * as o from './ods'
import * as g from './geo'
import {Address, LatLng, Association, Contact, Link, SocialMediaLink, TextBlock, SocialMediaPlatform, Image}
       from '../../model/association'
import {v4 as uuidv4} from 'uuid'

// Thanks to https://stackoverflow.com/a/6234804
function escapeHtml(unsafe) {
    return unsafe
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;")
    // TODO clarify newlines in the goals and activities. Also TextBlock format
    // can be 'plain' or 'html'
        .replace(/\n/g, "<br/>")
}

function escapeHtmlWithNull(unsafe) {
    return unsafe ? escapeHtml(unsafe) : ""
}

function processTableRowAngular(requestFormat, row) {
    const address      = row[o._address]
    const addr_recv    = row[o._addr_recv]
    const contact      = row[o._contact]
    const cityDistrict = row[o._cityDistrict]
    const name         = row[o._name]
    const desc         = row[o._desc]
    const activity     = escapeHtmlWithNull(row[o._activity])
    const goal         = escapeHtmlWithNull(row[o._goal])
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
    }

    // TODO send HTTP request with this json-obj to an API service. This service
    // inserts the data in the dbase

    if (coordinates) {
        let addrLines = []
        if (normAddr != "keine öffentliche Anschrift") {
            addrLines = normAddr.split(/, /)
        }

        let _address : Address
        let obj : any
        {
            let postcode : string // TODO is postcode a string or integer?
            let city : string
            let postcode_city = addrLines[1]
            if (postcode_city) {
                let postcode_city_split = postcode_city.split(/\s+/)
                postcode = postcode_city_split[0]
                city = postcode_city_split[1]
            }
            // TODO better parsing of the address-field is needed
            // any undefined addressLine is pruned from the JSON object
            const __address : Address = {
                addressLine1 : addrLines[0],
                addressLine2 : addrLines[1],
                addressLine3 : addrLines[2],
                street : addrLines[0],
                postcode : postcode,
                city : city,
                country : '',
            }
            _address = __address
        }

        const lat_lon = coordinates.split(/\s+/).map(parseFloat)
        const _latlng : LatLng = {
            lat : lat_lon[1],
            lng : lat_lon[0],
        }

        const associationId : string = uuidv4()
        const contactId : string = uuidv4()
        let arrContact : Contact[] = new Array()
        if (contact) {
            // we'got just 1 contact
            // TODO better parsing of the contact-field is needed
            let contactDetails = contact.split(/\n/)

            const _contact : Contact = {
                id : contactId,
                name : '',
                mail : contactDetails[1],
                phone : contactDetails[0],
                fax : '',
                associationId : associationId,
            }
            arrContact.push(_contact)
        }

        let arrLink : Link[] = new Array()
        if (links) {
            let linkList = links.split(/\s+/)
            for (var i = 0; i < linkList.length; i++) {
                var url = linkList[i]
                const _link : Link = {
                    id : uuidv4(),
                    linkText : '',
                    url : url,
                    associationId : associationId,
                }
                arrLink.push(_link)
            }
        }

        let arrSocialMediaLink : SocialMediaLink[] = new Array()
        {
            // TODO for the social media classification see `encodeLine`
            const _socialMediaLink : SocialMediaLink = {
                platform : SocialMediaPlatform.FACEBOOK,
                id : uuidv4(),
                linkText : '',
                url : url,
                associationId : associationId,
            }
            arrSocialMediaLink.push(_socialMediaLink)
        }

        const _activities : TextBlock = {
            format : 'plain', // 'plain' | 'html'
            text : activity,
        }

        const _goals : TextBlock = {
            format : 'plain', // 'plain' | 'html'
            text : goal,
        }

        let arrImages : Image[] = new Array()
        if (logos) {
            let logoList = logos.split(/\s+/)
            for (var i = 0; i < logoList.length; i++) {
                var url = logoList[i]
                const _image : Image = {
                    id : uuidv4(),
                    url : url,
                    altText : '',
                    associationId : associationId,
                }
                arrImages.push(_image)
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

        const _association : Association = {
            id: associationId,
            name : name,
            // shortName : addr_recv,
            goals : _goals,
            activities : _activities,
            contacts : arrContact,
            links : arrLink,
            socialMedia : arrSocialMediaLink,
            images : arrImages,
            activityList : activityList,
            districtList : districtList,

            addressLine1 : _address.addressLine1,
            addressLine2 : _address.addressLine2,
            addressLine3 : _address.addressLine3,
            street : _address.street,
            postcode : _address.postcode,
            city : _address.city,
            country : _address.country,

            lat : _latlng.lat,
            lng : _latlng.lng,
        }
        return _association
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
    return odsTable.map((tableRow, format) => {
        return processTableRowAngular(format, tableRow)
    })
}

function isNotEmpty(value) {
    return Object.keys(value).length !== 0
}

export function getAssociations(fname) : Association[] {
    const odsTable = o.calcReadTable(fname)
    // TODO remove empty elements
    // const jsonObject = jsonObjectFull.filter(isNotEmpty)
    return calcGeoData(odsTable)
}
