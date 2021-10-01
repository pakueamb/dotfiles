# Start Powerline prompt format

# powerline-shell/status both installed with pip

function _update_ps1() {                                                        
    PS1=$(powerline-shell $?)                                              
}                                                                               
    
# if  $TERM != linux
#     _update_ps1 is not already in the variable     
#     the command powerline-shell is found
#then add the function for powerline in the variable

# $PROMPT_COMMAND runs at each command line
                                                                
if [[ $TERM != linux &&                                                         
  ! $PROMPT_COMMAND =~ _update_ps1 &&                                       
  -f `which powerline-shell` ]]; then           
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi                                                                              
                                                                                
if [ -f `which powerline-daemon` ]; then                                        
    powerline-daemon -q                                                         
    POWERLINE_BASH_CONTINUATION=1                                               
    POWERLINE_BASH_SELECT=1    
fi