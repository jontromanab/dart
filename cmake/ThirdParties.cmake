
FUNCTION(LINK_THIRDPARTY project extpj base)
  IF (MSVC)
    TARGET_LINK_LIBRARIES(${project} debug ${base}_d optimized ${base})
  ELSE()
    TARGET_LINK_LIBRARIES(${project} ${extpj})
  ENDIF()
ENDFUNCTION(LINK_THIRDPARTY)

FUNCTION(LINK_THIRDPARTY_EXT project extpj base)
  LINK_THIRDPARTY(${project} ${extpj} ${base})
  ADD_DEPENDENCIES(${project} ${extpj}-ext)
ENDFUNCTION(LINK_THIRDPARTY_EXT)

FUNCTION(LINK_THIRDPARTY_GLUT project)
if(WIN32 AND NOT CYGWIN)
    set(GLUT_PREFIX_PATH "C:/Golems/")
	include_directories("C:/Golems/include")
	include_directories("C:/Golems/lib")
    target_link_libraries(${project} ${OPENGL_LIBRARIES} glut32)
elseif(UNIX)
    find_package(GLUT REQUIRED)
    include_directories(${GLUT_INCLUDE_DIR})
    target_link_libraries(${project} ${OPENGL_LIBRARIES} ${GLUT_glut_LIBRARY})
endif(	)
ENDFUNCTION(LINK_THIRDPARTY_GLUT)

FUNCTION(LINK_THIRDPARTY_GTEST project)
  ADD_DEPENDENCIES(${project} gtest)
  TARGET_LINK_LIBRARIES(${project} gtest)
ENDFUNCTION(LINK_THIRDPARTY_GTEST)

FUNCTION(LINK_THIRDPARTY_GTEST_MAIN project)
  LINK_THIRDPARTY(${project} gtest_main libgtest_main)
  ADD_DEPENDENCIES(${project} gtest_main)
  TARGET_LINK_LIBRARIES(${project} gtest_main)
ENDFUNCTION(LINK_THIRDPARTY_GTEST_MAIN)

FUNCTION(LINK_THIRDPARTY_TINYXML2 project)
  ADD_DEPENDENCIES(${project} tinyxml2static)
  TARGET_LINK_LIBRARIES(${project} tinyxml2static)
ENDFUNCTION(LINK_THIRDPARTY_TINYXML2)


FUNCTION(LINK_THIRDPARTY_TINYXML project)
  ADD_DEPENDENCIES(${project} tinyxmlstatic)
  TARGET_LINK_LIBRARIES(${project} tinyxmlstatic)
ENDFUNCTION(LINK_THIRDPARTY_TINYXML)

