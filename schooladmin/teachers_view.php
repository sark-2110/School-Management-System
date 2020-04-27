<?php
	$currDir=dirname(__FILE__);
	include("$currDir/defaultLang.php");
	include("$currDir/language.php");
	include("$currDir/lib.php");
	@include("$currDir/hooks/teachers.php");
	include("libs/db_connect.php");
	include_once("$currDir/header.php");

	// mm: can the current member access this page?
	$perm=getTablePermissions('teachers');
	if(!$perm[0]){
		echo error_message($Translation['tableAccessDenied'], false);
		echo '<script>setTimeout("window.location=\'index.php?signOut=1\'", 2000);</script>';
		exit;
	}
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Fees Collection</title>
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
								<img src="resources/table_icons/blackboard_steps.png">Teachers
							</a>
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
							<th><a class="TableHeader">Name</a></th>
							<th><a class="TableHeader">Gender</a></th>
							<th><a class="TableHeader">Age</a></th>
							<th><a class="TableHeader">Phone</a></th>
							<th><a class="TableHeader">Email</a></th>
							<th><a class="TableHeader">StaffNumber</a></th>
						</tr>
					<?php
						$sql = "SELECT * FROM teachers";
						$result = $con->query($sql);

						if ($result->num_rows > 0) {
						   	while($row = $result->fetch_assoc()) {
					?>
					<tr>
						<td class="text-center">
						    <input class="hidden-print record_selector" type="checkbox" id="record_selector_0" name="record_selector[]" value="0">
						</td>
						<td><?php echo  $row["id"];?></td>
						<td><?php echo  $row["Name"];?></td>
				        <td><?php echo  $row["Gender"];?></td>
				        <td><?php echo  $row["Age"];?></td>
				        <td><?php echo  $row["Phone"];?></td>
				        <td><?php echo  $row["Email"];?></td>
				        <td><?php echo  $row["StaffNumber"];?></td>
				    </tr>
					<?php
						    }
						   	}
					?>
				</table>
			</div>
		</div>
	</body>
</html>