<script type='text/javascript'>
	function notEmpty(elem){
		if(elem.value.length == 0){
			return false;
		}
		return true;
	}

	function isNumeric(elem){
		var numericExpression = /^[0-9]+$/;
		if(elem.value.match(numericExpression)){
			return true;
		} else {
			return false;
		}
	}

	function isAlphabet(elem){
        var alphaExp = /^[a-zA-Z0-9\u00A1-\uFFFF\_ .-@]+$/;
        if(elem.value.match(alphaExp)){
            return true;
        } else {
            return false;
        }
    }

    function isAlphanumeric(elem){
        var alphaExp = /^[a-zA-Z0-9\u00A1-\uFFFF\_ .-@]+$/;
        if(elem.value.match(alphaExp) && !isNumeric(elem)){
            return true;
        } else {
            return false;
        }
    }

	function isFloat(elem){
   		if(elem.value.indexOf(".") < 0){
     		return false;
   		} else {
      		if(parseFloat(elem.value)) {
              return true;
          	} else {
              return false;
          	}
   		}
	}

	function taskFormValidator() {
		var i=0;
		var myInputs = new Array();
					myInputs[i] = document.getElementById("bagId");
					i++;
					myInputs[i] = document.getElementById("resubmit");
					i++;
					myInputs[i] = document.getElementById("bagExists");
					i++;
					myInputs[i] = document.getElementById("bagRequestBody");
					i++;
					myInputs[i] = document.getElementById("bagExistsRequestResponse");
					i++;
					myInputs[i] = document.getElementById("doInventory");
					i++;
					myInputs[i] = document.getElementById("doMalwareScan");
					i++;
					myInputs[i] = document.getElementById("doBagInPlace");
					i++;
					myInputs[i] = document.getElementById("doVerify");
					i++;
					myInputs[i] = document.getElementById("doWriteBagInfo");
					i++;
					myInputs[i] = document.getElementById("doCopy");
					i++;
					myInputs[i] = document.getElementById("doExport");
					i++;
					myInputs[i] = document.getElementById("doDeleteFromStaging");
					i++;
					myInputs[i] = document.getElementById("numberOfCopies");
					i++;
					myInputs[i] = document.getElementById("hostServer");
					i++;


		var j=0;
						if(notEmpty(myInputs[j]) && !isAlphanumeric(myInputs[j])) {
							alert("Please enter valid bagId");
							myInputs[j].focus();
							return false;
						}
					j++;
						if(notEmpty(myInputs[j]) && !isAlphanumeric(myInputs[j])) {
							alert("Please enter valid resubmit");
							myInputs[j].focus();
							return false;
						}
					j++;
						if(notEmpty(myInputs[j]) && !isAlphanumeric(myInputs[j])) {
							alert("Please enter valid bagExists");
							myInputs[j].focus();
							return false;
						}
					j++;
						if(notEmpty(myInputs[j]) && !isAlphanumeric(myInputs[j])) {
							alert("Please enter valid bagRequestBody");
							myInputs[j].focus();
							return false;
						}
					j++;
						if(notEmpty(myInputs[j]) && !isAlphanumeric(myInputs[j])) {
							alert("Please enter valid bagExistsRequestResponse");
							myInputs[j].focus();
							return false;
						}
					j++;
						if(notEmpty(myInputs[j]) && !isAlphanumeric(myInputs[j])) {
							alert("Please enter valid doInventory");
							myInputs[j].focus();
							return false;
						}
					j++;
						if(notEmpty(myInputs[j]) && !isAlphanumeric(myInputs[j])) {
							alert("Please enter valid doMalwareScan");
							myInputs[j].focus();
							return false;
						}
					j++;
						if(notEmpty(myInputs[j]) && !isAlphanumeric(myInputs[j])) {
							alert("Please enter valid doBagInPlace");
							myInputs[j].focus();
							return false;
						}
					j++;
						if(notEmpty(myInputs[j]) && !isAlphanumeric(myInputs[j])) {
							alert("Please enter valid doVerify");
							myInputs[j].focus();
							return false;
						}
					j++;
						if(notEmpty(myInputs[j]) && !isAlphanumeric(myInputs[j])) {
							alert("Please enter valid doWriteBagInfo");
							myInputs[j].focus();
							return false;
						}
					j++;
						if(notEmpty(myInputs[j]) && !isAlphanumeric(myInputs[j])) {
							alert("Please enter valid doCopy");
							myInputs[j].focus();
							return false;
						}
					j++;
						if(notEmpty(myInputs[j]) && !isAlphanumeric(myInputs[j])) {
							alert("Please enter valid doExport");
							myInputs[j].focus();
							return false;
						}
					j++;
						if(notEmpty(myInputs[j]) && !isAlphanumeric(myInputs[j])) {
							alert("Please enter valid doDeleteFromStaging");
							myInputs[j].focus();
							return false;
						}
					j++;
						if(notEmpty(myInputs[j]) && !isNumeric(myInputs[j])) {
							alert("Please enter valid numberOfCopies");
							myInputs[j].focus();
							return false;
						}
					j++;
					    if(notEmpty(myInputs[j]) && !isAlphanumeric(myInputs[j])) {
							alert("Please enter valid hostServer");
							myInputs[j].focus();
							return false;
						}
					j++;

		return true;
	}
</script>
<style type="text/css">
	#container
	{
		margin: 0 auto;
		width: 600px;
		background:#fff;
	}

	#header
	{
		background: #ccc;
		padding: 20px;
		font-family:Arial, Helvetica, sans-serif;
		font-size: 125%;
		letter-spacing: -1px;
		font-weight: bold;
		line-height: 1.1;
		color:#666;
	}

	#header h1 { margin: 0; }

	#content
	{
		clear: left;
		padding: 20px;
	}

	#content h2
	{
		color: #000;
		font-size: 160%;
		margin: 0 0 .5em;
	}

	#footer
	{
		background: #ccc;
		text-align: right;
		padding: 20px;
		height: 1%;
	}

	fieldset {
		border:1px dashed #CCC;
		padding:10px;
		margin-top:20px;
		margin-bottom:20px;
	}
	legend {
		font-family:Arial, Helvetica, sans-serif;
		font-size: 90%;
		letter-spacing: -1px;
		font-weight: bold;
		line-height: 1.1;
		color:#fff;
		background: #666;
		border: 1px solid #333;
		padding: 2px 6px;
	}
	.form {
		margin:0;
		padding:0;
	}
	label {
		width:140px;
		height:32px;
		margin-top:3px;
		margin-right:2px;
		padding-top:11px;
		padding-left:6px;
		background-color:#CCCCCC;
		float:left;
		display: block;
		font-family:Arial, Helvetica, sans-serif;
		font-size: 115%;
		letter-spacing: -1px;
		font-weight: normal;
		line-height: 1.1;
		color:#666;
	}
	.div_texbox {
		width:347px;
		float:right;
		background-color:#E6E6E6;
		height:35px;
		margin-top:3px;
		padding-top:5px;
		padding-bottom:3px;
		padding-left:5px;
	}
	.div_checkbox {
		width:347px;
		float:right;
		background-color:#E6E6E6;
		height:35px;
		margin-top:3px;
		padding-top:5px;
		padding-bottom:3px;
		padding-left:5px;
	}
	.textbox {
		background-color:#FFFFFF;
		background-repeat: no-repeat;
		background-position:left;
		width:285px;
		font:normal 18px Arial;
		color: #999999;
		padding:3px 5px 3px 19px;
	}
	.checkbox {
		background-color:#FFFFFF;
		background-repeat: no-repeat;
		background-position:left;
		width:285px;
		font:normal 18px Arial;
		color: #999999;
		padding:3px 5px 3px 19px;
	}
	.textbox:focus, .textbox:hover {
		background-color:#F0FFE6;
	}
	.button_div {
		width:287px;
		float:right;
		background-color:#fff;
		border:1px solid #ccc;
		text-align:right;
		height:35px;
		margin-top:3px;
		padding:5px 32px 3px;
	}
	.buttons {
		background: #e3e3db;
		font-size:12px; 
		color: #989070; 
		padding: 6px 14px;
		border-width: 2px;
		border-style: solid;
		border-color: #fff #d8d8d0 #d8d8d0 #fff;
		text-decoration: none;
		text-transform:uppercase;
		font-weight:bold;
	}
</style>
<div id="container">
	<div id="header">
		New Process Instance: /Workflow/src/main/resources/loc/gov/workflow.receivecontent
	</div>
	<div id="content">
	    <input type="hidden" name="processId" value="${process.id}"/>
		<fieldset>
            <legend>Process inputs</legend>
                            		<label for="name">bagId</label>
                            		<div class="div_texbox">
                              		<input name="bagId" type="text" class="textbox" id="bagId" value="" />
                            		</div>
              	
                            		<label for="name">resubmit</label>
                            		<div class="div_checkbox">
                              		<input name="resubmit" type="checkbox" class="checkbox" id="resubmit" value="true" />
                            		</div>
              	
                            		<label for="name">bagExists</label>
                            		<div class="div_texbox">
                              		<input name="bagExists" type="text" class="textbox" id="bagExists" value="" />
                            		</div>
              	
                            		<label for="name">bagRequestBody</label>
                            		<div class="div_texbox">
                              		<input name="bagRequestBody" type="text" class="textbox" id="bagRequestBody" value="" />
                            		</div>
              	
                            		<label for="name">bagExistsRequestResponse</label>
                            		<div class="div_texbox">
                              		<input name="bagExistsRequestResponse" type="text" class="textbox" id="bagExistsRequestResponse" value="" />
                            		</div>
              	
                            		<label for="name">doInventory</label>
                            		<div class="div_checkbox">
                              		<input name="doInventory" type="checkbox" class="checkbox" id="doInventory" value="true" />
                            		</div>
              	
                            		<label for="name">doMalwareScan</label>
                            		<div class="div_checkbox">
                              		<input name="doMalwareScan" type="checkbox" class="checkbox" id="doMalwareScan" value="true" />
                            		</div>
              	
                            		<label for="name">doBagInPlace</label>
                            		<div class="div_checkbox">
                              		<input name="doBagInPlace" type="checkbox" class="checkbox" id="doBagInPlace" value="true" />
                            		</div>
              	
                            		<label for="name">doVerify</label>
                            		<div class="div_checkbox">
                              		<input name="doVerify" type="checkbox" class="checkbox" id="doVerify" value="true" />
                            		</div>
              	
                            		<label for="name">doWriteBagInfo</label>
                            		<div class="div_checkbox">
                              		<input name="doWriteBagInfo" type="checkbox" class="checkbox" id="doWriteBagInfo" value="true" />
                            		</div>
              	
                            		<label for="name">doCopy</label>
                            		<div class="div_checkbox">
                              		<input name="doCopy" type="checkbox" class="checkbox" id="doCopy" value="true" />
                            		</div>
              	
                            		<label for="name">doExport</label>
                            		<div class="div_checkbox">
                              		<input name="doExport" type="checkbox" class="checkbox" id="doExport" value="true" />
                            		</div>
              	
                            		<label for="name">doDeleteFromStaging</label>
                            		<div class="div_checkbox">
                              		<input name="doDeleteFromStaging" type="checkbox" class="checkbox" id="doDeleteFromStaging" value="true" />
                            		</div>
              	
                            		<label for="name">numberOfCopies</label>
                            		<div class="div_texbox">
                              		<input name="numberOfCopies" type="text" class="textbox" id="numberOfCopies" value="" />
                            		</div>
                            		
                            		<label for="name">hostServer</label>
                            		<div class="div_texbox">
                              		<input name="hostServer" type="text" class="textbox" id="hostServer" value="" />
                            		</div>
              	

          </fieldset>
	</div>
	<div id="footer">
	</div>
</div>