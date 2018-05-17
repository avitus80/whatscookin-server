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

  $incomingData = file_get_contents('php://input');
  $recipeId = json_decode($incomingData, true)['recipeId'];

  /* Get ingredients */
  $sql = "SELECT ri.recipe_id, ri.amount, m.measurement_unit, i.ingredient_name FROM recipe_ingredient ri LEFT JOIN ingredients i ON ri.ingredient_id = i.ingredient_id LEFT JOIN measurements m ON ri.measurement_id = m.measurement_id WHERE ri.recipe_id = ?";
  $stmt = $conn->prepare($sql);
  $stmt->bind_param("i", $recipeId);
  $stmt->execute();
  $dbResult = $stmt->get_result();
  $stmt->close();

  $ingredients = array();
  if ($dbResult->num_rows > 0) {
    while($row = $dbResult->fetch_assoc()) {
      array_push($ingredients, $row);
    }
  }
  $result['ingredients'] = $ingredients;

  /* Get methods */
  $sql = "SELECT * FROM methods WHERE recipe_id = ?";
  $stmt = $conn->prepare($sql);
  $stmt->bind_param("i", $recipeId);
  $stmt->execute();
  $dbResult = $stmt->get_result();
  $stmt->close();
  
  $methods = array();
  if ($dbResult->num_rows > 0) {
    while($row = $dbResult->fetch_assoc()) {
      array_push($methods, $row);
    }
  }
  $result['methods'] = $methods;

  $conn->close();

  echo json_encode($result);
?>