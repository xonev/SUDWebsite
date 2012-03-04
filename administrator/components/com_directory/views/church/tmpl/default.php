<?php
/**
 * The default church editing template.
 * @version $Id: default.php 221 2009-03-27 05:24:05Z adventi4 $
 * @package Joomla
 * @subpackage Directory
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );
?>
<script type="text/javascript">
	function getMethods(obj) {
	  var result = [];
	  for (var id in obj) {
		try {
		  if (typeof(obj[id]) == "function") {
			result.push(id + ": " + obj[id].toString());
		  }
		} catch (err) {
		  result.push(id + ": inaccessible");
		}
	  }
	  return result;
	}

	function conferenceInput(button, selectbox, textbox) {
		try {
			this.toggleButton = button;
			this.selectBox = selectbox;
			this.textBox = textbox;
			this.newConference = true;
		}
		catch (error) {
			alert(error);
		}
	}

	conferenceInput.prototype.removeTextBox = function () {
		this.textBox.remove();
	}

	function toggleInput () {
		if ( this.newConference ) {
			this.newConference = false;
			this.toggleButton.setHTML( 'Existing Conference' );
			this.selectBox.replaceWith(this.textBox);
		}
		else {
			this.newConference = true;
			this.toggleButton.setHTML( 'New Conference' );
			this.textBox.replaceWith(this.selectBox);
		}
	}

	conferenceInput.prototype.setEvents = function () {
		this.toggleButton.onclick = function (event){
			event.preventDefault();
		};
		this.toggleButton.addEvent( 'click', toggleInput.bindWithEvent( this ));
	}

	function initializeConferenceInput() {
		inputArea = new conferenceInput( $( 'conference_toggle' ),
			$( 'conference_id' ),
			$( 'conference_name' ));
		inputArea.removeTextBox();
		inputArea.setEvents();
	}

	window.addEvent('domready', function() {
		initializeConferenceInput();
	});

	function doValidation(form) {
		if (form.name.value == "") {
			alert("<?php echo JText::_('Please enter a church name'); ?>");
		}
		else if (form.street.value == "") {
			alert("<?php echo JText::_('Please enter a street address'); ?>");
		}
		else if (form.city.value == "") {
			alert("<?php echo JText::_('Please enter a location'); ?>");
		}
		else if (form.state_id.value == 0) {
			alert("<?php echo JText::_('Please select a state'); ?>");
		}
		else if ($("conference_id") != null && $("conference_id").value == 0) {
			alert("<?php echo JText::_('Please select a conference'); ?>");
		}
		else if ($("conference_name") != null && $("conference_name").value == "") {
			alert("<?php echo JText::_('Please enter a new conference or select an existing one'); ?>");
		}
		else {
			return true;
		}
		return false;
	}

	function submitbutton(pressbutton) {
		var form = document.adminForm;
		if (pressbutton == "save" || pressbutton == "apply") {
			//do form field validation
			if (doValidation(form)) {
				submitform(pressbutton);
			}
		}
		else {
			submitform(pressbutton);
		}
	}
</script>

<form action="index.php" method="post" name="adminForm" id="adminForm">
	<div class="col100">
		<fieldset class="adminform">
			<legend><?php echo JText::_( 'Church Details' ); ?></legend>

			<table class="admintable">
				<tr>
					<td width="100" class="key" align="right">
						<label for="name">
							<?php echo JText::_( "The Church Name" ); ?>
						</label>
					</td>
					<td>
						<input class="inputbox" type="text" name="name"
							id="name" size="32" maxlength="255" value="<?php echo $this->church->name; ?>" />
					</td>
				</tr>
				<tr>
					<td width="100" class="key" align="right">
						<label for="street">
							<?php echo JText::_( "Street Address" ); ?>
						</label>
					</td>
					<td>
						<input class="inputbox" type="text" name="street" id="street" size="60"
							maxlength="255" value="<?php echo $this->church->street; ?>" />
					</td>
				</tr>
				<tr>
					<td width="100" class="key" align="right">
						<label for="street2">
							<?php echo JText::_( "Street Address 2" ); ?>
						</label>
					</td>
					<td>
						<input class="inputbox" type="text" name="street2" id="street2" size="60"
							maxlength="255" value="<?php echo $this->church->street2; ?>" />
					</td>
				</tr>
				<tr>
					<td width="100" class="key" align="right">
						<label for="city">
							<?php echo JText::_( "Location" ); ?>
						</label>
					</td>
					<td>
						<input class="inputbox" type="text" name="city" id="city" size="32"
							maxlength="255" value="<?php echo $this->church->city; ?>" />
					</td>
				</tr>
				<tr>
					<td width="100" class="key" align="right">
						<label for="telephone">
							<?php echo JText::_( "Telephone" ); ?>
						</label>
					</td>
					<td>
						<input class="inputbox" type="text" name="telephone" id="telephone" size="32"
							maxlength="255" value="<?php echo $this->church->telephone; ?>" />
					</td>
				</tr>
				<tr>
					<td width="100" class="key" align="right">
						<label for="state_id">
							<?php echo JText::_( "State" ); ?>
						</label>
					</td>
					<td>
						<?php echo $this->stateSelection; ?>
					</td>
				</tr>
				<tr>
					<td width="100" class="key" align="right">
						<label for="conference_id">
							<?php echo JText::_( "Conference" ); ?>
						</label>
					</td>
					<td id="conference_input">
						<?php echo $this->conferenceSelection; ?>
						<input class="inputbox" type="text" name="conference_name" id="conference_name"
							size="32" maxlength="255" value="" />
						<button id="conference_toggle">New Conference</button>
					</td>
				</tr>
			</table>
		</fieldset>
	</div>
	<div class="clr"></div>
	
	<input type="hidden" name="option" value="com_directory" />
	<input type="hidden" name="id" value="<?php echo $this->church->id; ?>" />
	<input type="hidden" name="task" value="" />
	<input type="hidden" name="controller" value="church" />
	<?php echo JHTML::_( 'form.token' ); ?>
</form>
