cimport capriltag

# Giant block of cdefs for all the tag families

cdef extern from "tag16h5.h":
	capriltag.apriltag_family_t* tag16h5_create();

cdef extern from "tag25h7.h":
	capriltag.apriltag_family_t* tag25h7_create();

cdef extern from "tag25h9.h":
	capriltag.apriltag_family_t* tag25h9_create();

cdef extern from "tag36artoolkit.h":
	capriltag.apriltag_family_t* tag36artoolkit_create();

cdef extern from "tag36h10.h":
	capriltag.apriltag_family_t* tag36h10_create();

cdef extern from "tag36h11.h":
	capriltag.apriltag_family_t* tag36h11_create();