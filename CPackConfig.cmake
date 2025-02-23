set(CPACK_PACKAGE_NAME "MyProject")
set(CPACK_PACKAGE_VERSION "1.0.0")
set(CPACK_PACKAGE_CONTACT "developer@example.com")

set(CPACK_GENERATOR "ZIP;TGZ;DEB;RPM")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Developer Name")
set(CPACK_RPM_PACKAGE_LICENSE "MIT")

install(TARGETS MyProject DESTINATION bin)
install(FILES include/MyLibrary.h DESTINATION include)

include(CPack)
