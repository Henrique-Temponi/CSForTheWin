
#include <iostream>
#include <cmath>
#include <random>
#include <iomanip>

#include "readfile.cpp"

enum class ACTIVATOR_TYPE
{
    SIGMOID = 1,
    OTHER = 2
};

enum class PROBLEM_TYPE
{
    XOR = 1,
    SEVEN_SEGMENT = 2
};

class perceptron
{

public:
    int input_neurons = {0};
    int middle_neurons = {0};
    int output_neurons = {0};
    const int BIAS_VALUE = {1};
    perceptron(int input, int middle, int output);
    ~perceptron();
    void randomize_weights();
    void print_array();
    float calc_activate_func(ACTIVATOR_TYPE func_type, float input);
    void calc_neuron_middle(int neuron, int &current_weight_index, int *instance_row);
    int train(int epoch, const char filename[], const float hyperparam_exp, const float expected_output[][4], PROBLEM_TYPE type);
    void train(int epoch, const char filename[], const float hyperparam_exp, PROBLEM_TYPE type);
    void calc_neuron_output(int &current_weight_index);
    void calc_err_neuron(float diff[][4], int output_neuron_index);
    float calc_derivate(ACTIVATOR_TYPE type_func, float value);
    void calc_new_weights(float hyperparam_exp, int *input_row);
    void test(const char filename[]);

private:
    int total_weight_length;
    float *weight_array;
    float *bias_array;
    float *neuron_output;
    float *err_neuron_array;
    float *output_array;
};

perceptron::~perceptron()
{
    delete[] weight_array;
    delete[] bias_array;
    delete[] neuron_output;
    delete[] err_neuron_array;
    delete[] output_array;
}

perceptron::perceptron(int input, int middle, int output)
{
    input_neurons = input;
    middle_neurons = middle;
    output_neurons = output;

    if (input_neurons < 1 || middle_neurons < 1 || output_neurons < 1)
    {
        std::cout << "Params invalid" << std::endl;
        return;
    }

    total_weight_length = (input_neurons * middle_neurons) + (middle_neurons * output_neurons);
    // std::cout << "Total size: " << total_weight_length << std::endl;

    // float aux_array[total_weight_length];
    weight_array = {new float[total_weight_length]{}};
    bias_array = {new float[middle_neurons + output_neurons]};
    neuron_output = {new float[middle_neurons + output_neurons]};
    err_neuron_array = {new float[middle_neurons + output_neurons]};
    output_array = {new float[output_neurons]};

    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(-1.0f, 1.0f);

    for (int i = 0; i < total_weight_length; i++)
    {
        // weight_array[i] = 0;
        // weight_array[i] = dis(gen);
        weight_array[i] = (i + 1) / 100.0f;
    }

    for (size_t i = 0; i < (middle_neurons + output_neurons); i++)
    {
        bias_array[i] = 0.2f;
    }

    // randomize_weights();
    // print_array();
}

void perceptron::randomize_weights()
{

    // std::cout << "Total size: " << total_weight_length << std::endl;
    for (int i = 0; i < total_weight_length; i++)
    {
        weight_array[i] = 0.2;
        // std::cout << "Current index: " << i << std::endl;
    }
}

void perceptron::print_array()
{

    // std::cout << "Total size: " << total_weight_length << std::endl;
    for (int i = 0; i < total_weight_length; i++)
    {
        std::cout << "Index value: " << i << "\nArray value: " << weight_array[i] << std::endl;
    }
}

float perceptron::calc_activate_func(ACTIVATOR_TYPE type_func, float input)
{
    return ((1) / (1 + std::exp(-input)));
}

float perceptron::calc_derivate(ACTIVATOR_TYPE type_func, float value)
{
    float calc_sum = {0.0f};
    // std::cout << "Calc_derivate >> Var Value:" << value << std::endl;

    switch (type_func)
    {
    case ACTIVATOR_TYPE::SIGMOID:
        // aux = calc_activate_func(type_func, value);
        calc_sum = value * (1.0f - value);
        break;

    default:
        // std::cout << "Calc_derivate >> Function type not found!!" << std::endl;
        break;
    }

    // std::cout << "Calc_derivate >> total calc_sum:" << calc_sum << std::endl;

    return calc_sum;
}

void get_instance_line(int *instance_array, std::string instance)
{
    size_t position = 0;
    std::string delimeter = "-";
    std::string aux = "";
    int index_pos = 0;

    while ((position = instance.find(delimeter)) != std::string::npos)
    {
        // std::cout << "Current instance line: " << instance << std::endl;
        // std::cout << "Current position: " << position << std::endl;

        aux = instance.substr(0, position);
        instance_array[index_pos] = std::stoi(aux);
        // std::cout << "Value read from intance file " << instance_array[index_pos] << std::endl;
        instance.erase(0, position + delimeter.length());

        index_pos++;
    }

    instance_array[index_pos] = std::stoi(instance);
    // std::cout << "Current instance line after while: " << instance_array[index_pos] << std::endl;
    index_pos++;
}

void perceptron::calc_neuron_middle(int neuron, int &current_weight_index, int *instance_row)
{
    float neuron_sum = {0.0f};
    int weight_aux = {neuron};

    for (size_t i = 0; i < input_neurons; i++)
    {
        neuron_sum += instance_row[i] * weight_array[weight_aux];

        // std::cout << "Somatorio do neuronio "
        //           << i << ": "
        //           << weight_array[weight_aux]
        //           << std::endl;

        current_weight_index++;
        weight_aux += middle_neurons;
    }

    neuron_sum += BIAS_VALUE * bias_array[neuron];

    neuron_output[neuron] = calc_activate_func(ACTIVATOR_TYPE::SIGMOID, neuron_sum);

    // std::cout << "Neuron output value at "
    //           << neuron << ": "
    //           << neuron_output[neuron]
    //           << std::endl;

    // std::cout << std::endl;

    // int x;
    // std::cin >> x;
}

void perceptron::calc_neuron_output(int &current_weight_index)
{
    float neuron_sum = {0.0f};
    int weight_index = {input_neurons * middle_neurons};

    for (size_t x = 0; x < output_neurons; x++)
    {
        for (size_t i = 0; i < middle_neurons; i++)
        {
            neuron_sum += neuron_output[i] * weight_array[weight_index];

            // std::cout << "Neuron output: " << neuron_output[i] << std::endl;
            // std::cout << "Weight Array: " << weight_array[weight_index] << std::endl;
            // std::cout << "Neuron sum: " << neuron_sum << std::endl;

            weight_index += output_neurons;
            current_weight_index++;
        }

        // std::cout << "bias array: " << bias_array[x + middle_neurons] << std::endl;

        neuron_sum += BIAS_VALUE * bias_array[x + middle_neurons];

        // std::cout << "Total value before activator func: " << neuron_sum << std::endl;

        neuron_sum = calc_activate_func(ACTIVATOR_TYPE::SIGMOID, neuron_sum);

        // std::cout << "Final output from RNA: " << neuron_sum << std::endl;

        // std::cout << std::endl;

        output_array[x] = neuron_sum;
        // Ajustar index para o proximo loop
        // (numero base de arestas ate a ultima camada) + (neuronio atual  mais 1)
        weight_index = (input_neurons * middle_neurons) + (x + 1);
    }
}

void perceptron::calc_err_neuron(float diff[][4], int instance_output_index)
{
    float err_sum = {0.0f};
    int output_index = output_neurons - 1;

    for (int i = (middle_neurons + output_neurons) - 1; i >= middle_neurons; i--)
    {
        // std::cout << "Diference of error: " << diff[instance_output_index][output_index] << std::endl;
        // std::cout << "Output: " << output_array[output_index] << std::endl;

        err_neuron_array[i] = calc_derivate(ACTIVATOR_TYPE::SIGMOID, output_array[output_index]) * diff[instance_output_index][output_index];

        // std::cout << "Output Error value: " << err_neuron_array[i] << std::endl;
        // std::cout << std::endl;
        output_index--;
    }

    int weight_index = (middle_neurons * input_neurons);

    for (int j = 0; j < middle_neurons; j++)
    {

        for (int i = 0; i < output_neurons; i++)
        {
            err_sum += err_neuron_array[middle_neurons + i] * weight_array[weight_index];

            // std::cout << "Err value from output: " << err_neuron_array[middle_neurons + i] << std::endl;
            // std::cout << "weight from output to middle neuron: " << weight_array[weight_index] << std::endl;
            // std::cout << "Err value: " << err_sum << std::endl;

            weight_index += output_neurons;
        }

        err_neuron_array[j] = calc_derivate(ACTIVATOR_TYPE::SIGMOID, neuron_output[j]) * err_sum;
        // std::cout << "Neuron output value: " << neuron_output[j] << std::endl;
        // std::cout << "Middle Neuron Error value: " << err_neuron_array[j] << std::endl;
        err_sum = 0.0f;
        weight_index = (middle_neurons * input_neurons) + (j + 1);
    }
}

void perceptron::calc_new_weights(float hyperparam_exp, int *input_row)
{

    int index_offset = 0;

    for (size_t i = 0; i < input_neurons; i++)
    {
        for (size_t x = 0; x < middle_neurons; x++)
        {
            // std::cout << "\nEntrada "
            //           << i << " -> "
            //           << "Neuronio Oculto " << x
            //           << std::endl;
            // std::cout << "Peso atual\tHiper Parametro\t\tTaxa de erro do neuronio\tEntrada da instancia" << std::endl;
            // std::cout << weight_array[index_offset] << " +\t\t" << hyperparam_exp << " *\t\t\t" << err_neuron_array[x] << " *\t\t\t" << input_row[i] << std::endl;
            weight_array[index_offset] = weight_array[index_offset] + hyperparam_exp * err_neuron_array[x] * input_row[i];
            // std::cout << "Novo Peso: " << weight_array[index_offset] << std::endl;
            index_offset++;
        }
    }

    for (size_t i = 0; i < middle_neurons; i++)
    {
        for (size_t x = 0; x < output_neurons; x++)
        {
            // std::cout << "New middle-output Neurons weights: " << (weight_array[index_offset] + hyperparam_exp * err_neuron_array[middle_neurons + x] * neuron_output[i]) << std::endl;

            // std::cout << "\nNeuronio "
            //           << i << " -> "
            //           << "Neuronio Saida " << x
            //           << std::endl;
            // std::cout << "Peso atual\tHiper Parametro\t\tTaxa de erro do neuronio\tEntrada da instancia" << std::endl;
            // std::cout << weight_array[index_offset] << " +\t\t" << hyperparam_exp << " *\t\t\t" << err_neuron_array[x] << " *\t\t\t" << input_row[i] << std::endl;

            weight_array[index_offset] = weight_array[index_offset] + hyperparam_exp * err_neuron_array[middle_neurons + x] * neuron_output[i];

            // std::cout << "Novo Peso: " << weight_array[index_offset] << std::endl;
            index_offset++;
        }
    }

    for (size_t a = 0; a < (middle_neurons + output_neurons); a++)
    {
        // std::cout << "New Bias-middle Neurons weights: " << (bias_array[a] + hyperparam_exp * err_neuron_array[a] * BIAS_VALUE) << std::endl;

        // std::cout << "\nPeso Bias "
        //           << a << " -> "
        //           << "Neuronio " << a
        //           << std::endl;
        // std::cout << "Peso atual\tHiper Parametro\t\tTaxa de erro do neuronio\tEntrada da instancia" << std::endl;
        // std::cout << bias_array[a] << " +\t\t" << hyperparam_exp << " *\t\t\t" << err_neuron_array[a] << " *\t\t\t" << BIAS_VALUE << std::endl;

        bias_array[a] = bias_array[a] + hyperparam_exp * err_neuron_array[a] * BIAS_VALUE;

        // std::cout << "Novo Peso: " << bias_array[a] << std::endl;
    }

    // std::cout << "New weights: " << (weight_array[0]+hyperparam_exp*err_neuron_array[0]*1) << std::endl;
}

inline float absolute_value(float number)
{
    return number < 0.0f ? number * -1 : number;
}

void perceptron::test(const char filename[])
{
    int current_weight = {0};
    std::string line;
    readfile rf(filename);
    int current_instance_line[input_neurons];
    int a = {0};

    while (std::getline(rf.myfile, line))
    {
        get_instance_line(current_instance_line, line);

        for (int i = 0; i < middle_neurons; i++)
        {
            calc_neuron_middle(i, current_weight, current_instance_line);
        }

        calc_neuron_output(current_weight);

        for (size_t i = 0; i < input_neurons; i++)
        {
            std::cout << current_instance_line[i] << ", ";
        }

        std::cout << " -> Output: ";

        for (size_t i = 0; i < output_neurons; i++)
        {
            std::cout << output_array[i] << ", ";
        }

        std::cout << std::endl;

        current_weight = 0;
        a++;
    }
}

void perceptron::train(int epoch, const char filename[], const float hyperparam_exp, PROBLEM_TYPE type)
{
    switch (type)
    {
    case PROBLEM_TYPE::XOR:
    {
        const float expected_output[][4] = {
            {0.0f, 0.0f, 0.0f, 0.0f},
            {1.0f, 0.0f, 0.0f, 0.0f},
            {1.0f, 0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f, 0.0f},
        };
        train(epoch, filename, hyperparam_exp, expected_output, type);
        break;
    }
    case PROBLEM_TYPE::SEVEN_SEGMENT:
    {
        const float expected_output[][4] = {
            {1.0f, 0.0f, 0.0f, 0.0f}, // Digit 0
            {0.0f, 1.0f, 0.0f, 0.0f}, // Digit 1
            {0.0f, 0.0f, 1.0f, 0.0f}, // Digit 2
            {0.0f, 0.0f, 0.0f, 1.0f}, // Digit 3

        };
        train(epoch, filename, hyperparam_exp, expected_output, type);
        break;
    }

    default:
        break;
    }
}

int perceptron::train(int epoch, const char filename[], const float hyperparam_exp, const float expected_output[][4], PROBLEM_TYPE type)
{
    if (epoch < 1)
        return 1;

    std::string line;
    readfile rf(filename);
    int current_weight = {0};
    float *x;
    unsigned short output_index = {0};
    float diff[4][4];
    int current_instance_line[input_neurons];
    int b = {0};
    float average_error = {0.0f};

    // std::getline(rf.myfile, line);

    // calc_neuron_middle(0, line, current_weight);

    for (int ep = 0; ep < epoch; ep++)
    {

        while (std::getline(rf.myfile, line))
        {
            get_instance_line(current_instance_line, line);

            for (int i = 0; i < (middle_neurons); i++)
            {
                calc_neuron_middle(i, current_weight, current_instance_line);
            }

            calc_neuron_output(current_weight);

            // Precisa ser feito um for para cada um dos neuronios
            for (size_t i = 0; i < output_neurons; i++)
            {
                diff[output_index][i] = expected_output[output_index][i] - output_array[i];

                average_error += absolute_value(diff[output_index][i]);

                // std::cout << "Output array: " << output_array[i] << std::endl;
                // std::cout << "Expected output: " << expected_output[output_index][i] << std::endl;
                // std::cout << "Final Diff: " << diff[output_index][i] << std::endl;
                // std::cout << "Average error: " << average_error << "\n"
                //           << std::endl;
            }

            if (average_error > 0.00001f) // Magic number
            {
                // Valor de parada nao satisfeito calc erro e ajustar pesos
                calc_err_neuron(diff, output_index);

                // calc novos pesos
                calc_new_weights(hyperparam_exp, current_instance_line);
            }

            // std::cout << "=================Epoch Report================" << std::endl;
            // std::cout << "Epoch: " << (ep + 1) << std::endl;
            // std::cout << "Error Rate: " << diff[output_index][0] << std::endl;
            // std::cout << "Intance number: " << output_index + 1 << std::endl;
            // std::cout << "RNA output: " << output_array[0] << std::endl;
            // std::cout << "=============================================" << std::endl;
            // std::cin >> b;
            current_weight = 0;
            average_error = 0;
            output_index++;
        }
        rf.reset();
        output_index = 0;

        for (size_t reset_line = 0; reset_line < 4; reset_line++)
        {
            for (size_t reset_row = 0; reset_row < 4; reset_row++)
            {
                diff[reset_line][reset_row] = 0;
            }
        }
    }

    return 0;
}
