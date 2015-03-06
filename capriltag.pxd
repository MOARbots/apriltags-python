cdef extern from "apriltag/apriltag.h":
	ctypedef struct apriltag_detector_t:
		pass
	ctypedef struct apriltag_detection_t:
		pass
	ctypedef struct apriltag_family_t:
		pass

	apriltag_detector_t apriltag_detector_create();

	void apriltag_detector_add_family(apriltag_detector_t *td, apriltag_family_t *fam);
	void apriltag_detector_remove_family(apriltag_detector_t *td, apriltag_family_t *fam);
	void apriltag_detector_clear_families(apriltag_detector_t *td);
	void apriltag_detector_destroy(apriltag_detector_t *td);
	#zarray_t *apriltag_detector_detect(apriltag_detector_t *td, image_u8_t *im_orig);
	
	void apriltag_detection_destroy(apriltag_detection_t *det);
