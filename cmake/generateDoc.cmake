find_package(Doxygen REQUIRED dot)

macro(generate_documentation DOX_CONFIG_FILE)
    if(NOT EXISTS "${DOX_CONFIG_FILE}")
        message(FATAL_ERROR "Doxygen configuration file not found: ${DOX_CONFIG_FILE}")
    endif()

    # Define project-specific paths
    set(INCDIR  "${PROJECT_SOURCE_DIR}/include")
    set(SRCDIR  "${PROJECT_SOURCE_DIR}/src")
    set(ROOTDIR "${PROJECT_SOURCE_DIR}")
    set(BINDIR  "${PROJECT_BINARY_DIR}")

    # Configure Doxygen input file
    configure_file(${DOX_CONFIG_FILE} ${CMAKE_CURRENT_BINARY_DIR}/doxy.config @ONLY)

    # Define the documentation target
    set(DOXY_CONFIG "${CMAKE_CURRENT_BINARY_DIR}/doxy.config")
    add_custom_target(doc
        COMMAND ${DOXYGEN_EXECUTABLE} ${DOXY_CONFIG}
        WORKING_DIRECTORY ${PROJECT_BINARY_DIR}
        COMMENT "Generating API documentation with Doxygen"
        VERBATIM
    )

    # Define the documentation installation path
    if(NOT DEFINED CMAKE_INSTALL_DOCDIR)
        set(CMAKE_INSTALL_DOCDIR "${CMAKE_INSTALL_PREFIX}/share/doc/${PROJECT_NAME}")
    endif()

    # Install documentation (optional)
    install(DIRECTORY "${PROJECT_BINARY_DIR}/doc/html/" DESTINATION "${CMAKE_INSTALL_DOCDIR}")

    # Ensure documentation files are cleaned up
    set_property(DIRECTORY APPEND PROPERTY ADDITIONAL_MAKE_CLEAN_FILES doc)
endmacro()

