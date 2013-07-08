CFLAGS = -Iinclude -DCD_NO_OLD_INTERFACE -D_WIN32_WINNT=0x0501 \
		 	 -D_WIN32_IE=0x600 -DWINVER=0x0501 -DNOTREEVIEW \
		 	 -DTEC_UNAME=dllw4 -DTEC_SYSNAME=Win32 -DTEC_LITTLEENDIAN \
		 	 -DTEC_32 -DWIN32 -DNDEBUG -D_IUP_PPLOT_

LDFLAGS = -static -Llib -lim -lcdcontextplus -lcd -lfreetype6 -lz -lgdi32 -lcomdlg32 -lcomctl32 \
		  -luuid -lole32 -loleaut32 -limm32 \
		  -lsnmpapi -lWinspool  -lopengl32 -lmsvcrt -lstdc++ -lgdiplus -lws2_32

TARG=iupaio.dll

SOURCE = $(wildcard src/*.c)  
CPPSOURCE = $(wildcard src/*.cpp) 
OBJS = $(patsubst %.c,%.o,$(SOURCE)) 
OBJS += $(patsubst %.cpp,%.o,$(CPPSOURCE)) 

$(TARG):$(OBJS)
	gcc -dll -shared -o $@ $^ $(LDFLAGS)

link:
	gcc -dll -shared -o $(TARG) *.o $(LDFLAGS)

%.o:%.c 
	gcc -c $(CFLAGS) $< -o $@

%.o:%.cpp
	g++ -c $(CFLAGS) $< -o $@

clean:
	rm -rf $(OBJS) *.dll
