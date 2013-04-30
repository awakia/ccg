#include <gtest/gtest.h>
#include <iostream>
#include "parser.h"
using namespace std;

namespace ccg {

class ParserTest : public testing::Test {
 public:
  ParserTest() : parser_(Parser()) {}
 protected:
  Parser parser_;
};

TEST_F(ParserTest, ParseJapanese) {
  const string input = "私はご飯を食べました";
  const string expect = "[[BOS]] 私 は ご飯 を 食べ まし た [[EOS]]";
  vector<Word> words = parser_.parse(input);
  string output = "";
  for (int i = 0; i < words.size(); i++) {
    if (i) output += " ";
    output += words[i].data();
  }
  EXPECT_EQ(expect, output);
}

TEST_F(ParserTest, ParseJapanese2) {
  const string input = "象は鼻が長い。";
  const string expect = "[[BOS]] 象 は 鼻 が 長い 。 [[EOS]]";
  vector<Word> words = parser_.parse(input);
  string output = "";
  for (int i = 0; i < words.size(); i++) {
    if (i) output += " ";
    output += words[i].data();
  }
  EXPECT_EQ(expect, output);
}

}

GTEST_API_ int main(int argc, char **argv) {
  testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
