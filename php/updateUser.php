<?php

  require('configUser.php');

    $id_clientes = $_POST['id_clientes'];
    $nome_clientes = $_POST['nome_clientes'];
    $cpf_clientes = $_POST['cpf_clientes'];
    $email_clientes = $_POST['email_clientes'];
    $cep_clientes = $_POST['cep_clientes'];

    //do something
    $insert = $conn->query("UPDATE clientes SET 
    nome_clientes ='$nome_clientes', 
    cpf_clientes ='$cpf_clientes', 
    email_clientes ='$email_clientes', 
    cep_clientes ='$cep_clientes' WHERE id_clientes =  '$id_clientes'
      ");
        if ($insert){
            echo "Success";
        }
        $conn->close();
        return;
 ?>