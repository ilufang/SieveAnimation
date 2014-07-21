int[] arr = new int [10*15+1];
int UNKNOWN = 0,
    PRIME = 1,
    COMP = 2;
//int[] primes = new int [100];
//int prime_count = 1;
int iter = 2;
int current_prime = 2;
color[] colors = new color [3];

void initarr()
{
  for(int i = 0; i != 10*15+1; i++)
  {
    arr[i]=UNKNOWN;
  }
  
}

void setup()
{
  size(10*40,15*40);
  initarr();
  colors[UNKNOWN]=#999999;
  colors[PRIME]=#ff6666;
  colors[COMP]=#66ccff;
  arr[2]=PRIME;
}

void draw_table()
{
  noStroke();
  textSize(15);
  for(int y = 0; y != 15; y++)
  {
    for(int x = 1; x <= 10; x++)
    {
      fill(colors[arr[x+10*y]]);
      rect((x-1)*40,y*40,39,39);
      fill(0);
      text(x+10*y,(x-1)*40+5,y*40+23);
    }
  }
}

void find_next_prime()
{
  for(int i = 2; i <= 150; i++)
  {
    if(arr[i]==UNKNOWN)
    {
      arr[i]=PRIME;
      current_prime=i;
      break;
    }
  }
  iter = 2;
}

void filter_next()
{
  while(true)
  {
    // Look for the next comp number
    iter+=current_prime;
    if(iter>150){
      break;
    }
    arr[iter]=COMP;
    return;
  }
  // Find the next prime
  find_next_prime();
}

void draw()
{
  draw_table();
  filter_next();
}
