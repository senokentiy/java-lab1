
// general

#set text(
  font: "Times New Roman",
  size: 14pt
)

#set page(
  paper: "a4",
  width: 649pt,
  numbering: "1"
)


// text

#align(center + top)[
  #image("art/itmo.png")
  = Университет ИТМО
  #v(0.5cm)
  Мегафакультет компьютерных технологий и управления\
  Факультет программной инженерии и компьютерной техники
]

#v(4cm)

#align(center, text(22pt)[
  = Лабораторная работа №1 по программированию
])

#v(5cm)

#block()[     
  Вариант: 483974\
  Группа: R3140\
  Выполнил: Хрущев Артём Алексеевич\
  Преподаватель: Инячина Диана Александровна
]

#v(3cm)

#align(center + bottom)[
  Санкт-Петербург\
  Сентябрь, 2024 год
]

#block(text(16pt)[
  = Оглавление
  #v(0.5cm)
  Текст задания:........................................................................3\
  Исходный код программы...................................................4\
  Результат работы программы:.............................................5\
  Вывод:......................................................................................6
])

#v(30cm)

#block()[
  = Текст задания:
  #v(0.5cm)
  + Создать одномерный массив *_f_* типа _*short*_. Заполнить его чётными числами от 4 до 16 включительно в порядке убывания.
  + Создать одномерный массив *_x_* типа _*float*_. Заполнить его 16-ю случайными числами в диапазоне от -14.0 до 2.0.
  + Создать двумерный массив *_n_* размером 7x16. Вычислить его элементы по следующей формуле (где $x = x[j]$):
    #v(0.2cm)
    - если $f[i] = 12$, то $n[i][j] = (cos((x)^(x/(1/3+x))))⋅(1/3-root(3, sin(x)))^2$;
    #v(0.2cm)
    - если $f[i] ∈ {4, 6, 8}$, то $n[i][j] = arcsin(e^root(3, −cos^2(x)))$;
    #v(0.2cm)
    - для остальных значений $f[i]$: $n[i][j] = ((arcsin(cos(x)))^3)^(4/(tan(arcsin((x−6)/16)))^tan(cos(x)))$.
    #v(0.2cm)
  + Напечатать полученный в результате массив в формате с четырьмя знаками после запятой.
]

#v(15cm)

#block(text(11pt)[
  = Исходный код программы:
  #v(0.6cm)
  ```
import java.lang.Math;
import java.lang.String;
import java.util.Random;

public class Main {
  public static void main(String[] args) {
    short[] f = createF();
    float[] x = createX();
    double[][] n = createN(f, x);
    print2dArray(n);
  }
  
  public static short[] createF() {
    short[] f = new short[(16 - 4) / 2 + 1];
    int step = 0;   
    for (int i = 16; i >= 4; i -= 2) {
        f[16 - step - i] = (short) i; 
        step++;
    }
     return f;
  }
  
  public static float[] createX() {
    Random rand = new Random();
    float[] x = new float[16];
    for (int i = 0; i < x.length; i++) {
      x[i] = rand.nextFloat(-14.0f, 2.0f);
    }
    return x;
  }
  
  public static double[][] createN (short[] f, float[] x) {
    double[][] n = new double[7][16];
    for (int i = 0; i < 7; i++) {
      for (int j = 0; j < 16; j++) {
        int[] nums = { 4, 6, 8 };
        if (f[i] == 12) {
          n[i][j] = func1(x[j]);
        }
        else if (binarySearch(nums, f[i], 0, nums.length - 1) != -1) {
          n[i][j] = func2(x[j]);
        }     
        else {
          n[i][j] = func3(x[j]);  
        }
      }
    }
    return n;
  }
  
  public static double func1 (double num) {
    return Math.pow(Math.cos(Math.pow(num, num / (1./3 + num))) * (1./3 - ...Math.cbrt(Math.sin(num))), 2);
  }
  
  public static double func2 (double num) {
    return Math.asin(Math.pow(Math.E, Math.cbrt(-Math.pow(Math.cos(num), 2))));
  }
  
  public static double func3 (double num) {
    return Math.pow(Math.pow(Math.asin(Math.cos(num)), 3), 4. / Math.pow(Math.tan(Math.asin((num - 6) / 16.)), Math.tan(Math.cos(num))));
  }
  
  public static int binarySearch(int[] sortedArray, int target, int left, int right) {
    int index = -1;
    while (left <= right) {
      int mid = left + ((right - left) / 2);
      if (sortedArray[mid] < target) {
        left = mid + 1;
      } else if (sortedArray[mid] > target) {
        right = mid - 1;
      } else if (sortedArray[mid] == target) {
        index = mid;
        break;
      }
    }
    return index;
  }
  
  public static void print2dArray (double[][] n) {
    for (int i = 0; i < n.length; i++) {
      for (int j = 0; j < n[i].length; j++) {
        System.out.print(String.format("%.4f", n[i][j]) + "\t");
      }
      System.out.println();
    }
  }
}```
])

#v(1cm)


#block()[
  = Результат работы программы:
  #v(0.4cm)
  #image("art/output.png")
]

#v(20cm)


#block()[
  = Вывод:
  #v(0.3cm)  
  #h(1cm)
  В ходе выполнения лабораторной работы я научился 
  создавать одномерные и двумерные массивы на языке Java, 
  выводить данные в консоль, 
  ознакомился с целочисленными и дробными типами данных, 
  классом Math и циклами for и while, 
  методом format() из класса String, 
  методом nextFloat() из класса Random.
]



