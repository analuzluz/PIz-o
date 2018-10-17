<?php 
session_start();

if(!$_SESSION['login']) die("não está logado");

try {
	$bd = include "../pdo.php";
	$md = $bd -> prepare("SELECT nome, telefone, email, datanasc FROM usuario WHERE email=:login");
	$md->execute([
		"login" => $_SESSION['login']
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
