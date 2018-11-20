<?php 

//$mensagemDeErro=[];
//
//if(!is_object($objRecebido))  
//	die("os dados enviados para o servidor não é um objeto válido");
//
//if(!empty($mensagemDeErro))
//	die(implode("\n",$mensagemDeErro)); 

try {
	$bd = include "../pdo.php";
	$md = $bd -> prepare("SELECT nome_cidade, logradoro, numero FROM evento LEFT JOIN cidade ON evento.id_cidade=cidade.id_cidade");
	$md->execute([]);

	$resultado = $md->fetchAll(PDO::FETCH_ASSOC);
	echo json_encode($resultado);
} catch (Exception $e) {
     echo "oh meu kirido faz direito e não esquerdo" . $e->getMessage();
}