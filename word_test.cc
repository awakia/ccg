#include <gtest/gtest.h>
#include "word.h"

class WordTest : public testing::Test {

};

GTEST_API_ int main(int argc, char **argv) {
  testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
