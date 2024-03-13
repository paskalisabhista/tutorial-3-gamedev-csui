# Tutorial 3
## Latihan Mandiri: Eksplorasi Mekanika Pergerakan
> Fitur yang dieksplorasi adalah double jump dan crouching
> 1. Double jump, diimplementasikan dengan menambah variabel boolean _can_double_jump_ pada Player.gd. Idenya adalah sesaat setelah melakukan lompatan kedua, nilai dari variabel ini akan _false_ sehingga player tidak dapat melompat lagi. Namun, nilai dari variabel ini akan kembali menjadi _true_. Nilai default dari variabel ini di set menjadi _true_ untuk memungkinkan player meloncat saat ia terjatuh tanpa melakukan lompatan.
> 2. Crouching, diimplentasikan dengan menambah variabel boolean _is_crouch_. Jika variabel ini bernilai _true_, maka player akan jongkok dan kecepatannya berkurang setengah. Dengan meloncat atau kembali menekan key "arrow_down" player akan kembali ke mode standing/idle.

_Referensi_: https://www.youtube.com/watch?v=sVJEaYNOUNw&t=1046s

# Tutorial 5
## Latihan Mandiri: Membuat dan Menambah Variasi Aset
> 1. Objek yang ditambahkan adalah bola yang memiliki efek memantul dan dapat mengeluarkan sfx bola
> 2. Sound effect yang diimplementasikan dalam tutorial ini adalah sound efek berjalan, melompat, suara pantulan bola, dan BGM.
> 3. Interaksi yang dapat pemain lakukan untuk memanipulasi sesuatu berada pada UI sederhana checkbox music yang berfungsi untuk menyalakan/menonaktifkan BGM.
> 4. Ide dari pengerjaan sound efek sehingga tidak terjadi overlaping (seperti sfx saat player berjalan) adalah menambahkan timeout yang dapat mem-flip variable boolean yang berfungsi sebagai flag agar sfx tidak tumpang tindih.