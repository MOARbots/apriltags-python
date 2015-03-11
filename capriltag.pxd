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

	# Functions to get and manipulate detections
