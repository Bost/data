<?php
/**
 * Creates or updates the district options.
 */
require '../database.php';

$postdata = file_get_contents("php://input");

function endsWith($haystack, $needle) {
    $length = strlen($needle);
    if (!$length) {
        return true;
    }
    return substr($haystack, -$length) === $needle;
}

if (isset($postdata) && !empty($postdata)) {
    $request = json_decode($postdata);

    // Update.
    $sql = "UPDATE districts SET current = 0;

            ";

    $sql .= "REPLACE INTO districts (value, label, category, current) VALUES";

    foreach ($request as $i => $item) {
        $label = '';
        $value = '';
        $category = null;
        $orderIndex = -1;

        foreach ($item as $k => $v) {
            if ($k == 'label') {
                $label = $v;
            }
            if ($k == 'value') {
                $value = $v;
            }
            if ($k == 'category') {
                $category = $v;
            }
            if ($k == 'orderIndex') {
                $orderIndex = $v;
            }
        }
        if ($label != '' && $value != '') {
            $value = mysqli_real_escape_string($con, trim($value));
            $label = mysqli_real_escape_string($con, trim($label));
            $category = mysqli_real_escape_string($con, trim($category));
            if ($category == '' || $category == null) {
                $sql .= "('$value', '$label', null, $orderIndex, 1),";
            } else {
                $sql .= "('$value', '$label', '$category', $orderIndex, 1),";
            }
            continue;
        }
        $sql .= "('$value', '$label', null, 1),";
    }

    if (endsWith($sql, ',')) {
        $sql = substr($sql, 0, -1);
        $sql .= ';';
    }

    if (mysqli_multi_query($con, $sql)) {
        do {
            if ($result = mysqli_store_result($con)) {
                while ($row = mysqli_fetch_row($result)) {
                    printf("%s\n", $row[0]);
                }
                mysqli_free_result($result);
            }
            if (mysqli_more_results($con)) {
                printf("-----------------\n");
            }
        } while (mysqli_next_result($con));
        http_response_code(204);
    } else {
        echo $sql;
        echo mysqli_error($con) . ": " . mysqli_error($con) . "\n";
        return http_response_code(422);
    }
}
