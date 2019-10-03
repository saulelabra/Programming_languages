#include <iostream>

using namespace std;

int prove_division_tail(int num, int count) {
    if(num%count == 0)
    {
        prove_division_tail(num, count+1);
    }else{
        return count-1;
    }
}

int prove_division(int num) {
    return prove_division_tail(num, 1);
}

int divisibleUpTo(int num){
    int test_num = 1;

    while(true)
    {
        if(prove_division(test_num) == num)
        {
            return test_num;
        }
        
        test_num++;
    }
}

int main(){
    int num;

    cout << "Get a number divisible up to:" << endl;
    cin >> num;

    cout << divisibleUpTo(num) << endl;
}

