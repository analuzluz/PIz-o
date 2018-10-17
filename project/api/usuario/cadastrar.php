 <?php 

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

// if(!property_exists($objRecebido,'confirmarsenha') || empty($objRecebido->confirmarsenha))
	// $mensagemDeErro[] ="confirmação de senha não pode ser vazio";

if(!property_exists($objRecebido,'telefone') || empty($objRecebido->telefone))
	$mensagemDeErro[] ="telefone não pode ser vazio";

if(!property_exists($objRecebido,'datanasc') || empty($objRecebido->datanasc))
	$mensagemDeErro[] ="data não pode ser vazio";

// ---------------------------------------------------------------------------------------

if(!empty($mensagemDeErro))
	die(implode("\n",$mensagemDeErro)); 

// ---------------------------------------------------------------------------------------

try {
	$bd = include "../pdo.php";
	$md = $bd -> prepare("INSERT INTO usuario(nome, telefone, datanasc, email,  senha) VALUES(:nome,:telefone,:datanasc,:email,:senha)");
	$md->execute([
		'nome' => $objRecebido->nome,
		'telefone' => $objRecebido->telefone,
		'datanasc' => $objRecebido->datanasc,
		'email' => $objRecebido->email,
		'senha' => $objRecebido->senha
	]);

	echo "cadastro efetuado";
} catch (Exception $e) {
     echo "oh meu kirido faz direito e não esquerdo" . $e->getMessage();
}
// $bd:  é conexão com o banco de dados 
// $md: manipulador de declaração

// $strRecebido = file_get_contents('php://input');
// $objRecebido = json_decode($strRecebido);