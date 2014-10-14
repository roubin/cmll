#include <iostream>
#include <string>
#include <vector>
#include <stdlib.h>

#include "cmll.h"

int main()
{

  for (unsigned int cat = 0; cat<8; cat++) {
    for (unsigned int subcat = 0; subcat<6; subcat++) {
      cmll A(cat, subcat);
      A.displayCats();
    }
  }

  return 0;
}
