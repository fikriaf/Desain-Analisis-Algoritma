angka = int(input("Masukkan Angka: "))

for i in range(1, angka):
    hasil = angka % i
    if hasil == 0:
        print(i)
