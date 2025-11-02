#include "backprog.cpp"


#include <fstream>

int main (int argc, char *argv[])
{
    // Declare user libraries
    perceptron *pc;
    perceptron *pc2;

    // Define the overall RNA strucutre.
    const int input = 2;
    const int middle = 2;
    const int output = 1;

    // Define epoch
    const int epoch = 10000;
    const float  learning_param = 0.3f;

    // Read Instances from file
    constexpr char filename_xor[] = "./src/input.txt";
    constexpr char filename_seven[] = "./src/input2.txt";

    pc = new perceptron(input, middle, output);
    pc->train(epoch, filename_xor, learning_param, PROBLEM_TYPE::XOR);
    pc->test(filename_xor);
    
    // pc2 = new perceptron(7, 5, 4);
    // pc2->train(epoch, filename_seven, learning_param, PROBLEM_TYPE::SEVEN_SEGMENT);
    // pc2->test(filename_seven);



    delete pc;
    delete pc2;

    std::cout << "Done" << std::endl;
    return 0;
}