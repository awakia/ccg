#ifndef CCG_WORD_H_
#define CCG_WORD_H_

#include<string>

namespace ccg {

class Word {
 public:
  Word(const std::string& data, int type);
  std::string data();
  int type();

 private:
  std::string data_;
  int type_;
};

}

#endif  // CCG_WORD_H_
