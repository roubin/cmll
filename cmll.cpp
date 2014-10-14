#include "cmll.h"
#include <iostream>
#include <string>
#include <vector>
#include <stdlib.h>

cmll::cmll() : cat(0), subcat(0) {}
cmll::cmll(unsigned int cat) : cat(cat), subcat(0) {}
cmll::cmll(unsigned int cat, unsigned int subcat) : cat(cat), subcat(subcat) {}
  
void cmll::displayCats() {
  std::string str1 = this->getCat();
  std::string str2 = this->getSubCat();
  if(str1!="Unknown" && str2!="Unknown") {
    std::cout << str1 << " " << str2 << "\n";
  }
}

std::string cmll::getCat() {
  switch (this->cat) {
  case 0:  return "Well Oriented";
  case 1:  return "Anti-Sune";
  case 2:  return "Sune";
  case 3:  return "Bow Tie";
  case 4:  return "Head lights";
  case 5:  return "Blinkers";
  case 6:  return "Bruno";
  case 7:  return "Double Headlight";
  default: return "Unknown";
  }
}

std::string cmll::getSubCat() {
  if (this->cat==0) {      
    switch (this->subcat) {
    case 0:  return "Well Permuted";
    case 1:  return "J perm";
    case 2:  return "Y perm";
    default: return "Unknown";
    }
  } else if ((this->cat==1 && this->subcat==0) ||
	     (this->cat==2 && this->subcat==0) ||
	     (this->cat==3 && this->subcat==0) ||
	     (this->cat==5 && this->subcat==0) ||
	     (this->cat==6 && this->subcat==0)) {
    return "Left Paired";
  } else if ((this->cat==1 && this->subcat==1) ||
	     (this->cat==2 && this->subcat==1) ||
	     (this->cat==3 && this->subcat==5) ||
	     (this->cat==5 && this->subcat==1) ||
	     (this->cat==6 && this->subcat==1) ||
	     (this->cat==7 && this->subcat==3)) {
    return "Right Paired";
  } else if ((this->cat==1 && this->subcat==2) ||
	     (this->cat==2 && this->subcat==2) ||
	     (this->cat==3 && this->subcat==3) ||
	     (this->cat==4 && this->subcat==2) ||
	     (this->cat==6 && this->subcat==3)) {
    return "Forward Slash";
  } else if ((this->cat==1 && this->subcat==3) ||
	     (this->cat==2 && this->subcat==3) ||
	     (this->cat==3 && this->subcat==1) ||
	     (this->cat==4 && this->subcat==3) ||
	     (this->cat==6 && this->subcat==2)) {
    return "Back Slash";
  } else if ((this->cat==1 && this->subcat==4) ||
	     (this->cat==2 && this->subcat==4) ||
	     (this->cat==3 && this->subcat==4) ||
	     (this->cat==4 && this->subcat==4) ||
	     (this->cat==5 && this->subcat==3) ||
	     (this->cat==6 && this->subcat==4) ||
	     (this->cat==7 && this->subcat==0)) {
    return "Columns";
  } else if ((this->cat==5 && this->subcat==2) ||
	     (this->cat==7 && this->subcat==1)) {
    return "Rows";
  } else if ((this->cat==1 && this->subcat==5) ||
	     (this->cat==2 && this->subcat==5) ||
	     (this->cat==3 && this->subcat==2) ||
	     (this->cat==4 && this->subcat==5) ||
	     (this->cat==6 && this->subcat==5)) {
    return "X Case";
  } else if ((this->cat==4 && this->subcat==1) ||
	     (this->cat==5 && this->subcat==5) ||
	     (this->cat==7 && this->subcat==2)) {
    return "Front Paired";
  } else if ((this->cat==4 && this->subcat==0) ||
	     (this->cat==5 && this->subcat==4)) {
    return "Back Paired";
  } else{
    return "Unknown";
  }
}

std::string cmll::getAlg() {
  return "Id";
}
