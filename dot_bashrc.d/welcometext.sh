# Welcome Message                                                               

cowfiles=(cower default elephant eyes hellokitty kitty koala meow sheep         
small tux)                                                                      
                                                                                
currentCowfile=${cowfiles[ $[ $RANDOM % ${#cowfiles[@]} ] ]}                    
# = cowfiles[random number less than the number of items in $cowfiles]          
                                                                                
if [ $[ $RANDOM % 3 ] = 0 ]; then # fortune 1 out of 3 times                    
    fortune | cowsay -f $currentCowfile | lolcat -h 0.1
else                                                                            
    figlet "$USER" | cowsay -n -f $currentCowfile | lolcat -h 0.2 
fi 

unset cowfiles
unset currentCowfile
