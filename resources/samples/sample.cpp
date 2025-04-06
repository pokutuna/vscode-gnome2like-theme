#include <iostream>
#include <vector>
#include <string>

class Vehicle
{
public:
  std::string brand;
  int year;

  Vehicle(std::string b, int y) : brand(b), year(y) {}

  void displayInfo()
  {
    std::cout << "Brand: " << brand << ", Year: " << year << std::endl;
  }
};

int main()
{
  Vehicle myCar("Toyota", 2021);
  myCar.displayInfo();

  std::vector<int> numbers = {1, 2, 3, 4, 5};
  int sum = 0;
  for (int num : numbers)
  {
    sum += num;
  }
  std::cout << "Sum of numbers: " << sum << std::endl;

  return 0;
}
