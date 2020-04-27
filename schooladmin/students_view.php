<?php

	$currDir=dirname(__FILE__);
	include("$currDir/defaultLang.php");
	include("$currDir/language.php");
	include("$currDir/lib.php");
	@include("$currDir/hooks/students.php");
	include("libs/db_connect.php");
	include_once("$currDir/header.php");

	// mm: can the current member access this page?
	$perm=getTablePermissions('students');
	if(!$perm[0]){
		echo error_message("Sorry! You don't have permission to access this table. Please contact the admin.", false);
		echo '<script>setTimeout("window.location=\'index.php?signOut=1\'", 2000);</script>';
		exit;
	}

?>

<!DOCTYPE html>
<html>
	<head>
		<title>Student Detail</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
	</head>
	<body data-gr-c-s-loaded="true">
	<div class="container theme-cosmo theme-compact">
		<div class="col-xs-12">
			<div class="page-header">
				<h1>
					<div class="row">
						<div class="col-sm-8">
							<a style="text-decoration: none; color: inherit;" href="students_view.php">
								<img src="resources/table_icons/group_add.png"> Students</a>
						</div>
					</div>	
				</h1>
			</div>
			<div id="top_buttons" class="hidden-print">
				<div class="btn-group btn-group-lg visible-md visible-lg all_records pull-left">
					<button class="btn btn-default" name="Add" onclick="myFunction()">
						<i class="glyphicon glyphicon-plus"></i>Add New
					</button>
					<button onclick="window.print()" type="submit" name="Print_x" id="Print" value="1" class="btn btn-default">
						<i class="glyphicon glyphicon-print"></i> Print Preview
					</button>			
					<button onclick="document.myform.NoDV.value=1; document.myform.SelectedID.value = ''; return true;" type="submit" name="NoFilter_x" id="NoFilter" value="1" class="btn btn-default">
							<i class="glyphicon glyphicon-remove-circle"></i> Show All
					</button>
				</div>
				<div class="col-xs-12" id="input_section" style="display: none;text-align: center;border:1px solid black;padding: 15px;">						
						<form action="students_insert.php" method="post">
							<div class="form-group row">
							    <label class="col-md-3">id:</label>
							    <div class="col-md-5">
							      <input type="number" name="id" class="form-control" placeholder="id"  required>
							    </div>
						    </div>
						    <div class="form-group row">
							    <label class="col-md-3">Password:</label>
							    <div class="col-md-5">
							      <input type="text" name="Password" class="form-control" placeholder="Password"  required>
							    </div>
    						</div>
    						<div class="form-group row">
							    <label class="col-md-3">Name:</label>
							    <div class="col-md-5">
							      <input type="text" name="FullName" class="form-control" placeholder="Name" required>
							    </div>
    						</div>
    						<div class="form-group row">
							    <label class="col-md-3">Gender:</label>
							    <div class="col-md-5">
							      <input type="text" name="Gender" class="form-control" placeholder="Gender" required>
							    </div>
    						</div>
    						<div class="form-group row">
							    <label class="col-md-3">DOB:</label>
							    <div class="col-md-5">
							      <input type="date" name="DOB" class="form-control" placeholder="DOB"  required>
							    </div>
    						</div>
    						<div class="form-group row">
							    <label class="col-md-3">RegNo:</label>
							    <div class="col-md-5">
							      <input type="text" name="RegNo" class="form-control" placeholder="RegNo"  required>
							    </div>
    						</div>
    						<div class="form-group row">
							    <label class="col-md-3">Class:</label>
							    <div class="col-md-5">
							      <input type="number" name="Class" class="form-control" placeholder="Class"  required>
							    </div>
    						</div>
    						<div class="form-group row">
							    <label class="col-md-3">Hobbies:</label>
							    <div class="col-md-5">
							      <input type="text" name="Hobbies" class="form-control" placeholder="Hobbies"  required>
							    </div>
    						</div>
    						<div class="form-group row">
							    <label class="col-md-3">DOJ</label>
							    <div class="col-md-5">
							      <input type="date" name="DOJ" class="form-control" placeholder="DOJ"  required>
							    </div>
    						</div>
    						<div class="form-group row">
							    <label class="col-md-3">Category:</label>
							    <div class="col-md-5">
							      <input type="text" name="Category" class="form-control" placeholder="Category" required>
							    </div>
    						</div>
    						<div class="form-group row">
							    <label class="col-md-3">AcademicYear:</label>
							    <div class="col-md-5">
							      <input type="number" name="AcademicYear" class="form-control" placeholder="AcademicYear" required>
							    </div>
    						</div>
    						<div class="form-group row">
							    <label class="col-md-3">TotalFees:</label>
							    <div class="col-md-5">
							      <input type="number" name="TotalFees" class="form-control" placeholder="TotalFees" required>
							    </div>
    						</div>
    						<div class="form-group row">
							    <label class="col-md-3">AdvanceFees:</label>
							    <div class="col-md-5">
							      <input type="number" name="AdvanceFees" class="form-control" placeholder="AdvanceFees" required>
							    </div>
    						</div><div class="form-group row">
							    <label class="col-md-3">Balance</label>
							    <div class="col-md-5">
							      <input type="number" name="Balance" class="form-control" placeholder="Balance"required>
							    </div>
    						</div>
    						<div class="form-group row">
							    <label class="col-md-3">Parent</label>
							    <div class="col-md-5">
							      <input type="number" name="Parent" class="form-control" placeholder="Parent" required>
							    </div>
    						</div>
								<button class="btn btn-default" type="submit" name="Add" >Submit</button>		
						</form>
					</div>
					<script type="text/javascript">
						function myFunction(){
							document.getElementById("input_section").style.display="block";
						}
					</script>
				<div class="clearfix"></div>
			</div>
			<p></p>
		</div>
		<div class="row">
			<div class="table_view col-xs-12 ">
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<tr>
							<th style="width: 18px;" class="text-center">
								<input class="hidden-print" type="checkbox" title="Select all records" id="select_all_records">
							</th>
							<th><a class="TableHeader">id</a></th>
							<th><a class="TableHeader">Password</a></th>
							<th><a class="TableHeader">FullName</a></th>
							<th><a class="TableHeader">Gender</a></th>
							<th><a class="TableHeader">DOB</a></th>
							<th><a class="TableHeader">RegNo</a></th>
							<th><a class="TableHeader">Class</a></th>
							<th><a class="TableHeader">Hobbies</a></th>
							<th><a class="TableHeader">DOJ</a></th>
							<th><a class="TableHeader">Category</a></th>
							<th><a class="TableHeader">AcademicYear</a></th>
							<th><a class="TableHeader">TotalFees</a></th>
							<th><a class="TableHeader">AdvanceFees</a></th>
							<th><a class="TableHeader">Balance</a></th>
							<th><a class="TableHeader">Parent</a></th>
							<th><a class="TableHeader">Action</a></th>
						</tr>
						<?php
							$sql = "SELECT * FROM students";
							$result = $con->query($sql);

							if ($result->num_rows > 0) {
							   	while($row = $result->fetch_assoc()) {
						?>
						<tr>
							<td class="text-center">
								<input class="hidden-print record_selector" type="checkbox" id="record_selector_0" name="record_selector[]" value="0">
							</td>
							<td><?php echo  $row["id"];?></td>
							<td><?php echo  $row["Password"];?></td>
							<td><?php echo  $row["FullName"];?></td>
					        <td><?php echo  $row["Gender"];?></td>
					        <td><?php echo  $row["DOB"];?></td>
					        <td><?php echo  $row["RegNo"];?></td>
							<td><?php echo  $row["Class"];?></td>
					        <td><?php echo  $row["Hobbies"];?></td>
						    <td><?php echo  $row["DOJ"];?></td>
							<td><?php echo  $row["Category"];?></td>
						    <td><?php echo  $row["AcademicYear"];?></td>
						    <td><?php echo  $row["TotalFees"];?></td>
					        <td><?php echo  $row["AdvanceFees"];?></td>
					        <td><?php echo  $row["Balance"];?></td>
							<td><?php echo  $row["Parent"];?></td>
							<td>
		                        <a name="del" href="students_insert.php?del=<?php echo $row['id']; ?>" class="btn btn-default">Delete</a>
							</td>
						</tr>
						<?php
							    }
							   	}
						?>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>