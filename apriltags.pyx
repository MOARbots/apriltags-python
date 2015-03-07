cimport capriltag

cdef class AprilTagDetector:
	# Define a type referencing a struct pointer
	cdef capriltag.apriltag_detector_t* _apriltag_detector_t

	# When the object is initialized by Python
	def __cinit__(self):
		# Create a new detector
		self._apriltag_detector_t = capriltag.apriltag_detector_create()
		# If that call went wrong and didn't return a pointer
		if self._apriltag_detector_t is NULL:
			raise MemoryError()

	# When Python GCs the object
	def __dealloc__(self):
		# As long as the detector succeeded
		if self._apriltag_detector_t is not NULL:
			# Free the struct
			capriltag.apriltag_detector_destroy(self._apriltag_detector_t)