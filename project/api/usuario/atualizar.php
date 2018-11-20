<?php

   session_start();
   echo json_encode( isset($_SESSION['login']) && !empty($_SESSION['login']) );

$objRecebido = (object)$_POST;

$mensagemDeErro=[];

// ---------------------------------------------------------------------------------------

if(!is_object($objRecebido))  
	die("os dados enviados para o servidor não é um objeto válido");

// ---------------------------------------------------------------------------------------

if(!empty($mensagemDeErro))
	die(implode("\n",$mensagemDeErro)); 

// ---------------------------------------------------------------------------------------

try {
	$bd = include "../pdo.php";
	$md = $bd -> prepare("UPDATE usuario SET nome=:nome,telefone=:telefone,dataNasc=:dataNasc,email=:email,senha=:senha  ");
	if(!empty($objRecebido->senha)){
		$md->execute([
			'nome' => $objRecebido->nome,
			'telefone' => $objRecebido->telefone,
			'dataNasc' => $objRecebido->dataNasc,
			'email' => $objRecebido->email,
			'senha' => $objRecebido->senha
		]);
	}

	echo "informações de usuario atualizadas";
	}
} catch (Exception $e) {
     echo "Houve algum erro " . $e->getMessage();
}