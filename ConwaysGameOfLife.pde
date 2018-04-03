Cell[][] Cells;

int rows;
int cols;
int res = 10;

void setup() {
    size(800, 800);
    rectMode(CENTER);

    rows = height / res;
    cols = width / res;

    Cells = new Cell[rows][cols];

    for (int x=0; x<Cells.length; x++) {
        for (int y=0; y<Cells[x].length; y++) {
            Cells[x][y] = new Cell(x*res+(res/2), y*res+(res/2), res, x, y);
        }
    }
    background(0);
}

void draw() {
    updateCells();
    drawCells();
}

void updateCells() {
    for (int x=0; x<Cells.length; x++) {
        for (int y=0; y<Cells[x].length; y++) {
            int aliveN = checkNeighbors(x, y);

            if (Cells[x][y].alive) {
                if (aliveN < 2 || aliveN > 3) {
                    Cells[x][y].nextState = false;
                }
            } else {
                if (aliveN == 3) {
                    Cells[x][y].nextState = true;
                }
            }
        }
    }
    for (int x=0; x<Cells.length; x++) {
        for (int y=0; y<Cells[x].length; y++) {
            Cells[x][y].switchState();
        }
    }
}

void drawCells() {
    for (int x=0; x<Cells.length; x++) {
        for (int y=0; y<Cells[x].length; y++) {
            Cells[x][y].show();
        }
    }
}

int checkNeighbors(int curX, int curY) {
    int aliveNeighborCount = 0;

    if (curY-1 > 0) {
        if (Cells[curX][curY-1].alive) {
            aliveNeighborCount++;
        }
    }
    if (curY-1 > -1 && curX+1 < rows) {
        if (Cells[curX+1][curY-1].alive) {
            aliveNeighborCount++;
        }
    }
    if (curX+1 < rows) {
        if (Cells[curX+1][curY].alive) {
            aliveNeighborCount++;
        }
    }
    if (curX+1 < rows && curY+1 < cols) {
        if (Cells[curX+1][curY+1].alive) {
            aliveNeighborCount++;
        }
    }
    if (curY+1 < cols) {
        if (Cells[curX][curY+1].alive) {
            aliveNeighborCount++;
        }
    }
    if (curX-1 > -1 && curY+1 < cols) {
        if (Cells[curX-1][curY+1].alive) {
            aliveNeighborCount++;
        }
    }
    if (curX-1 > 0) {
        if (Cells[curX-1][curY].alive) {
            aliveNeighborCount++;
        }
    }
    if (curX-1 > -1 && curY-1 > -1) {
        if (Cells[curX-1][curY-1].alive) {
            aliveNeighborCount++;
        }
    }

    return aliveNeighborCount;
}
