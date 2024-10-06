import java.lang.Math;
import java.lang.String;
import java.util.Random;



class Main {

  public static void main(String[] args) {
    short[] f = createF();
    float[] x = createX();
    double[][] n = createN(f, x);

    print2dArray(n);
  }

  static short[] createF() {
    short[] f = new short[(16 - 4) / 2 + 1];
    int step = 0;
    
    for (int i = 16; i >= 4; i -= 2) {
        f[16 - step - i] = (short) i; 
        step++;
    }
    return f;
  }

  static float[] createX() {
    Random rand = new Random();
    float[] x = new float[16];

    for (int i = 0; i < x.length; i++) {
      x[i] = rand.nextFloat(-14.0f, 2.0f);
    }
    return x;
  }

  static double[][] createN (short[] f, float[] x) {
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

  static double func1 (double num) {
    return Math.pow(Math.cos(Math.pow(num, num / (1./3 + num))) * (1./3 - Math.cbrt(Math.sin(num))), 2);
  }

  static double func2 (double num) {
    return Math.asin(Math.pow(Math.E, Math.cbrt(-Math.pow(Math.cos(num), 2))));
  }

  static double func3 (double num) {
    return Math.pow(Math.pow(Math.asin(Math.cos(num)), 3), 4. / Math.pow(Math.tan(Math.asin((num - 6) / 16.)), Math.tan(Math.cos(num))));
  }

  static int binarySearch(int[] sortedArray, int target, int left, int right) {
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

  static void print2dArray (double[][] n) {
  	for (int i = 0; i < n.length; i++) {
      for (int j = 0; j < n[i].length; j++) {
        System.out.print(String.format("%.4f", n[i][j]) + "\t");
      }
      System.out.println();
    }
  }
}


