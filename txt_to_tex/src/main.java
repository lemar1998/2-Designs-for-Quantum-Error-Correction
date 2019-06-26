import java.io.*;
public class main {

	public static void main(String[] args) throws IOException{
		
		FileInputStream txt = null;
		FileOutputStream tex = null;

		try {
			txt = new FileInputStream("polynomials_Steane_Code.txt");
			tex = new FileOutputStream("polynomials_Steane_Code.tex");

			while(true) {
				
				if(convert_head(txt,tex) == -1) {
				
					break;
				}
				if(convert_term(txt,tex) == -1) {
				
					break;
				}
				
			}
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
	
	public static int convert_head(FileInputStream txt, FileOutputStream tex) throws IOException{
	
		int c;
		boolean brace_open = false;
		c = txt.read();
		if(c !=-1) {
			tex.write('$');
		}
		while(c != -1 && c != '=') {
			char chara = (char) c;
			if(!Character.isLetterOrDigit(c) && brace_open) {
				tex.write('}');
				brace_open = false;
			}
			switch(c) {
				case '\n':
				case '\r':
				case '*':
					break;
				
				case '_':
					tex.write(c);
					brace_open = true;
					tex.write('{');
					break;
				default:
					tex.write(c);
					break;
			}
			c = txt.read();
		}
		
		if(c != -1) {
			tex.write(c);
			return 0;
		}
		else {
			return -1;
		}
	}

	public static int convert_term(FileInputStream txt, FileOutputStream tex) throws IOException{
		
		StringBuffer line_buff = new StringBuffer();
		StringBuffer term_buff = new StringBuffer();
		StringBuffer order_buff = new StringBuffer();
		int c;
		int order_p_m = 0;
		int order_p_q = 0;
		boolean subscript_brace_open = false;
		boolean order_brace_open = false;
		
		tex.write(' ');
		
		while((c = txt.read()) != -1) {
			char chara = (char) c;
			if(!Character.isLetterOrDigit(c) && (order_brace_open || subscript_brace_open)) {
				if(order_brace_open) {
					if(order_p_m == 0) {
						order_p_m = Integer.parseInt(order_buff.toString());
					}
					else {
						order_p_q = Integer.parseInt(order_buff.toString());
					}
					term_buff.append(order_buff);
					order_buff.delete(0, order_buff.length());
				
					term_buff.append('}');
					order_brace_open = false;
				}
				else {
					term_buff.append('}');
					subscript_brace_open = false;
				}
			}
			
			switch(c) {
				case '\n':
				case '\r':
				case '=':
				case '+':
				case '-':
					if((order_p_m + order_p_q) <= 8) {
						if(c != '\n' && c != '\r') {
							term_buff.append((char)c);
						}
						
						//tex.write(term_buff.toString().getBytes());
						line_buff.append(term_buff);
						order_buff.delete(0, order_buff.length());
						term_buff.delete(0, term_buff.length());
						order_p_m = 0;
						order_p_q = 0;
					}
					break;
					
				case '*':
					break;
				
				case '_':
					term_buff.append((char)c);
					subscript_brace_open = true;
					term_buff.append('{');
					break;
					
				case '^':
					term_buff.append((char)c);
					order_brace_open = true;
					term_buff.append('{');
					break;
					
				default:
					if(order_brace_open) {
						order_buff.append((char)c);
					}
					else {
						term_buff.append((char)c);
					}
					break;
			}
			
			if(c == '\n' || c == '\r') {
				break;
			}
		}
		
		char last_char = line_buff.charAt(line_buff.length()-1);
		if(last_char == '-' || last_char == '+') {
			line_buff.delete(line_buff.length()-2, line_buff.length());
		}
		tex.write(line_buff.toString().trim().getBytes());
		tex.write('$');
		tex.write('\n');
		tex.write('\n');
		
		if(c != -1) {
			return 0;
		}
		else {
			return -1;
		}
	}
}
