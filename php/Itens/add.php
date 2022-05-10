<?php

    require('config.php');

    $id_itens = $_POST['id_itens'];
    $nome_itens = $_POST['nome_itens'];
    $itens_sku = $_POST['itens_sku'];
    $itens_descricao = $_POST['itens_descricao'];
    $itens_valor = $_POST['itens_valor'];
    $itens_quantidade = $_POST['itens_quantidade'];
    
    $insert = $conn->query("INSERT INTO itens(nome_itens,itens_sku,itens_descricao,
    itens_valor,itens_quantidade) VALUES(
        '$nome_itens',
        '$itens_sku',
        '$itens_descricao',
        '$itens_valor',
        '$itens_quantidade')");
        if ($insert){
            echo "Success";
        }
        $conn->close();
        return;
        ?>