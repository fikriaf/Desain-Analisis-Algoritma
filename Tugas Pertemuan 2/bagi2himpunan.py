# Buatlah suatu fungsi untuk membagi 2 himpunan angka, jika getSum untuk menjumlahkan angka!
def getBagiHimpunan(list1, list2):
    hasil_bagi = []
    for a, b in zip(list1, list2):
        if b == 0:
            print("Tidak bisa membagi dengan angka 0")
            break
        hasil_bagi.append(a / b)
    return hasil_bagi


list1 = [4, 12, 6]
list2 = [2, 3, 2]
print(getBagiHimpunan(list1, list2))
