cimport capriltag

cdef class AprilTagFamily:
	cdef capriltag.apriltag_family_t _apriltag_family
	def __cinit__(self, tagname):
		if tagname == "tag16h5":
			print "tag16h5"


cdef class AprilTagDetector:
	# Define a type referencing a struct pointer
	cdef capriltag.apriltag_detector_t* _apriltag_detector

	# When the object is initialized by Python
	def __cinit__(self):
		# Create a new detector
		self._apriltag_detector = capriltag.apriltag_detector_create()
		# If that call went wrong and didn't return a pointer
		if self._apriltag_detector is NULL:
			raise MemoryError()

	# When Python GCs the object
	def __dealloc__(self):
		# As long as the detector succeeded
		if self._apriltag_detector is not NULL:
			# Free the struct
			capriltag.apriltag_detector_destroy(self._apriltag_detector)