int f(int n) {
    int i;
    int res = 0;
    for (i = 0; i < n; i = i + 1) {
        res = res + i ^ n & (i - 1);
        res = res % 10000;
    }
    return res;
}

int main()
{
    int i;
    int j;
    int k;
    int ans = 0;
    for (i = 0; i < 90000000; i++) {
        for (j = 0; j < 10; j++){
            if (i >= 89999999) {
                if (j >= 9){
                    ans = ans + f(i * 8);
                }
            }
        }
    }
    println(toString(ans));

    return 0;
}

