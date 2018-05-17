<?php
  header('Content-Type: application/json');

  include 'connect.php';

  $result = array();

  /* Return JSON with error message and exit */
  function exitWithError($errorMessage) {
    global $result;
    $result['errorMessage'] = "Database error: " . $errorMessage;
    echo json_encode($result);
    exit(1);
  }

  if(!is_null($errorMessage)) {
    exitWithError($errorMessage);
  }

  $sql = "SELECT c.category_id, c.category_name, c.category_image_link, i.ingredient_id, i.ingredient_name FROM category_ingredient ci INNER JOIN categories c ON ci.category_id = c.category_id INNER JOIN ingredients i ON ci.ingredient_id = i.ingredient_id ORDER BY c.category_id, i.ingredient_id ASC";
  $dbResult = $conn->query($sql);

  if ($dbResult->num_rows > 0) {
    $currentCatId = 0;
    while($row = $dbResult->fetch_assoc()) {
      //echo $row['category_id'] . " " . $row['category_name'] . " : " . $row['ingredient_name'] . "\n";
      if ($currentCatId !== $row['category_id']) {
        //echo "add new category " . $row['category_id'] . "\n";
        $newCategory = array(
          "id"=>$row['category_id'],
          "category"=>$row['category_name'],
          "image"=>$row['category_image_link'],
          "items"=>array($row['ingredient_name'])
        );
        array_push($result, $newCategory);
        $currentCatId = $row['category_id'];
      } else {
        //echo "check existing category " . $row['category_id'] . "\n";
        foreach($result as $index=>$category) {
          //echo "...checking category " . $category['id'] . "\n";
          if (in_array($row['category_id'], $category)) {
            //echo "......found!\n";
            array_push($result[$index]['items'], $row['ingredient_name']);
            break;
          }
        }
      }
    }
  } else {
    $result["errorMessage"] = "0 results!";
  }

  $conn->close();

  echo json_encode($result);
?>