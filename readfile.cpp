#include <iostream>
#include <fstream>
#include <string>

class readfile
{
public:
    std::string line;
    std::ifstream myfile;
    readfile(const char *filename);
    ~readfile();

    void readLine(std::string line);
    void reset();
};

readfile::readfile(const char *file)
{
    myfile.open(file);
}

readfile::~readfile()
{
    myfile.close();
}

void readfile::readLine(std::string line)
{

    if (myfile.is_open())
    {
        // while ( std::getline (myfile, line))
        // {
        //     std::cout << line << '\n';
        // }
        std::getline(myfile, line);
        std::cout << "Numero total de entradas: " << line << '\n';
    }
    else
    {
        std::cout << "unable to open file\n";
    }
}

void readfile::reset()
{
    myfile.clear();
    myfile.seekg(0, std::ios::beg);
}