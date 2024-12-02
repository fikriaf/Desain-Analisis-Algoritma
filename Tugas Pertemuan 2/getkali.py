# getSum adalah perintah untuk mendapatkan hasil jumlah seluruh angka.
# Bagaimana jika kita membutuhkan fungsi getKali untuk mengalikan seluruh angka?
def getKali(mylist):
    kali = 1
    for item in mylist:
        kali *= item
    return kali


print(getKali([1, 2, 3]))
