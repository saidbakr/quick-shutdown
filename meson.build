project('com.github.saidbakr.quick-shutdown', 'vala', 'c')
sources = files('src/Application.vala')
sources += import( 'gnome' ).compile_resources('mycss','data/quick-shutdown.gresource.xml','data')


executable(
    meson.project_name(),
    sources,
    dependencies: [
        dependency('gtk+-3.0'),
        meson.get_compiler('vala').find_library('posix')

    ],
    
    
    install: true
)
install_data(
    join_paths('data', meson.project_name() + '.desktop'),
    install_dir: join_paths(get_option('datadir'), 'applications')
)

install_data(
    join_paths('data', meson.project_name()+ '.appdata.xml'),
    install_dir: join_paths(get_option('datadir'), 'metainfo')
)



