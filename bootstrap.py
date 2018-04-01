import os

root=os.path.dirname(os.path.realpath(__file__))
sys='osx'
prefix=f'{root}/build/{sys}'

print('============ fetching external libraries ==============')
os.system('git submodule update --init --recursive')

#build external libs
os.system('python externals/build_all.py')

#build mlt
os.system(f'export PKG_CONFIG_PATH={root}/externals/build/{sys}/lib/pkgconfig && \
            ./configure --prefix={prefix} && make && make install')