
int checkLetter(int num)
{
    if (num < 0) {
        return 25 + num;
    }
    else if (num > 25) {
        return num - 26;
    }
    return num;
}

int checkNumber(int num)
{
    if (num < 0) {
        return 9 + num;
    }
    else if (num > 9) {
        return num - 10;
    }
    return num;
}

int checkLetterOrNumber(int num, bool isNumber)
{
    int max = isNumber ? 9 : 25;
    if (num < 0) {
        return (max + 1) + num;
    }
    else if (num > max) {
        return num - (max + 1);
    }
    return num;
}
