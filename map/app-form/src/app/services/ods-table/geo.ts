import * as o from './ods'

export function normalizeAddress(address) {
    if (address) {
        // console.log("address: "+address)
        var adr = o.replaceAll(address, '\n', ', ')
        // console.log("adr: "+adr)
        var adrMatch = adr.match(/[0-9] [A-z],/)
        if (adrMatch) {
            var oldHouseNr = adrMatch.toString()
            // replace is replaceFirst
            var newHouseNr = o.replaceAll(oldHouseNr, " ", "")
            var newAdr = adr.replace(new RegExp(oldHouseNr, "g"), newHouseNr)
            return newAdr
        }
        else {
            return adr
        }
    }
    else
        return address
}

function formatLink(line, prefix) {
    var s1;

    if (line.endsWith("mig.madeingermany-stuttgart.de")
        ||
        line.startsWith(prefix+"www.")) {
        s1 = ""
    }
    else {
        s1 = "www."
    }

    var fmtLine
    if (line.endsWith("/")) {
        fmtLine = line.substring(0, line.length - 1)
    }
    else {
        fmtLine = line
    }
    var s2 = fmtLine.replace(new RegExp(prefix, "g"), "")
    var r = "[[${line}|${s1}${s2}]]"
    return r
}

// "2 kB"
const facebookLogo =
 "https://cdn.iconscout.com/icon/free/png-256/facebook-108-432507.png"

// "15 kB"
const instagramLogo =
 "https://cdn.iconscout.com/icon/free/png-256/instagram-188-498425.png"

// "3.3 kB"
const youtubeLogo =
 "https://cdn.iconscout.com/icon/free/png-256/youtube-82-189778.png"

export function encodeLine(line) {
    var imgSize = 14
    var s
    if (line.startsWith("https://www.facebook.com/")) {
        s = "{{" +facebookLogo + "|" + imgSize + "}}" + " [[${line}|Facebook]]"
        return s
    }
    else if (line.startsWith("https://deDe.facebook.com/")) {
        s = "{{" +facebookLogo + "|" + imgSize + "}}" + " [[${line}|Facebook]]"
        return s
    }
    else if (line.startsWith("https://www.instagram.com/")) {
        s = "{{" +instagramLogo + "|" + imgSize + "}}" + " [[${line}|Instagram]]"
        return s
    }
    else if (line.startsWith("https://www.youtube.com/")) {
        s = "{{" +youtubeLogo + "|" + imgSize + "}}" + " [[${line}|YouTube]]"
        return s
    }
    else if (line.startsWith("https://")) {
        return formatLink(line, "https://")
    }
    else if (line.startsWith("http://")) {
        return formatLink(line, "http://")
    }
    else {
        return line
    }
}

