#include <string>

#include "word.h"

using namespace std;

namespace ccg {

Word::Word(const string& data, int type) {
  data_ = data;
  type_ = type;
}

string Word::data() {
  return data_;
}

int Word::type() {
  return type_;
}

}
