set print demangle on
set demangle-style auto
set verbose on 
set complaints 1000 
set language c++ 
set print vtbl on 
set print object on 
set print sym on 
set print pretty on 
disp /i $rip
define pst 
set $pos=&$arg0 
set $strlen = {byte}$pos 
print {char}&$arg0.st@($strlen+1) 
	end
	document pst 
	Print out a Pascal string 
	end
