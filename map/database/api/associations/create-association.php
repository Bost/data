<?php
/**
 * Creates an association.
 */
require '../database.php';

$postdata = file_get_contents("php://input");

if (isset($postdata) && !empty($postdata)) {
    $request = json_decode($postdata);

    // Validate.
    if (trim($request->id) == null
        || strlen(trim($request->id)) != 36
        || trim($request->name) == ''
        || $request->name == null
        || $request->lat == null
        || $request->lng == null) {
        return http_response_code(400);
    }

    // Sanitize.
    $id = mysqli_real_escape_string($con, trim($request->id));
    $name = mysqli_real_escape_string($con, trim($request->name));
    $shortName = mysqli_real_escape_string($con, trim($request->shortName));
    $lat = mysqli_real_escape_string($con, trim($request->lat));
    $lng = mysqli_real_escape_string($con, trim($request->lng));
    $addressLine1 = mysqli_real_escape_string($con, trim($request->addressLine1));
    $addressLine2 = mysqli_real_escape_string($con, trim($request->addressLine2));
    $addressLine3 = mysqli_real_escape_string($con, trim($request->addressLine3));
    $street = mysqli_real_escape_string($con, trim($request->street));
    $postcode = mysqli_real_escape_string($con, trim($request->postcode));
    $city = mysqli_real_escape_string($con, trim($request->city));
    $country = mysqli_real_escape_string($con, trim($request->country));
    $goals_format = mysqli_real_escape_string($con, trim($request->goals->format));
    $goals_text = mysqli_real_escape_string($con, trim($request->goals->text));
    $activities_format = mysqli_real_escape_string($con, trim($request->activities->format));
    $activities_text = mysqli_real_escape_string($con, trim($request->activities->text));
    $activityList = json_encode($request->activityList, JSON_UNESCAPED_UNICODE);
    $districtList = json_encode($request->districtList, JSON_UNESCAPED_UNICODE);
    
    $contacts = $request->contacts;
    $links = $request->links;
    $socialMedia = $request->socialMedia;
    $images = $request->images;

    // Update.
    $sql = "INSERT INTO associations SET id = '$id', 
                                       name = '$name', 
                                       shortName = '$shortName',
                                       lat = $lat, 
                                       lng = $lng, 
                                       addressLine1 = '$addressLine1',
                                       addressLine2 = '$addressLine2',
                                       addressLine3 = '$addressLine3',
                                       street = '$street',
                                       postcode = '$postcode',
                                       city = '$city',
                                       country = '$country',
                                       goals_format = '$goals_format',
                                       goals_text = '$goals_text',
                                       activities_format = '$activities_format',
                                       activities_text = '$activities_text',
                                       districtList = '$districtList',
                                       activityList = '$activityList',
                                       current = 1
                ON DUPLICATE KEY UPDATE
                                       name = '$name', 
                                       shortName = '$shortName',
                                       lat = $lat, 
                                       lng = $lng, 
                                       addressLine1 = '$addressLine1',
                                       addressLine2 = '$addressLine2',
                                       addressLine3 = '$addressLine3',
                                       street = '$street',
                                       postcode = '$postcode',
                                       city = '$city',
                                       country = '$country',
                                       goals_format = '$goals_format',
                                       goals_text = '$goals_text',
                                       activities_format = '$activities_format',
                                       activities_text = '$activities_text',
                                       districtList = '$districtList',
                                       activityList = '$activityList',
                                       current = 1;";

    $sql .= "\n\nUPDATE contacts SET current = 0 WHERE associationId = '$id';";

    if ($contacts != null) {
        $index = 0;
        foreach ($contacts as $i => $contact) {
            $contactId = mysqli_real_escape_string($con, trim($contact->id));
            $contactName = mysqli_real_escape_string($con, trim($contact->name));
            $phone = mysqli_real_escape_string($con, trim($contact->phone));
            $mail = mysqli_real_escape_string($con, trim($contact->mail));
			$fax = mysqli_real_escape_string($con, trim($contact->fax));
            $associationId = $id;

            $sql .= "\n\nINSERT INTO contacts SET id = '$contactId',
                                 name = '$contactName',
                                 phone = '$phone',
                                 mail = '$mail',
								 fax = '$fax',
                                 associationId = '$id',
                                 orderIndex = $index,
                                 current = 1
                         ON DUPLICATE KEY UPDATE
                                 name = '$contactName',
                                 phone = '$phone',
                                 mail = '$mail',
								 fax = '$fax',
                                 associationId = '$id',
                                 orderIndex = $index,
                                 current = 1;";

            $index++;
        }
    }

    $sql .= "\n\nUPDATE contacts SET current = 0 WHERE associationId = '$id';";

    if ($images != null) {
        $index = 0;
        foreach ($images as $i => $image) {
            $imageId = mysqli_real_escape_string($con, trim($image->id));
            $url = mysqli_real_escape_string($con, trim($image->url));
            $altText = mysqli_real_escape_string($con, trim($image->altText));
            $associationId = $id;

            $sql .= "\n\nINSERT INTO images SET id = '$imageId',
                                        url = '$url',
                                        altText = '$altText',
                                        associationId = '$id',
                                        orderIndex = $index,
                                        current = 1
                         ON DUPLICATE KEY UPDATE
                                        url = '$url',
                                        altText = '$altText',
                                        associationId = '$id',
                                        orderIndex = $index,
                                        current = 1;";

            $index++;
        }
    }

    $sql .= "\n\nUPDATE links SET current = 0 WHERE associationId = '$id';";

    if ($links != null) {
        $index = 0;
        foreach ($links as $i => $link) {
            $linkId = mysqli_real_escape_string($con, trim($link->id));
            $url = mysqli_real_escape_string($con, trim($link->url));
            $linkText = mysqli_real_escape_string($con, trim($link->linkText));
            $associationId = $id;

            $sql .= "\n\nINSERT INTO links SET id = '$linkId',
                                       url = '$url',
                                       linkText = '$linkText',
                                       associationId = '$id',
                                       orderIndex = $index,
                                       current = 1
                          ON DUPLICATE KEY UPDATE 
                                       url = '$url',
                                       linkText = '$linkText',
                                       associationId = '$id',
                                       orderIndex = $index,
                                       current = 1;";
            $index++;
        }
    }

    $sql .= "\n\nUPDATE socialmedia SET current = 0 WHERE associationId = '$id';";

    if ($socialMedia != null) {
        $index = 0;
        foreach ($socialMedia as $i => $socialMediaEntry) {
            $socialMediaId = mysqli_real_escape_string($con, trim($socialMediaEntry->id));
            $platform = mysqli_real_escape_string($con, trim($socialMediaEntry->platform));
            $url = mysqli_real_escape_string($con, trim($socialMediaEntry->url));
            $linkText = mysqli_real_escape_string($con, trim($socialMediaEntry->linkText));
            $associationId = $id;

            $sql .= "\n\nINSERT INTO socialmedia SET id = '$socialMediaId',
                                              platform = '$platform',
                                              url = '$url',
                                              linkText = '$linkText',
                                              associationId = '$id',
                                              orderIndex = $index,
                                              current = 1
                          ON DUPLICATE KEY UPDATE
                                              platform = '$platform',
                                              url = '$url',
                                              linkText = '$linkText',
                                              associationId = '$id',
                                              orderIndex = $index,
                                              current = 1;";
            $index++;
        }
    }

    if (mysqli_multi_query($con, $sql)) {
        do {

            if ($result = mysqli_store_result($con)) {
                while ($row = mysqli_fetch_row($result)) {
                    printf("%s\n", $row[0]);
                }
                mysqli_free_result($result);
            }
        } while (mysqli_more_results($con) && mysqli_next_result($con));

        http_response_code(204);

    } else {

        echo mysqli_error($con) . ": " . mysqli_error($con) . "\n";
        return http_response_code(422);

    }
}