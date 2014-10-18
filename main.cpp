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

  std::cout << "Ready ?" << std::endl;
  std::string input;
  std::getline(std::cin, input);
  if(input=="") { 
    for(unsigned int i=0; i<c.number; i++) {
      std::cout << c.getSingleCmll(i);
      chrono t;
      t.start();
      std::string input;
      std::getline(std::cin, input);
      if(input=="") { 
	t.stop();
	std::cout << "Elapsed time: " << t.getElapsedTime() << " seconds" << std::endl << std::endl;
      }
    } 
  }

  return 0;
}
