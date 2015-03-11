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

cdef extern from "apriltag.h":
	# The detector itself
	ctypedef struct apriltag_detector_t:
		pass

	# Detector constructor and destructor
	apriltag_detector_t* apriltag_detector_create()
	void apriltag_detector_destroy(apriltag_detector_t* td);

	# Tag family structure
	ctypedef struct apriltag_family_t:
		pass

	# Functions to use the tag family
	void apriltag_detector_add_family(apriltag_detector_t* td, apriltag_family_t* fam);
	void apriltag_detector_remove_family(apriltag_detector_t* td, apriltag_family_t* fam);
	void apriltag_detector_clear_families(apriltag_detector_t* td);