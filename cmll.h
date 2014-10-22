#include <iostream>
#include <sstream>
#include <fstream>
#include <string>
#include <vector>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>

class cmll {
 public:  
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
      std::cout << orientation[i] << " " << permutation[i] << " / " << alg[i] << " (" << solvingtime[i] << ")" << std::endl;
    }
  }

  std::string getSingleAlg(unsigned int i){
    return alg[i];
  }
  std::string getSingleAfterState(unsigned int i){
    return afterstate[i];
  }

  std::string getSingleCmll(unsigned int i) {
    return orientation[i]+" "+permutation[i];
  }

  void setSolvingTime(unsigned int i, double t) {
    solvingtime[i]=t;
  }

  void writeTime() {
    checkDir("datas");
    std::cout << "Writing times\n";
    for(unsigned int i=0; i<number; i++) {
      if(solvingtime[i]>0.0) {
	std::string filename="datas/solvingtimes."+NumberToString(o_id[i])+"."+NumberToString(p_id[i])+".txt";
	struct stat info;
	if( stat( filename.c_str(), &info ) != 0 ) {
	  std::cout << "Creating file: " << filename << std::endl;
	  std::ofstream f(filename.c_str());
	  if(f.is_open()) f << "# " << getSingleCmll(i) << "\n"; f.close();
	}
	std::ofstream f(filename.c_str(), std::ios::app);
	if(f.is_open()) { f << solvingtime[i] << "\n"; f.close(); }
      }
    }
  }

 private:
  std::vector<std::string> orientation;
  std::vector<std::string> permutation;
  std::vector<unsigned int> o_id;
  std::vector<unsigned int> p_id;
  std::vector<std::string> alg;
  std::vector<std::string> afterstate;
  std::vector< double > solvingtime;

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
	if(tokens.size()==6) { all_cmll.push_back(tokens); }
      }
    }
    if(ist) ist.close();
  }

  void setSingleCmll(unsigned int id_o, unsigned int id_p) {
    resizeVectors(1);
    orientation[0]="unknown"; permutation[0]="unknown"; alg[0]="unknown";
    for(unsigned int i=0; i<all_cmll.size(); i++) {
      if(std::atoi(all_cmll[i][0].c_str())==id_o && std::atoi(all_cmll[i][1].c_str())==id_p) {
	setVectors(0, all_cmll[i]);
	break;
      }
    }
  }

  void setAllCmll() {
    for(unsigned int i=0; i<all_cmll.size(); i++) {
      pushVectors(all_cmll[i]);
    }
    number=orientation.size();
  }

  void setRandomCmll(unsigned int n) {
    resizeVectors(n);
    srand ( time(NULL) );
    for(unsigned int i=0; i<n; i++) {
      unsigned int l=rand()%all_cmll.size();
      setVectors(i, all_cmll[l]);
    }
  }


  void checkDir(const char *pathname) {
    struct stat info;
    if( stat( pathname, &info ) != 0 ) {
      printf( "Creating folder: %s\n", pathname );
      mkdir(pathname, 0755);
    }
    else if( !info.st_mode | !S_IFDIR )  // S_ISDIR() doesn't exist on my windows 
      printf( "%s is no directory\n", pathname );
  }


  void resizeVectors(unsigned int n) {
    number=n;
    o_id.resize(number);
    p_id.resize(number);
    permutation.resize(number);
    orientation.resize(number);
    alg.resize(number);
    afterstate.resize(number);
    solvingtime.resize(number);
  }

  void setVectors(unsigned int i, std::vector<std::string> vec) {
    o_id[i]=std::atoi(vec[0].c_str());
    p_id[i]=std::atoi(vec[1].c_str());
    orientation[i]=vec[2];
    permutation[i]=vec[3];
    alg[i]=vec[4];
    afterstate[i]=vec[5];
    solvingtime[i]=-1.0;
  }

  void pushVectors(std::vector<std::string> vec) {
    o_id.push_back(std::atoi(vec[0].c_str()));
    p_id.push_back(std::atoi(vec[1].c_str()));
    orientation.push_back(vec[2]);
    permutation.push_back(vec[3]);
    alg.push_back(vec[4]);
    afterstate.push_back(vec[5]);
    solvingtime.push_back(-1.0);
  }


  template <typename T> std::string NumberToString ( T Number ) {
    std::ostringstream oss (std::ostringstream::out);
    oss << Number;
    return oss.str();
  }

};
