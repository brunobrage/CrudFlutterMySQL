<?php

require('config.php');

$id_itens = $_POST['id_itens'];
$nome_itens = $_POST['nome_itens'];
$itens_sku = $_POST['itens_sku'];
$itens_descricao = $_POST['itens_descricao'];
$itens_valor = $_POST['itens_valor'];
$itens_quantidade = $_POST['itens_quantidade'];

    //do something
    $insert = $conn->query("UPDATE itens SET 
    nome_itens ='$nome_itens', 
    itens_sku ='$itens_sku', 
    itens_descricao ='$itens_descricao', 
    itens_valor ='$itens_valor', 
    itens_quantidade ='$itens_quantidade' WHERE id_itens =  '$id_itens'
      ");
        if ($insert){
            echo "Success";
        }
        $conn->close();
        return;
 ?>