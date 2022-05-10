<?php

    require('configUser.php');

    $id_clientes = $_POST['id_clientes'];
    $nome_clientes = $_POST['nome_clientes'];
    $cpf_clientes = $_POST['cpf_clientes'];
    $email_clientes = $_POST['email_clientes'];
    $cep_clientes = $_POST['cep_clientes'];
    
    $insert = $conn->query("INSERT INTO clientes(nome_clientes, cpf_clientes, email_clientes,
    cep_clientes) VALUES(
        '$nome_clientes',
        '$cpf_clientes',
        '$email_clientes',
        '$cep_clientes')");
        if ($insert){
            echo "Success";
        }
        $conn->close();
        return;
        ?>