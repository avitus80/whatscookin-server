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

  /* Check if the recipe has the ingredients */
  function isMatch($recipeId, $ingredients) {
    global $conn;

    /* Get ingredient name with recipe ID */
    $sql = "SELECT i.ingredient_name FROM recipe_ingredient ri INNER JOIN ingredients i ON ri.ingredient_id = i.ingredient_id AND ri.recipe_id = ? ORDER BY ri.recipe_id, i.ingredient_name";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $recipeId);
    $stmt->execute();
    $dbResult = $stmt->get_result();
    $stmt->close();
    
    if ($dbResult->num_rows > 0) {
      $dbIngredients = $dbResult->fetch_all();
      
      foreach($dbIngredients as $index=>$name) {
        //echo "ID " . $recipeId . " Searching [" . $name[0] . "]\n";
        // check if recipe's ingredients are in our list
        if (!in_array($name[0], $ingredients)) {
          // we don't have the required ingredient
          return false;
        }
      }

      // we have all required ingredients
      return true;
    }

    return false;
  }

  if(!is_null($errorMessage)) {
    exitWithError($errorMessage);
  }

  $incomingData = file_get_contents('php://input');
  $ingredients = json_decode($incomingData, true);
  // testing
  //$ingredients = array("Egg");
  sort($ingredients);
  //print_r($ingredients);

  /* Get recipe ID with ingredient count */
  $sql = "SELECT recipe_id FROM recipe_ingredient GROUP BY recipe_id HAVING count(ingredient_id) <= ?";
  $stmt = $conn->prepare($sql);
  $stmt->bind_param("i", count($ingredients));
  $stmt->execute();
  $dbResult = $stmt->get_result();
  $stmt->close();

  $recipeIds = array();
  if ($dbResult->num_rows > 0) {
    while($row = $dbResult->fetch_assoc()) {
      array_push($recipeIds, $row['recipe_id']);
    }
  // } else {
  //    $result["errorMessage"] = "0 results!";
  }
  //print_r($recipeIds);

  if (count($recipeIds) > 0) {
    $matchedIds = array();
    /* Get recipe ID that has our ingredients */
    foreach($recipeIds as $id) {
      if (isMatch($id, $ingredients)) {
        //echo "Receipt " . $id . " match!\n";
        array_push($matchedIds, $id);
      // } else {
      //   echo "Receipt " . $id . " NOT match!\n";
      }
    }

    if (count($matchedIds) > 0) {
      /* Get recipe details with recipe ID */
      foreach($matchedIds as $id) {
        //echo "Get recipe " . $id . "\n";
        $sql = "SELECT * FROM recipes WHERE recipe_id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $dbResult = $stmt->get_result();
        $stmt->close();

        if ($dbResult->num_rows > 0) {
          while($row = $dbResult->fetch_assoc()) {
            array_push($result, $row);
          }
        }
      }
    }
  }

  $conn->close();

  echo json_encode($result);
?>