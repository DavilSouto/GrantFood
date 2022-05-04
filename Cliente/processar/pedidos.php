<?php
include('../config/db.php');
session_start();
// Report all PHP errors
error_reporting(E_ALL);
            
if(isset($_POST['update'])){

         $mesa =    $_SESSION['mesa'];
         $total =    $_POST['total'];
         
                        
                        $sql = "SELECT * FROM sistema";

                        $gotResuslts = mysqli_query($connection,$sql);
                        if($gotResuslts){
                            if(mysqli_num_rows($gotResuslts)>0){
                                $row = mysqli_fetch_array($gotResuslts);
                                $pedidos = $row['pedidos'];
                                $numero = $pedidos+1;

                                $sql = "UPDATE sistema SET pedidos = $numero WHERE id = 1";
                               $results = mysqli_query($connection, $sql);

                                

    
        if(!empty($mesa) && !empty($total)){
                
            $chave = $_SESSION['chave'];
            $sql1 = "INSERT INTO pedidos (sessao, mesa, preco, numero, data) VALUES ('$chave', '$mesa', '$total', '$numero', NOW())";
            $results1 = mysqli_query($connection, $sql1);
            
               foreach($_SESSION["shopping_cart"] as $keys => $values)
                         {
                              $item_nome = $values["item_name"];
                              $item_quantity = $values["item_quantity"];
                              $item_price = $values["item_price"];
                              $item_total = $values["item_quantity"] * $values["item_price"];
                              $item_id = $values["item_id"];

               $sql2 = "INSERT INTO pedidoitens (mesa, codPedido, sessao, item, quantidade, preco, total, codItem) VALUES ('$mesa', '$numero','$chave', '$item_nome', '$item_quantity', '$item_price', '$item_total', '$item_id')";    
               $results1 = mysqli_query($connection, $sql2);     
                    }

               unset($_SESSION["shopping_cart"]);
     
               header('Location: ../pedidos.php?success=pedidoFeito');
                    
                    
                 }else{
                    header('Location:../index.php?error=Campos');
            exit;
                 }
               }
          }
       }


?>