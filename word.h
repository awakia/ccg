#ifndef CCG_WORD_H_
#define CCG_WORD_H_

#include<string>

namespace ccg {

class Word {
 public:
  Word(const std::string& data, int type);
  Word(const Word& word);
  Word operator = (const Word &other) const;
  std::string data() const;
  int type() const;

 private:
  const std::string data_;
  const int type_;
};

std::ostream& operator << (std::ostream& os, const Word& word);

}

#endif  // CCG_WORD_H_
