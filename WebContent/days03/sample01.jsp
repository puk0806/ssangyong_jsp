<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.alert {
  padding: 20px;
  background-color: #f44336;
  color: white;
  opacity: 1;
  transition: opacity 0.6s;
  margin-bottom: 15px;
}

.alert.success {background-color: #4CAF50;}
.alert.info {background-color: #2196F3;}
.alert.warning {background-color: #ff9800;}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}
</style>
</head>
<body>

<h2>Alert Messages</h2>
<p>Click on the "x" symbol to close the alert message.</p>
<div class="alert">
  <span class="closebtn">&times;</span>  
  <strong>Danger!</strong> Indicates a dangerous or potentially negative action.
</div>

<div class="alert success">
  <span class="closebtn">&times;</span>  
  <strong>Success!</strong> Indicates a successful or positive action.
</div>

<div class="alert info">
  <span class="closebtn">&times;</span>  
  <strong>Info!</strong> Indicates a neutral informative change or action.
</div>

<div class="alert warning">
  <span class="closebtn">&times;</span>  
  <strong>Warning!</strong> Indicates a warning that might need attention.
</div>

<script>
var close = document.getElementsByClassName("closebtn");
var i;

for (i = 0; i < close.length; i++) {
  close[i].onclick = function(){
    var div = this.parentElement;
    div.style.opacity = "0";
    setTimeout(function(){ div.style.display = "none"; }, 600);
  }
}
</script>

</body>
</html>

