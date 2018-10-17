<?php

   session_start();
   echo json_encode( isset($_SESSION['login']) && !empty($_SESSION['login']) );

$objRecebido = (object)$_POST;

$mensagemDeErro=[];

// ---------------------------------------------------------------------------------------

if(!is_object($objRecebido))  
	die("os dados enviados para o servidor não é um objeto válido");

// ---------------------------------------------------------------------------------------

if(!property_exists($objRecebido,'nome') || empty($objRecebido->nome))
	$mensagemDeErro[] ="nome não pode ser vazio";

if(!property_exists($objRecebido,'email') || empty($objRecebido->email))
	$mensagemDeErro[] ="email não pode ser vazio";

if(!property_exists($objRecebido,'senha') || empty($objRecebido->senha))
	$mensagemDeErro[] ="senha não pode ser vazio";

if(!property_exists($objRecebido,'confirmarsenha') || empty($objRecebido->confirmarsenha))
	$mensagemDeErro[] ="confirmação de senha não pode ser vazio";

if($objRecebido->confirmarsenha !== $objRecebido->senha)
	$mensagemDeErro[] ="senha e confirmação não são as mesmas";

if(!property_exists($objRecebido,'telefone') || empty($objRecebido->telefone))
	$mensagemDeErro[] ="telefone não pode ser vazio";

if(!property_exists($objRecebido,'endereco') || empty($objRecebido->endereco))
	$mensagemDeErro[] ="endereco não pode ser vazio";

if(!property_exists($objRecebido,'dataNasc') || empty($objRecebido->dataNasc))
	$mensagemDeErro[] ="data não pode ser vazio";

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