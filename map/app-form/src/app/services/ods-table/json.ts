import * as o from './ods'
import * as g from './geo'
import {Address, LatLng, Association, Contact, Link, SocialMediaLink, TextBlock, SocialMediaPlatform, Image}
       from '../../model/association';
import {v4 as uuidv4} from 'uuid';

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
            obj = {
                "addressLine1?": addrLines[0],
                "addressLine2?": addrLines[1],
                "addressLine3?": addrLines[2],
                "street?": addrLines[0],
                "postcode?": postcode,
                "city?": city,
                "country?": "",
            }
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

        let jsonAddress : JSON = <JSON> obj

        const lat_lon = coordinates.split(/\s+/).map(parseFloat)
        obj = {
            "lat": lat_lon[0],
            "lng": lat_lon[1],
        }
        const _latlng : LatLng = {
            lat : lat_lon[0],
            lng : lat_lon[1],
        }

        let jsonLatLng : JSON = <JSON> obj

        let arrContacts = new Array()
        let _contact : Contact

        if (contact) {
            // we'got just 1 contact
            let jsonContact : JSON
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
            jsonContact = <JSON> obj
            arrContacts.push(jsonContact)

            const __contact : Contact = {
                id : '',
                name : '',
                mail : contactDetails[1],
                phone : contactDetails[0],
                fax : '',
                associationId : '',
            }
            _contact = __contact
            // console.log(_contact)
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
                let jsonLink : JSON = <JSON> obj
                arrLinks.push(jsonLink)

                const _link : Link = {
                    id : '',
                    linkText : '',
                    url : url,
                    associationId : '',
                }
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
            const _link : Link = {
                id : '',
                linkText : '',
                url : url,
                associationId : '',
            }

            let jsonLink : JSON = <JSON> obj
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
            let jsonSocialMediaLinkBase : JSON = <JSON> obj
            // const socialMediaLinkBase : SocialMediaLinkBase
            // socialMediaLinkBase.platform? = SocialMediaPlatform

            // extends Link
            let jsonSocialMediaLink = { ...jsonLink, ...jsonSocialMediaLinkBase}
            arrSocialMedias.push(jsonSocialMediaLink)

            // const socialMediaLink : SocialMediaLink
            // socialMediaLink.link = link
            // socialMediaLink.socialMediaLinkBase = SocialMediaLinkBase
        }

        obj = {
            "format?": 'plain', // 'plain' | 'html'
            "text": "",
        }
        let jsonTextBlock : JSON = <JSON> obj
        const _textBlock : TextBlock = {
            format : 'plain', // 'plain' | 'html'
            text : '',
        }

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
                let jsonImage : JSON = <JSON> obj
                arrImages.push(jsonImage)

                const _image : Image = {
                    id : '',
                    url : url,
                    altText : '',
                    associationId : '',
                }
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
            "goals?": jsonTextBlock,
            "activities?": jsonTextBlock,
            "contacts?": arrContacts,
            "links?": arrLinks,
            "socialMedia?": arrSocialMedias,
            "images?": arrImages,
            "activityList?": activityList,
            "districtList?": districtList,
        }
        // extends Address, LatLng
        let jsonAssociation : JSON = <JSON> obj
        const _association : Association = {
            // id : '',
            id: uuidv4(),
            name : name,
            lat : _latlng.lat,
            lng : _latlng.lng,
            contacts : [_contact],

            // shortName : undefined,
            // goals : _textBlock,
            // activities : _textBlock,
            // contacts : arrContacts,
            // links : arrLinks,
            // socialMedia : arrSocialMedias,
            // images : arrImages,
            // activityList : activityList,
            // districtList : districtList,
        }

        // return { ...jsonAssociation, ...jsonAddress, ...jsonLatLng }
        // return {...jsonLatLng}
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

export function getAssociations(fname) : Association[] {
    const odsTable = o.calcReadTable(fname)
    // TODO remove empty elements
    // const jsonObject = jsonObjectFull.filter(isNotEmpty)
    return calcGeoData(odsTable)
  }
