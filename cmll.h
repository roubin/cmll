#ifndef CMLL_H
#define CMLL_H

#include <iostream>
#include <string>
/* #include <vector> */
/* #include <stdlib.h> */

class cmll {
public:
  cmll();
  cmll(unsigned int cat);
  cmll(unsigned int cat, unsigned int subcat);
  
  void displayCats();

private:  
  unsigned int cat;
  unsigned int subcat;
  std::string getCat();
  std::string getSubCat();
  std::string getAlg();
};


#endif
