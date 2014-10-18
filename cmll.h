#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <stdlib.h>

class cmll {
 public:
  std::vector<std::string> orientation;
  std::vector<std::string> permutation;
  std::vector<std::string> alg;
  unsigned int number;
  
  cmll(unsigned int id_o, unsigned int id_p) {
    readConf();
    setSingleCmll(id_o, id_p);
  };

  cmll(unsigned int n) {
    readConf();
    setRandomCmll(n);
  };
  cmll() {
    readConf();
    setAllCmll();
  };
  ~cmll() {};

  void displayAllCmll() {
    for(unsigned i=0; i<number; i++) {
      std::cout << orientation[i] << " " << permutation[i] << " / " << alg[i] << std::endl;
    }
  }

  std::string getSingleCmll(unsigned int i) {
    return orientation[i]+" "+permutation[i];
  }

 private:
  std::vector< std::vector< std::string > > all_cmll;

  void readConf() {
    std::string file_name="cmll.db";
    std::ifstream ist(file_name.c_str());
    if(!ist) std::cout << "Can't open configuration file " << file_name << std::endl;
    std::string delimiter=":";
    std::string comment="#";

    for(std::string line; getline(ist, line); ) {
      if(line.compare(0,1,comment)!=0) {
	size_t pos=0; std::string token;
	std::vector<std::string> tokens;
	while ((pos = line.find(delimiter)) != std::string::npos) {
	  tokens.push_back(line.substr(0, pos));
	  line.erase(0, pos + delimiter.length());
	}
	tokens.push_back(line);
	if(tokens.size()==5) all_cmll.push_back(tokens);
      }
    }
    if(ist) ist.close();
  }

  void setSingleCmll(unsigned int id_o, unsigned int id_p) {
    orientation.push_back("unset");
    permutation.push_back("unset");
    alg.push_back("unset");
    for(unsigned int i=0; i<all_cmll.size(); i++) {
      if(std::atoi(all_cmll[i][0].c_str())==id_o && std::atoi(all_cmll[i][1].c_str())==id_p) {
	orientation[0]=all_cmll[i][2];
	permutation[0]=all_cmll[i][3];
	alg[0]=all_cmll[i][4];
      }
    }
    number=orientation.size();
  }

  void setAllCmll() {
    for(unsigned int i=0; i<all_cmll.size(); i++) {
      orientation.push_back(all_cmll[i][2]);
      permutation.push_back(all_cmll[i][3]);
      alg.push_back(all_cmll[i][4]);
    }
    number=orientation.size();
  }

  void setRandomCmll(unsigned int n) {
    orientation.resize(n); permutation.resize(n); alg.resize(n);
    srand ( time(NULL) );
    for(unsigned int i=0; i<n; i++) {
      unsigned int l=rand()%all_cmll.size();
      orientation[i]=all_cmll[l][2];
      permutation[i]=all_cmll[l][3];
      alg[i]=all_cmll[l][4];
    }
    number=orientation.size();
  }

};
