#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define ROW 13
#define COLUMN 13
#include "SimulinkC.h"

int maze [13][13];
int xs [13]= {-1,4,6,8,12,12,12,8,6,4,0,0,0};
int ys [13] = {-1,12,12,12,8,6,4,0,0,0,4,6,8};
void print_maze()
{
    int i,j;
    for (i = 0; i < ROW; i++)
    {
        for (j = 0; j < COLUMN; j++)
            printf("%3d", maze[i][j]);
        putchar('\n');
    }
}
void init_base_maze()
{
    int m[13][13] = {{-1,-1,-1,-1,0,-1,0,-1,0,-1,-1,-1,-1},
                    {-1,-1,-1,-1,0,-1,0,-1,0,-1,-1,-1,-1},
                    {-1,-1,0,0,0,0,0,0,0,0,0,-1,-1},
                    {-1,-1,0,-1,0,-1,0,-1,0,-1,0,-1,-1},
                    {0,0,0,0,0,0,0,0,0,0,0,0,0},
                    {-1,-1,0,-1,0,-1,0,-1,0,-1,0,-1,-1},
                    {0,0,0,0,0,0,0,0,0,0,0,0,0},
                    {-1,-1,0,-1,0,-1,0,-1,0,-1,0,-1,-1},
                    {0,0,0,0,0,0,0,0,0,0,0,0,0},
                    {-1,-1,0,-1,0,-1,0,-1,0,-1,0,-1,-1},
                    {-1,-1,0,0,0,0,0,0,0,0,0,-1,-1},
                    {-1,-1,-1,-1,0,-1,0,-1,0,-1,-1,-1,-1},
                    {-1,-1,-1,-1,0,-1,0,-1,0,-1,-1,-1,-1}
                    };

    memcpy(&maze,&m,sizeof(int)*13*13);
}
int valid_coordinate(int x, int y,int i)
{
    if (maze[y][x] <= i && maze[y][x] != 0)
    {
        return 0;
    }
    if (x >= 0 && x < 13 && y >= 0 && y < 13)
    {
        return 1;
    }
    return 0;
}
void wavefront_recursive(int x,int y,int f_target,int i)
{
    maze[y][x]=i;
    if (xs[f_target]!= x||ys[f_target]!=y)
    {
        int nx = x-1;
        int ny = y;
        if (valid_coordinate(nx,ny,i))
        {
            wavefront_recursive(nx,ny,f_target,i+1);
        }
        nx = x+1;
        if (valid_coordinate(nx,ny,i))
        {
            wavefront_recursive(nx,ny,f_target,i+1);
        }
        nx = x;
        ny = y-1;
        if (valid_coordinate(nx,ny,i))
        {
            wavefront_recursive(nx,ny,f_target,i+1);
        }
        ny = y+1;
        if (valid_coordinate(nx,ny,i))
        {
            wavefront_recursive(nx,ny,f_target,i+1);
        }
    }
}
void wavefront_recursive_s(int x,int y,int s_target,int i)
{
    maze[y][x]=i;
    if (xs[s_target]!= x||ys[s_target]!=y)
    {
        int nx = x-1;
        int ny = y;
        if (valid_coordinate(nx,ny,i))
        {
            wavefront_recursive(nx,ny,s_target,i+1);
        }
        nx = x+1;
        if (valid_coordinate(nx,ny,i))
        {
            wavefront_recursive(nx,ny,s_target,i+1);
        }
        nx = x;
        ny = y-1;
        if (valid_coordinate(nx,ny,i))
        {
            wavefront_recursive(nx,ny,s_target,i+1);
        }
        ny = y+1;
        if (valid_coordinate(nx,ny,i))
        {
            wavefront_recursive(nx,ny,s_target,i+1);
        }
    }
}
void wavefront_recursive_l(int x,int y,int l_target,int i)
{
    maze[y][x]=i;
    if (xs[l_target]!= x||ys[l_target]!=y)
    {
        int nx = x-1;
        int ny = y;
        if (valid_coordinate(nx,ny,i))
        {
            wavefront_recursive(nx,ny,l_target,i+1);
        }
        nx = x+1;
        if (valid_coordinate(nx,ny,i))
        {
            wavefront_recursive(nx,ny,l_target,i+1);
        }
        nx = x;
        ny = y-1;
        if (valid_coordinate(nx,ny,i))
        {
            wavefront_recursive(nx,ny,l_target,i+1);
        }
        ny = y+1;
        if (valid_coordinate(nx,ny,i))
        {
            wavefront_recursive(nx,ny,l_target,i+1);
        }
    }
}
void wavefront(int start,int f_target)
{
    int x = xs[start];
    int y = ys[start];
    int i = 1;
    wavefront_recursive(x,y,f_target,i);


}
void wavefront_s(int f_target,int s_target)
{
    int x = xs[f_target];
    int y = ys[f_target];
    int i = 1;
    wavefront_recursive_s(x,y,s_target,i);


}
void wavefront_l(int s_target,int l_target)
{
    int x = xs[s_target];
    int y = ys[s_target];
    int i = 1;
    wavefront_recursive_l(x,y,l_target,i);


}
void print_intersection(int x,int y)
{
    if (x < 2 || x > 10 || x%2 == 1 || y < 2 || y > 10 || y%2 == 1)
    {
        return;
    }
    printf("c%d%d ", y/2-1,x/2-1);
}
void get_path_recursive(int x, int y, int l)
{
    if (l > 1)
    {
        int nx = x-1;
        int ny = y;
        if (valid_coordinate(nx,ny,-2))
        {
           if (maze[ny][nx] == l-1)
           {
                get_path_recursive(nx,ny,l-1);
                print_intersection(nx,ny);
                return;
           }
        }
        nx = x+1;
        if (valid_coordinate(nx,ny,-2))
        {
            if (maze[ny][nx] == l-1)
           {
                get_path_recursive(nx,ny,l-1);
                print_intersection(nx,ny);
                return;
           }
        }
        nx = x;
        ny = y-1;
        if (valid_coordinate(nx,ny,-2))
        {
            if (maze[ny][nx] == l-1)
           {
                get_path_recursive(nx,ny,l-1);
                print_intersection(nx,ny);
                return;
           }
        }
        ny = y+1;
        if (valid_coordinate(nx,ny,-2))
        {
            if (maze[ny][nx] == l-1)
           {
                get_path_recursive(nx,ny,l-1);
                print_intersection(nx,ny);
                return;
           }
        }
    }
}
void get_path_f(int f_target)
{
    int x = xs[f_target];
    int y = ys[f_target];
    int l = maze[ys[f_target]][xs[f_target]];
    get_path_recursive(x,y,l);
    printf("\n");
}
void get_path_s(int s_target)
{
    int x = xs[s_target];
    int y = ys[s_target];
    int l = maze[ys[s_target]][xs[s_target]];
    get_path_recursive(x,y,l);
    printf("\n");
}

void get_path_l(int l_target)
{
    int x = xs[l_target];
    int y = ys[l_target];
    int l = maze[ys[l_target]][xs[l_target]];
    get_path_recursive(x,y,l);
    printf("\n");
}

void block_edge(char* inp)
{
    char string[400];
    strcpy(string, inp);

    const char delim[2] = " ";
    char*current_symbol = strtok(string,delim);
    int blocks = atoi(current_symbol);
    int i = 0;
    for (i = 0; i < blocks; i++)
    {
        int y = atoi(strtok(NULL," "));
        int x = atoi(strtok(NULL," "));
        char*direction = strtok(NULL, " \n");
        y = (y +1)*2;
        x = (x+1)*2;
        if (!strcmp(direction,"n"))
        {
            y--;
        }
        else if (!strcmp(direction,"s"))
        {
            y++;
        }
        else if (!strcmp(direction,"w"))
        {
            x--;
        }
        else if (!strcmp(direction,"e"))
        {
            x++;
        }
        maze[y][x] = -1;
    }
}
void soft_reset (char* in)
{
       int m[13][13] = {{-1,-1,-1,-1,0,-1,0,-1,0,-1,-1,-1,-1},
                    {-1,-1,-1,-1,0,-1,0,-1,0,-1,-1,-1,-1},
                    {-1,-1,0,0,0,0,0,0,0,0,0,-1,-1},
                    {-1,-1,0,-1,0,-1,0,-1,0,-1,0,-1,-1},
                    {0,0,0,0,0,0,0,0,0,0,0,0,0},
                    {-1,-1,0,-1,0,-1,0,-1,0,-1,0,-1,-1},
                    {0,0,0,0,0,0,0,0,0,0,0,0,0},
                    {-1,-1,0,-1,0,-1,0,-1,0,-1,0,-1,-1},
                    {0,0,0,0,0,0,0,0,0,0,0,0,0},
                    {-1,-1,0,-1,0,-1,0,-1,0,-1,0,-1,-1},
                    {-1,-1,0,0,0,0,0,0,0,0,0,-1,-1},
                    {-1,-1,-1,-1,0,-1,0,-1,0,-1,-1,-1,-1},
                    {-1,-1,-1,-1,0,-1,0,-1,0,-1,-1,-1,-1}
                    };

    memcpy(&maze,&m,sizeof(int)*13*13);
    block_edge(in);
}
char readByte(HANDLE hSerial) {
    DWORD dwBytesRead = 0;
    char byteBuffer2[2]={0};
    while ( 1 ) {
        if (!ReadFile_EPO2(hSerial, byteBuffer2, 1, &dwBytesRead, NULL))
        {
            printf("error reading byte from input buffer \n");
        }
        if (byteBuffer2[0] != 0){
            break;
        }
    }
    printf("Read %c from Simulink\n", byteBuffer2[0]);
    return(byteBuffer2[0]);
}

int writeByte(HANDLE hSerial, char buffWrite){
    DWORD dwBytesWritten = 0;
    char byteBuffer1[2]={0};
    byteBuffer1[0]=buffWrite;
    if (!WriteFile_EPO2(hSerial, byteBuffer1, 1, &dwBytesWritten, NULL))
    {
        printf("error writing byte to output buffer \n");
    }
    printf("Wrote %c to Simulink", byteBuffer1[0]);
    return(0);
}
int main()
{   init_base_maze();
    char input[400];
    gets(input);

    int start;
    int f_target;
    int s_target;
    int l_target;
    int i,x,y;

    scanf("%d %d %d %d",&start,&f_target, &s_target, &l_target);
    /* char input[15] = "2 2 0 s 2 3 e\n"; */
    block_edge(input);

    wavefront(start,f_target);

    get_path_f(f_target);
    print_maze();
    HANDLE hSerial;
    char byteBuffer[BUFSIZ+1];

    Setup_EPO2(hSerial);

    for (i=0;i<400;i++)
    {
        /* Ask the user for a character input */
        /*gets(byteBuffer);*/

        /* Write the byte to the robot */
        writeByte(hSerial, byteBuffer[0]);

        /* Read a byte back from the robot */
        byteBuffer[0] = readByte(hSerial);

        if(xs[f_target]== x||ys[f_target]==y)
        {
            continue;
        }
    }

    soft_reset(input);


    wavefront_s(f_target, s_target);

    get_path_s(s_target);
    for (i=0;i<400;i++)
    {
        /* Ask the user for a character input */
        /*gets(byteBuffer);

        /* Write the byte to the robot */
        writeByte(hSerial, byteBuffer[0]);

        /* Read a byte back from the robot */
        byteBuffer[0] = readByte(hSerial);

        if(xs[f_target]== x||ys[f_target]==y)
        {
            continue;
        }
    }
    print_maze();



    soft_reset(input);



    wavefront_l(s_target, l_target);

    get_path_l(l_target);
    for (i=0;i<400;i++)
    {
        /* Ask the user for a character input */
        /*gets(byteBuffer);

        /* Write the byte to the robot */
        writeByte(hSerial, byteBuffer[0]);

        /* Read a byte back from the robot */
        byteBuffer[0] = readByte(hSerial);

        if(xs[f_target]== x||ys[f_target]==y)
        {
            continue;
        }
    }

    print_maze();

    return 0;
}
