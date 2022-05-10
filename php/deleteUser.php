<?php

    require('configUser.php');

    $id_clientes = $_POST['id_clientes'];

    $delete = $conn->query("DELETE FROM clientes WHERE id_clientes =  '$id_clientes'");
        if ($delete){
            echo "Success";
        }
        $conn->close();
        return;