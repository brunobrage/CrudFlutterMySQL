<?php

    require('configUser.php');

    $result = $conn->query("SELECT * FROM clientes ORDER BY nome_clientes");
    $data = array();
    while ( $row = $result -> fetch_assoc()){
        $data[] = $row;
    }
    echo json_encode($data);
    $conn -> close();
    return;
    ?>