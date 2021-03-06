from zarray cimport zarray_t

cdef extern from "apriltag.h":
	# The detector itself
	ctypedef struct apriltag_detector_t:
		int nthreads
		float quad_decimate;
		float quad_sigma;
		bint refine_decode;
		int refine_pose;
		bint debug;

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

	# Detection structure
	ctypedef struct apriltag_detection_t:
		pass

	# Functions to get and manipulate detections
	zarray_t* apriltag_detector_detect(apriltag_detector_t* td, image_u8_t* im)