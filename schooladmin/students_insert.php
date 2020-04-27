<?php
	include("libs/db_connect.php");

	if(isset($_POST['Add'])){

		$id = $_POST['id'];
		$Password = $_POST['Password'];
		$FullName = $_POST['FullName'];
		$Gender = $_POST['Gender'];
		$DOB = $_POST['DOB'];
		$RegNo = $_POST['RegNo'];
		$Class = $_POST['Class'];
		$Hobbies = $_POST['Hobbies'];
		$DOJ = $_POST['DOJ'];
		$Category = $_POST['Category'];
		$AcademicYear = $_POST['AcademicYear'];
		$TotalFees = $_POST['TotalFees'];
		$AdvanceFees = $_POST['AdvanceFees'];
		$Balance = $_POST['Balance'];
		$Parent = $_POST['Parent'];

		$sql = "INSERT INTO students (id,Password,FullName,Gender,DOB,RegNo,Class,Hobbies,DOJ,Category,AcademicYear,TotalFees,AdvanceFees,Balance,Parent) VALUES ('$id', '$Password', '$FullName','$Gender','$DOB','$RegNo','$Class','$Hobbies','$DOJ','$Category','$AcademicYear','$TotalFees','$AdvanceFees','$Balance','$Parent')";
		
		mysqli_query($con, $sql);
    	header("Location: students_view.php");

	}
	
	if (isset($_GET['del'])) {

		$id = $_GET['del'];
		$sql="DELETE FROM students WHERE id=$id";

		mysqli_query($con, $sql); 
		header('location: students_view.php');
	}

?>