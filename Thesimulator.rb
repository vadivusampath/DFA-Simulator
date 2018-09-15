require 'Matrix'

class DFAsimulator

	#initializing the file to read the input 
	file = File.foreach('dfa_simulator.txt').map {|line| line.split(/[\s,'['']'\n]/)}
	
	################ specifing the syntax of the file as matrix ######################
	first_state = file[2][0]
	final_state = file[3][0]
	states_set = file[0]
	alphabets = file[1]
	
	
	print " DFA - simulator : \r\n"
	print " The states set are : " 
	print states_set
	print "  \r\n The alphabets are : " 
	print alphabets
	print "  \r\n The first state is : " 
	print first_state
	print "  \r\n The final state is : " 
	print final_state
	
	transition = Array.new(states_set.length){Array.new(alphabets.length)}
		print "\r\n The transtion table for the created DFA "
		0.upto(states_set.size-1).each do |i|
		print "\r\n"
			0.upto(alphabets.size-1).each do |j|
				transition[i][j] = file[i+4][j]
				print transition[i][j]
				print "   "
			end
		end
	
    
	print "\r\n The input string is :  "
	inputString = "a,b,a,a,b,a,a,c" # Can be modified at run time
	s = inputString.split(",")
	print s
	print " changable \r\n"
	print "The derivation path of the input string in the transition table is \r\n"

	current = nil
	for i in 0 .. (s.length-1)
		x = states_set.index(first_state)
		y = alphabets.index(s[i])
		current = transition[x][y]
		print " -> " +current
	end
	
	last_stop = current
	if (last_stop == final_state)
		print "  ACCEPTED"
	else
		print "  REJECTED"
		end

end #end class DFAsimulator





