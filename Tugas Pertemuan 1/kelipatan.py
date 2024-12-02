angka = int(input("Masukkan Angka: "))
for i in range(1, angka + 1):
    hasil = i % 2
    if hasil == 0:
        print(i)
