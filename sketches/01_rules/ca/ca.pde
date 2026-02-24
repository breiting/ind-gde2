int cellSize = 6;              // size of each cell in pixels
int cols;                      // number of cells per row
int rows;                      // number of rows on screen

int[] current;                 // current row state (0/1)
int[] next;                    // next row state (0/1)

int rule = 30;                 // try 30, 90, 110, 150

int y = 0;                     // current row index (in pixels)

void setup() {
  size(720, 720);
  background(255);
  noStroke();

  cols = width / cellSize;
  rows = height / cellSize;

  current = new int[cols];
  next = new int[cols];

  // start with a single "1" in the middle
  current[cols/2] = 1;
}

void draw() {
  // draw current row
  for (int i = 0; i < cols; i++) {
    fill(current[i] == 1 ? 0 : 255);
    rect(i * cellSize, y, cellSize, cellSize);
  }

  // compute next row from current row
  for (int i = 0; i < cols; i++) {
    int left   = current[(i - 1 + cols) % cols];
    int center = current[i];
    int right  = current[(i + 1) % cols];

    int idx = (left << 2) | (center << 1) | right; // 0..7 neighborhood code
    next[i] = (rule >> idx) & 1;                   // lookup bit in rule number
  }

  // swap rows
  int[] temp = current;
  current = next;
  next = temp;

  y += cellSize;

  // stop at bottom (or reset)
  if (y >= height) {
    noLoop();
  }
}
