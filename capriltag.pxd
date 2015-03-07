cdef extern from "apriltag.h":
	# The detector itself
	ctypedef struct apriltag_detector_t:
		pass

	# Functions operating on the detector
	apriltag_detector_t* apriltag_detector_create()
	void apriltag_detector_destroy(apriltag_detector_t* td);

