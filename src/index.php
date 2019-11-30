<?php

$host = 'db'; // name of docker-compose db service
$user = 'root';
$pass = 'root';
$db = 'mydish';
$conn = mysqli_connect($host, $user, $pass, $db);

if ($conn->connect_error) {
   die("La conexión ha fallado: " . $conn->connect_error);
} else {
   echo "Conectado con BBDD !";
   // fetching data from users
   $sql = 'SELECT NOMBRE,APELLIDO FROM usuarios';
   $result = mysqli_query($conn, $sql);
   if (mysqli_num_rows($result) > 0) {
      echo "<h3>DATOS DE LA TABLA USUARIOS</h3>";
      while ($row = mysqli_fetch_assoc($result)) {
         echo " <strong>Nombre:</strong> " . $row["NOMBRE"] . " <strong>Apellido:</strong> " . $row["APELLIDO"] . "<br>";
      }
   } else {
      echo "No hay resultado";
   }

   // fetching data from platos table
   $sql = 'SELECT NOMBRE_PLATO, PRECIO_PLATO FROM platos';
   $result = mysqli_query($conn, $sql);
   if (mysqli_num_rows($result) > 0) {
      echo "<h3>DATOS DE LA TABLA PLATOS</h3>";
      while ($row = mysqli_fetch_assoc($result)) {
         echo " <strong>Nombre Plato:</strong> " . $row["NOMBRE_PLATO"] . " <strong>Precio:</strong> " . $row["PRECIO_PLATO"] . "<br>";
      }
   } else {
      echo "No hay resultado";
   }

   // fetching data from pedidos table
   $sql = 'SELECT N_ID_PEDIDO, ID_CLIENTE_PEDIDO FROM pedidos';
   $result = mysqli_query($conn, $sql);
   if (mysqli_num_rows($result) > 0) {
      echo "<h3>DATOS DE LA TABLA PEDIDOS</h3>";
      while ($row = mysqli_fetch_assoc($result)) {
         echo " <strong>ID PEDIDO:</strong> " . $row["N_ID_PEDIDO"] . " <strong>ID_CLIENTE:</strong> " . $row["ID_CLIENTE_PEDIDO"] . "<br>";
      }
   } else {
      echo "No hay resultado";
   }

   // fetching data from linea_pedidos table
   $sql = 'SELECT N_ID_PEDIDO_LINEA_PEDIDO, N_ID_PLATO_LINEA_PEDIDO FROM linea_pedidos';
   $result = mysqli_query($conn, $sql);
   if (mysqli_num_rows($result) > 0) {
      echo "<h3>DATOS DE LA TABLA LINEA_PEDIDOS</h3>";
      while ($row = mysqli_fetch_assoc($result)) {
         echo " <strong>N_ID_PEDIDO_LINEA_PEDIDO :</strong> " . $row["N_ID_PEDIDO_LINEA_PEDIDO"] . " <strong>N_ID_PEDIDO_LINEA_PEDIDO:</strong> " . $row["N_ID_PLATO_LINEA_PEDIDO"] . "<br>";
      }
   } else {
      echo "No hay resultado";
   }
}

mysqli_close($conn);
