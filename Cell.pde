public class Cell{
	int ix;
	int iy;

	int x;
	int y;
	int s;

	boolean alive = false;
	boolean[] neighbors;

	boolean nextState = false;

	Cell(int x, int y, int s, int ix, int iy){
		this.x = x;
		this.y = y;
		this.s = s;
		this.ix = ix;
		this.iy = iy;
		neighbors = new boolean[8];

		if(random(1) < 0.3){
			alive = true;
		}
	}

	// Draws the cell.
	void show(){
		if(alive){
			fill(255);
		}else{
			fill(0);
		}
		//noStroke();
		rect(x, y, s, s);
	}

	void switchState(){
		this.alive = this.nextState;
	}
}
