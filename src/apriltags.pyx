cimport capriltag

cdef class AprilTagDetector:
	cdef capriltag.apriltag_detector _c_apriltag_detector_t
	def __cinit__(self):
		self._c_apriltag_detector = capriltag.apriltag_detector_create()
		if self._c_apriltag_detector is NULL:
			raise MemoryError()

	def __dealloc__(self):
		if self._c_apriltag_detector is not NULL:
			capriltag.apriltag_detector_destroy(self._c_apriltag_detector)