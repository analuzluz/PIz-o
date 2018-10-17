<?php 

try {
	$bd = include "../pdo.php";
	$md = $bd -> prepare("SELECT id_classificacao_idade, idade FROM classificacao_idade ");
	$md->execute();
	$resultado = $md->fetchAll(PDO::FETCH_ASSOC);
	echo json_encode($resultado);
} catch (Exception $e) {
     echo "oh meu kirido faz direito e não esquerdo" . $e->getMessage();
}
// $bd:  é conexão com o banco de dados 
// $md: manipulador de declaração

// $strRecebido = file_get_contents('php://input');
// $objRecebido = json_decode($strRecebido);