<?php 

session_start();
  echo json_encode( isset($_SESSION['login']) && !empty($_SESSION['login']) );

try {
	$bd = include "../pdo.php";
	$md = $bd -> prepare("SELECT * WHERE usuario_id_usuario=:usuario FROM evento");

	$md->execute([
		'usuario' =>$_SESSION['login']
	]);
	$resultado = $md->fetchAll(PDO::FETCH_ASSOC);
	echo json_encode($resultado);
	}
} catch (Exception $e) {
     echo "oh meu kirido faz direito e não esquerdo" . $e->getMessage();
}
