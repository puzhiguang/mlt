import os

root=os.path.dirname(os.path.realpath(__file__))
sys='osx'
prefix=f'{root}/build/{sys}'

def switch_dir(dir):
    if(os.path.exists(dir)):
        os.chdir(dir)
        print(f'switched to {dir}')
        return True
    return False

os.chdir(root)
#build sdl2
if(switch_dir(f'{root}/sdl2')):
    os.system(f'./configure --prefix={prefix}')
    os.system('make && make install')

#build ffmpeg
if(switch_dir(f'{root}/ffmpeg')):
    os.system(f'./configure --prefix={prefix} --enable-shared --disable-static --disable-programs --enable-nonfree')
    os.system('make && make install')
