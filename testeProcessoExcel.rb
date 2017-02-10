require 'win32ole'

wmi = WIN32OLE.connect("winmgmts://") 

processos = wmi.ExecQuery("Select * from Win32_Process Where NAME = 'EXCEL.exe'")

processos.each do |processo|
    puts processo.execMethod_('GetOwner').User.downcase
end