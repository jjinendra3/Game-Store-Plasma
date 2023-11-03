<?php
session_start();
if(isset($_POST['username'])&&isset($_POST['pwd'])){
    $username=$_POST['username'];
    $pwd = $_POST['pwd'];
    include "connectDB.php";
    $sql="SELECT Password FROM USERS WHERE UserName='$username';";
    $result=mysqli_connect($sql);
    if(!$result || $pwd!=$result){
        echo "Wrong Username please try again!";
        die;
    }
    header("Location:index.php");
        
    }else{
        echo '<span style="color: red;">Login Fail</span>';
        header("Location:login.php?errcode=1");
    }
     
}
?>