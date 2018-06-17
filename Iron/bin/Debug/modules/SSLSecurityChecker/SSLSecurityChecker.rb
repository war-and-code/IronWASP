require "TestSSLServer.dll"
include IronWASP

#Extend the RubyModule base class
class SSLSecurityChecker < RubyModule

	# @console

	#Implement the GetInstance method of RubyModule class. This method is used to create new instances of this module.
	def GetInstance
		m = SSLSecurityChecker.new
		m.name = 'SSLSecurityChecker'
		return m
	end


	#Implement the StartModule method of Module class. This is the method called by IronWASP when user tries to launch the moduule from the UI.
	def StartModule
		# #IronConsole is a CLI window where output can be printed and user input accepted
		# @console = IronConsole.new
		# @console.set_title('Test SSL Server')
		# @console.show_console
		# #'print_line' prints text at the CLI. 'print' prints text without adding a newline at the end.
		# @console.print_line('[*] Test SSL Server has started')
		# @console.print('[*] Enter target URL: ')
		# #'read_line' accepts a single line input from the user through the CLI. 'read' accepts multi-line input.
		# url = @console.read_line()
		# @console.print_line(url)
		# @console.print_line('[*] Target scanned!')
		@tss = TestSSLServer::TestSSLServer.new
		startUI
	end
end

def startUI
	ui = ModUi.new()
	ui.Size = ModUiTools.get_size_definition(584,450)
	ui.Text = Tools.base64_decode('U1NMIFNlY3VyaXR5IENoZWNrZXI=')
	ui.Icon = ModUiTools.get_icon_definition('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')
	mod_label_1 = ModLabel.new()
	mod_label_1.Name = 'mod_label_1'
	mod_label_1.Size = ModUiTools.get_size_definition(100,23)
	mod_label_1.Location = ModUiTools.get_location_definition(13,39)
	mod_label_1.Anchor = ModUiTools.get_anchor_style_definition(true,false,true,false)
	mod_label_1.Dock = ModUiTools.get_dock_style_definition('None')
	mod_label_1.Enabled = true
	mod_label_1.BackColor = ModUiTools.get_color_definition(-986896)
	mod_label_1.ForeColor = ModUiTools.get_color_definition(-16777216)
	mod_label_1.BorderStyle = ModUiTools.get_border_style_definition('None')
	mod_label_1.Font = ModUiTools.get_font_definition('Microsoft Sans Serif',9,true,false,false,false)
	mod_label_1.Text = Tools.base64_decode('T3V0cHV0Og==')
	ui.Controls.Add(mod_label_1)
	ui.mod_controls['mod_label_1'] = mod_label_1
	_outputText = ModTextBox.new()
	_outputText.Name = '_outputText'
	_outputText.Size = ModUiTools.get_size_definition(543,335)
	_outputText.Location = ModUiTools.get_location_definition(13,65)
	_outputText.Anchor = ModUiTools.get_anchor_style_definition(true,true,true,true)
	_outputText.Dock = ModUiTools.get_dock_style_definition('None')
	_outputText.Enabled = true
	_outputText.BackColor = ModUiTools.get_color_definition(-1)
	_outputText.ForeColor = ModUiTools.get_color_definition(-16777216)
	_outputText.BorderStyle = ModUiTools.get_border_style_definition('Fixed3D')
	_outputText.ReadOnly = false
	_outputText.ScrollBars = ModUiTools.get_scroll_bars_definition('Both')
	_outputText.Font = ModUiTools.get_font_definition('Microsoft Sans Serif',8.25,false,false,false,false)
	_outputText.Multiline = true
	_outputText.WordWrap = false
	_outputText.TextAlign = ModUiTools.get_text_align_definition('Left')
	ui.Controls.Add(_outputText)
	ui.mod_controls['_outputText'] = _outputText
	_goBtn = ModButton.new()
	_goBtn.Name = '_goBtn'
	_goBtn.Size = ModUiTools.get_size_definition(75,23)
	_goBtn.Location = ModUiTools.get_location_definition(478,7)
	_goBtn.Anchor = ModUiTools.get_anchor_style_definition(true,false,true,false)
	_goBtn.Dock = ModUiTools.get_dock_style_definition('None')
	_goBtn.Enabled = true
	_goBtn.BackColor = ModUiTools.get_color_definition(-986896)
	_goBtn.ForeColor = ModUiTools.get_color_definition(-16777216)
	_goBtn.Font = ModUiTools.get_font_definition('Microsoft Sans Serif',9,true,false,false,false)
	_goBtn.Text = Tools.base64_decode('R28=')
	ui.Controls.Add(_goBtn)
	ui.mod_controls['_goBtn'] = _goBtn
	_portValue = ModTextBox.new()
	_portValue.Name = '_portValue'
	_portValue.Size = ModUiTools.get_size_definition(70,20)
	_portValue.Location = ModUiTools.get_location_definition(402,9)
	_portValue.Anchor = ModUiTools.get_anchor_style_definition(true,false,true,false)
	_portValue.Dock = ModUiTools.get_dock_style_definition('None')
	_portValue.Enabled = true
	_portValue.BackColor = ModUiTools.get_color_definition(-1)
	_portValue.ForeColor = ModUiTools.get_color_definition(-16777216)
	_portValue.BorderStyle = ModUiTools.get_border_style_definition('Fixed3D')
	_portValue.ReadOnly = false
	_portValue.ScrollBars = ModUiTools.get_scroll_bars_definition('None')
	_portValue.Font = ModUiTools.get_font_definition('Microsoft Sans Serif',8.25,false,false,false,false)
	_portValue.Multiline = false
	_portValue.WordWrap = true
	_portValue.TextAlign = ModUiTools.get_text_align_definition('Left')
	_portValue.Text = Tools.base64_decode('NDQz')
	ui.Controls.Add(_portValue)
	ui.mod_controls['_portValue'] = _portValue
	_portLbl = ModLabel.new()
	_portLbl.Name = '_portLbl'
	_portLbl.Size = ModUiTools.get_size_definition(40,23)
	_portLbl.Location = ModUiTools.get_location_definition(366,9)
	_portLbl.Anchor = ModUiTools.get_anchor_style_definition(true,false,true,false)
	_portLbl.Dock = ModUiTools.get_dock_style_definition('None')
	_portLbl.Enabled = true
	_portLbl.BackColor = ModUiTools.get_color_definition(-986896)
	_portLbl.ForeColor = ModUiTools.get_color_definition(-16777216)
	_portLbl.BorderStyle = ModUiTools.get_border_style_definition('None')
	_portLbl.Font = ModUiTools.get_font_definition('Microsoft Sans Serif',9,true,false,false,false)
	_portLbl.Text = Tools.base64_decode('UG9ydDo=')
	ui.Controls.Add(_portLbl)
	ui.mod_controls['_portLbl'] = _portLbl
	_hostNameValue = ModTextBox.new()
	_hostNameValue.Name = '_hostNameValue'
	_hostNameValue.Size = ModUiTools.get_size_definition(265,20)
	_hostNameValue.Location = ModUiTools.get_location_definition(94,9)
	_hostNameValue.Anchor = ModUiTools.get_anchor_style_definition(true,false,true,false)
	_hostNameValue.Dock = ModUiTools.get_dock_style_definition('None')
	_hostNameValue.Enabled = true
	_hostNameValue.BackColor = ModUiTools.get_color_definition(-1)
	_hostNameValue.ForeColor = ModUiTools.get_color_definition(-16777216)
	_hostNameValue.BorderStyle = ModUiTools.get_border_style_definition('Fixed3D')
	_hostNameValue.ReadOnly = false
	_hostNameValue.ScrollBars = ModUiTools.get_scroll_bars_definition('None')
	_hostNameValue.Font = ModUiTools.get_font_definition('Microsoft Sans Serif',8.25,false,false,false,false)
	_hostNameValue.Multiline = false
	_hostNameValue.WordWrap = true
	_hostNameValue.TextAlign = ModUiTools.get_text_align_definition('Left')
	_hostNameValue.Text = Tools.base64_decode('ZS5nLiBpcm9ud2FzcC5vcmc=')
	ui.Controls.Add(_hostNameValue)
	ui.mod_controls['_hostNameValue'] = _hostNameValue
	_hostNameLbl = ModLabel.new()
	_hostNameLbl.Name = '_hostNameLbl'
	_hostNameLbl.Size = ModUiTools.get_size_definition(76,23)
	_hostNameLbl.Location = ModUiTools.get_location_definition(12,9)
	_hostNameLbl.Anchor = ModUiTools.get_anchor_style_definition(true,false,true,false)
	_hostNameLbl.Dock = ModUiTools.get_dock_style_definition('None')
	_hostNameLbl.Enabled = true
	_hostNameLbl.BackColor = ModUiTools.get_color_definition(-986896)
	_hostNameLbl.ForeColor = ModUiTools.get_color_definition(-16777216)
	_hostNameLbl.BorderStyle = ModUiTools.get_border_style_definition('None')
	_hostNameLbl.Font = ModUiTools.get_font_definition('Microsoft Sans Serif',9,true,false,false,false)
	_hostNameLbl.Text = Tools.base64_decode('SG9zdG5hbWU6')
	ui.Controls.Add(_hostNameLbl)
	ui.mod_controls['_hostNameLbl'] = _hostNameLbl
	mod_label_2 = ModLabel.new()
	mod_label_2.Name = 'mod_label_2'
	mod_label_2.Size = ModUiTools.get_size_definition(8,8)
	mod_label_2.Location = ModUiTools.get_location_definition(20,0)
	mod_label_2.Anchor = ModUiTools.get_anchor_style_definition(true,false,true,false)
	mod_label_2.Dock = ModUiTools.get_dock_style_definition('None')
	mod_label_2.Enabled = true
	mod_label_2.BackColor = ModUiTools.get_color_definition(-986896)
	mod_label_2.ForeColor = ModUiTools.get_color_definition(-16777216)
	mod_label_2.BorderStyle = ModUiTools.get_border_style_definition('None')
	mod_label_2.Font = ModUiTools.get_font_definition('Microsoft Sans Serif',8.25,false,false,false,false)
	ui.Controls.Add(mod_label_2)
	ui.mod_controls['mod_label_2'] = mod_label_2
	ui.ShowUi()

		# Event handler for the Go button
	_goBtn.Click  do
		# For running the code in a background thread, use the IronThread class
		IronThread.Run(
			Proc.new do
				exec_checks(_hostNameValue.Text, _portValue.Text, _outputText)
			end
		)
	end

	# Handle the output events thrown by the TestSSLServer dll and print the messages
	if not @tss.output_event_set
		_outputText.Text = ""
	  @tss.output_message do |msg|
	    _outputText.AppendText(msg)
	  end
	end
end


def exec_checks(hostname, port, output)
	output.Text = ""
	output.Text = @tss.run_checks(hostname, port)
end

#This code is executed only once when this new module is loaded in to the memory.
#Create an instance of the this module
m = SSLSecurityChecker.new
#Call the get_instance method on this instance which will return a new instance with all the approriate values filled in. Add this new instance to the list of Modules
RubyModule.add(m.get_instance)


