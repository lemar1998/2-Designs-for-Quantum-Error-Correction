import java.io.*;
public class main {

	public static void main(String[] args) throws IOException{
		
		FileInputStream txt = null;
		FileOutputStream tex = null;
		
		try {
			txt = new FileInputStream("polynomials_Bitflip_Code.txt");
			tex = new FileOutputStream("polynomials_Bitflip_Code.tex");
			
			int c;
			boolean brace_open = false;
			boolean poly_open  = false;
			
			while((c = txt.read()) != -1) {
				if(!Character.isLetterOrDigit(c) && brace_open) {
					tex.write('}');
					brace_open = false;
				}
				switch(c) {
					case '\n':
					case '\r':
						break;
					case 'F':
						if(poly_open == true) {
							tex.write('$');
							tex.write('\n');
							tex.write('\n');
							poly_open = false;
						}
						tex.write('$');
						tex.write(c);
						poly_open = true;
						break;
					case '*':
						
						break;
					case '_':
					case '^':
						tex.write(c);
						brace_open = true;
						tex.write('{');
						break;
					default:
						tex.write(c);
						break;
				}
			}
			tex.write('$');
		}
		finally {
			if(txt != null) {
				txt.close();
			}
			if(tex != null) {
				tex.close();
			}
		}
	}

}
