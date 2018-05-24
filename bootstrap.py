import os
import platform

plat=platform.platform()
sys=platform.system()

root=os.path.dirname(os.path.realpath(__file__))

prefix=f'{root}/build/{sys}'

print('fetching external libraries')
os.system('git submodule update --init --recursive')

os.chdir(root + '/externals/ffmpeg')

print("configure ffmpeg, may take a while")
if(sys=='Windows'):
    os.system('sh ./configure --enable-shared --disable-static --disable-programs --disable-asm --disable-postproc --toolchain=msvc')
else:
    os.system('sh ./configure --enable-shared --disable-static --disable-programs --disable-asm --disable-postproc')
os.system('make')

os.chdir(root)
if not os.path.exists('build'):
    os.mkdir('build',)
cmakedir=root
cmakegenerator=''
if(sys=='Windows'):
    dest='build/win32'
    if not os.path.exists(dest):
        os.mkdir(dest)
    cmakedir+='/'+dest
    cmakegenerator='"Visual Studio 15 2017"'
elif(sys=='MacOS'):
    dest='build/mac'
    if not os.path.exists(dest): 
        os.mkdir(dest)
    cmakedir+='/'+dest
    cmakegenerator='Xcode'

os.chdir(cmakedir)
os.system(f'cmake ../.. -G {cmakegenerator}')