#ifndef CCG_PARSER_H_
#define CCG_PARSER_H_

#include <string>
#include <vector>
#include <mecab.h>
#include "word.h"

namespace ccg {

class Parser {
 public:
  Parser();
  ~Parser();
  std::vector<Word> parse(const std::string& input);

 private:
  MeCab::Tagger *tagger_;
};

}

#endif  // CCG_PARSER_H_
