#include <string>

#include "word.h"

using namespace std;

namespace ccg {

Word::Word(const string& data, int type) :
    data_(data), type_(type) {}

Word::Word(const Word& word) :
    data_(word.data()), type_(word.type()) {}

Word Word::operator = (const Word &other) const {
  return Word(other);
}

string Word::data() const {
  return data_;
}

int Word::type() const {
  return type_;
}

ostream& operator << (ostream& os, const Word& word) {
  return os << word.data();
}

}
