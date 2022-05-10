<?php

    require('config.php');

    $id_itens = $_POST['id_itens'];

    $delete = $conn->query("DELETE FROM itens WHERE id_itens =  '$id_itens'");
        if ($delete){
            echo "Success";
        }
        $conn->close();
        return;
        