cmake_minimum_required ( VERSION 2.8.5 )
project ( luaext )

add_subdirectory ( luafilesystem )
if (MOAI_SQLITE3)
    add_subdirectory ( luasql )
endif (MOAI_SQLITE3)
add_subdirectory ( luacurl )
add_subdirectory ( luasocket )
