#include <iostream>
#include <string>
#include <vector>
#include <stdlib.h>
#include <iostream>
#include <stdio.h>

#include "cmll.h"
#include "chrono.h"

int main()
{

  cmll c(10);

  for(unsigned int i=0; i<c.number; i++) {
    std::cout << "Setup move [ " << c.getSingleSetupMove(i) << " ]\n Ready?";
    std::string input;
    std::getline(std::cin, input);
    if(input=="") { 
      chrono t;
      t.start();
      std::string input;
      std::getline(std::cin, input);
      if(input=="") { 
	t.stop();
	std::cout << "Your cmll was: " << c.getSingleCmll(i) << std::endl;
	std::cout << "The solution was: " << c.getSingleAlg(i) << std::endl;
	std::cout << "Did you get it write (Y/n): ";
	std::getline(std::cin, input);
	  if(input=="n") {
	    std::cout << std::endl;
	  } else {
	    std::cout << "Elapsed time: " << t.getElapsedTime() << " seconds" << std::endl << std::endl;
	    c.setSolvingTime(i, t.getElapsedTime());
	  }
      }
    } 
  }
  c.writeTime();


  return 0;
}
