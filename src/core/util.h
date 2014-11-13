#ifndef UTIL_H
#define UTIL_H
#include  "../math/linear_algebra.h"
#include <algorithm>
#include <vector>
#include <set>
#include <limits>
#include <iomanip> 

#define MAX_D std::numeric_limits<double>::max()
#define MIN_D std::numeric_limits<double>::min()


#define UTMZONE_DEFAULT 50;  // beijing zone

//#define MAX_TIME_STEP 1000;    // limit trajectory duration for debugging



class Util{
public:
   

    Util();

   


     /// get a command line option
     /// from iain. url: <http://stackoverflow.com/questions/865668/
     /// parse-command-line-arguments>
     static char* GetCmdOption(char ** begin, char ** end, const std::string & option){
       char ** itr = std::find(begin, end, option);
       if (itr != end && ++itr != end){
         return *itr;
       }
       return 0;
     }

     static bool CmdOptionExists(char** begin, char** end, const std::string& option){
        return std::find(begin, end, option) != end;
     }


 


};


#endif // UTIL_H
