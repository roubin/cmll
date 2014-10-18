#include <iostream>
#include <string>
#include <time.h>
#include <sys/time.h>

class chrono {
public:
  chrono() {};
  
  double getElapsedTime() {  return end-begin; };
  void start() { begin=getCurrentTime(); };
  void stop() { end=getCurrentTime(); };

private:  
  double begin;
  double end;
  double getCurrentTime() {
    struct timeval tim; gettimeofday(&tim, NULL);
    return tim.tv_sec+(tim.tv_usec/1000000.0);
  };
};
