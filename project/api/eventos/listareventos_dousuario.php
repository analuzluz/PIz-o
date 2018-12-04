<?php 
session_start();

if(!$_SESSION['login']) die("não está logado");

try {
	$bd = include "../pdo.php";
	print_r($_SESSION);
	echo '1';
	$md = $bd -> prepare("SELECT e.id_evento, e.logradoro FROM evento e
							 INNER JOIN usuario u 
							 	ON e.usuario_id_usuario = u.id_usuario 
							 		WHERE u.id_usuario=:id");
	$md->bindParam('id', $_SESSION['id']);
	$md->execute();
	$resultado = $md->fetchAll(PDO::FETCH_ASSOC);
	echo json_encode($resultado);
} catch (Exception $e) {
     $arrayName = array('Mensagem', "oh meu kirido faz direito e não esquerdo");  
}
	// echo  json_encode($arrayName);
// $bd:  é conexão com o banco de dados 
// $md: manipulador de declaração

// $strRecebido = file_get_contents('php://input');
// $objRecebido = json_decode($strRecebido);
