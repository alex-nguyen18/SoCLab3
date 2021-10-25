#include <systemc>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>

INTYPE *A_ = NULL;
INTYPE *B_ = NULL;
OUTTYPE *C_ = NULL;
OUTTYPE *C_golden = NULL;

int Asize, Arow, Acol;
int Bsize, Brow, Bcol;
int Csize, Crow, Ccol;

//split line into values placed into vector
//taken from: https://stackoverflow.com/questions/14265581/parse-split-a-string-in-c-using-string-delimiter-standard-c
vector<string> split(string s, string delimiter);
void clean_mem();

using namespace std;

void main(int argc, char *argv[]){
    //check cmd line args
    //expect ./ex matrices golden
	if(argc != 3){
		cout << "Expected 3 cmd line arguments!\n";
	}else{
		//open matrix files, read in data
		ifstream inf;
		bool B = false;
		bool FL = false;
		int curr_row = 0;
		int curr_col = 0;
		if(!inf.open(argv[1])){
			cout << "Error opening " << argv[1] << endl;
		};
		for(string line; getline(inf, line)){
			if(line == "\n"){
				//delimits A from B
				FL = false;
			}else if(!FL && !B){
				FL = true;
				curr_row = 0;
				curr_col = 0;
				vector<string> v = split(line,' ');
				Asize = stoi(v[0]);
				A_ = new INTYPE[Asize];
				Arow = stoi(v[1]);
				Acol = stoi(v[2]);
			}else if(!FL && B){
				FL = true;
				curr_row = 0;
				curr_col = 0;
				vector<string> v = split(line,' ');
				Bsize = stoi(v[0]);
				B_ = new INTYPE[Bsize];
				Brow = stoi(v[1]);
				Bcol = stoi(v[2]);
			}else if(FL && !B){
				vector<string> v = split(line,' ');	
				curr_col = 0;
				for(vector<string>::iterator it = v.begin(); it!= v.end(); ++it){
					A_[curr_col + curr_row*Acol] = stoi(it);
					curr_col++;
				} 
				curr_row++;
			}else if(FL && B){
				vector<string> v = split(line,' ');	
				curr_col = 0;
				for(vector<string>::iterator it = v.begin(); it!= v.end(); ++it){
					B_[curr_col + curr_row*Bcol] = stoi(it);
					curr_col++;
				} 
				curr_row++;
			}
		}
		if(!inf.close()){
			cout << "Error closing " << argv[1] << endl;
			clean_mem();
			exit(1);
		}
	//C
		FL = false;
		if(!inf.open(argv[2])){
			cout << "Error opening " << argv[2] << endl;
		};
		for(string line; getline(inf, line)){
			if(!FL){
				FL = true;
				curr_row = 0;
				curr_col = 0;
				vector<string> v = split(line,' ');
				Csize = stoi(v[0]);
				Crow = stoi(v[1]);
				Ccol = stoi(v[2]);
				if(Csize != Arow*Bcol){
					cout << "Dimensions do not match!\n";
					clean_mem();
					delete A_;
					delete B_;
					inf.close();
					exit(1);
				}
				C_golden = new OUTTYPE[Csize];
				C_ = new OUTTYPE[Arow*Bcol];
			}else{
				vector<string> v = split(line,' ');	
				curr_col = 0;
				for(vector<string>::iterator it = v.begin(); it!= v.end(); ++it){
					C_golden[curr_col + curr_row*Ccol] = stoi(it);
					curr_col++;
				} 
				curr_row++;
			}
		}
		if(!inf.close()){
			cout << "Error closing " << argv[2] << endl;
			clean_mem();
			exit(1);
		}
	}

    //perform GEMM
	gemm(Arow,Bcol,Acol,A_,Acol,B_,Bcol,C_,Bcol);

    //compare against golden
	bool err = false;
	for(int m = 0; m < Crow; m++){
		for (int n = 0; n < Ccol; n++){
			if (C_[m*Ccol+n] != C_golden[m*Ccol+n]){
				cout << "At row " << m << ", col " << n << " received " << C_[m*Ccol+n] << "but expected " << C_golden[m*Ccol+n] << endl;
				err = true;
			}
		}
	}

    //return status/errors
	clean_mem();
	if (err){
		cout << "Product does not match golden!\n";
		exit(2);
	}else{
		cout << "Product matches golden!\n";
		exit(0);
	}
	
}

vector<string> split(string s, string delimiter) {
    size_t pos_start = 0, pos_end, delim_len = delimiter.length();
    string token;
    vector<string> res;

    while ((pos_end = s.find (delimiter, pos_start)) != string::npos) {
        token = s.substr (pos_start, pos_end - pos_start);
        pos_start = pos_end + delim_len;
        res.push_back (token);
    }

    res.push_back (s.substr (pos_start));
    return res;
}

void clean_mem(){
	if(A_ != NULL){
		delete A_;
	}
	if(B_ != NULL){
		delete B_;
	}
	if(C_ != NULL){
		delete C_;
	}
	if(C_golden != NULL){
		delete C_golden;
	}
}
