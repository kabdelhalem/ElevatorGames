
public class Word {
	private int position;
	private char character;

	
	public Word(int pos, char chara) {
		position = pos;
		character = chara;

	}

	public int getLocation() { return position; }
	public void setLocation(int l) { position = l; }
    public char getCharacter() {return character;}
    public void setCharacter(char chara) {character = chara;}
}
