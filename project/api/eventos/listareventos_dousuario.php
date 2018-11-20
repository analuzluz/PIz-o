<?php 
session_start();

if(!$_SESSION['login']) die("não está logado");

try {
	$bd = include "../pdo.php";
	$md = $bd -> prepare("SELECT id_evento, endereco,  FROM evento WHERE id_usuario=:id");
	$md->execute([
		"id" => $_SESSION['id']
	]);
	$resultado = $md->fetch(PDO::FETCH_ASSOC);
	echo json_encode($resultado);
} catch (Exception $e) {
     echo "oh meu kirido faz direito e não esquerdo" . $e->getMessage();
}
// $bd:  é conexão com o banco de dados 
// $md: manipulador de declaração

// $strRecebido = file_get_contents('php://input');
// $objRecebido = json_decode($strRecebido);
