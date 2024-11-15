def cmmdc(a, b):
    a = abs(a)
    b = abs(b)

    while b != 0:
        r = a % b

        a = b
        b = r

    return a

def cmmmc(a, b):
    a = abs(a)
    b = abs(b)

    return int(a * b / cmmdc(a, b))

def main():
    a = int(input("a = "))
    b = int(input("b = "))

    print(f"cmmmdc(a,b) = {cmmdc(a, b)}")
    print(f"cmmmc(a,b) = {cmmmc(a, b)}")

if __name__ == "__main__":
    main()