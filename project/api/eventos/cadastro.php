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
	$mensagemDeErro[] ="nome do evento não pode ser vazio";

// // if(!property_exists($objRecebido,'tipoEve') || empty($objRecebido->tipoEve))
// // 	$mensagemDeErro[] ="Nenhuma categoria foi selecionada";

// // if(!property_exists($objRecebido,'Classind') || empty($objRecebido->Classind))
// // 	$mensagemDeErro[] ="Nenhuma opção foi selecionada";

// // if(!property_exists($objRecebido,'telefone') || empty($objRecebido->telefone))
// // 	$mensagemDeErro[] ="telefone não pode ser vazio";

// // if(!property_exists($objRecebido,'endereco') || empty($objRecebido->endereco))
// // 	$mensagemDeErro[] ="endereco não pode ser vazio";

// if(!property_exists($objRecebido,'cidade') || empty($objRecebido->cidade))
// 	$mensagemDeErro[] ="Nenhuma opção foi selecionada";

// ---------------------------------------------------------------------------------------

if(!empty($mensagemDeErro))
	die(implode("\n",$mensagemDeErro)); 

// ---------------------------------------------------------------------------------------

try {
	$bd = include "../pdo.php";
	$md = $bd -> prepare("
			INSERT INTO evento(nome_evento , descricao_evento , usuario_id_usuario , tipo_evento_id_tipo_evento , classificacao_idade_id_classificacao_idade , id_cidade , logradoro , numero , telefone, data) 
			VALUES            (:nome_evento, :descricao_evento, :usuario_id_usuario, :tipo_evento_id_tipo_evento, :classificacao_idade_id_classificacao_idade, :id_cidade, :logradoro, :numero, :telefone, :data)");
	$md->execute([
		'nome_evento' => $objRecebido->nome,
		'tipo_evento_id_tipo_evento' => $objRecebido->tipoEve,
		'id_cidade' => $objRecebido->cidade,
		'classificacao_idade_id_classificacao_idade' => $objRecebido->Classind,
		'telefone' => $objRecebido->telefone,
		'logradoro' => $objRecebido->logradoro,
		'numero' => $objRecebido->numero,
		'usuario_id_usuario' => 1,
		'data' => $objRecebido ->data,
		'descricao_evento' => $objRecebido->descricao
	]);

	echo "evento criado";
} catch (Exception $e) {
     echo "oh meu kirido faz direito e não esquerdo" . $e->getMessage();
}
// $bd:  é conexão com o banco de dados 
// $md: manipulador de declaração

// $strRecebido = file_get_contents('php://input');
// $objRecebido = json_decode($strRecebido);