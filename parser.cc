// See. http://mecab.googlecode.com/svn/trunk/mecab/doc/libmecab.html

#include <string>
#include <vector>
#include <mecab.h>
#include "word.h"
#include "parser.h"
using namespace std;

namespace ccg {

Parser::Parser() :
    tagger_(MeCab::createTagger("")) {}

Parser::~Parser() {
  delete tagger_;
}

vector<Word> Parser::parse(const string& input) {
  const MeCab::Node* node = tagger_->parseToNode(input.data());
  vector<Word> result;
  for (; node; node = node->next) {
    string surface = "";
    if (node->stat == MECAB_BOS_NODE) {
      surface = "[[BOS]]";
    } else if (node->stat == MECAB_EOS_NODE) {
      surface = "[[EOS]]";
    } else {
      surface = string(node->surface, node->length);
    }
    result.push_back(Word(surface, (int)node->char_type));
  }
  return result;
}

}
