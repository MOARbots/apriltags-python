cimport capriltag
cimport tags
cimport zarray

cdef class AprilTagFamily:
	cdef capriltag.apriltag_family_t* _apriltag_family
	def __cinit__(self, tagname):
		if tagname == "tag16h5":
			self._apriltag_family = tags.tag16h5_create();
		elif tagname == "tag25h7":
			self._apriltag_family = tags.tag25h7_create();
		elif tagname == "tag25h9":
			self._apriltag_family = tags.tag25h9_create();
		elif tagname == "tag36artoolkit":
			self._apriltag_family = tags.tag36artoolkit_create();
		elif tagname == "tag36h10":
			self._apriltag_family = tags.tag36h10_create();
		elif tagname == "tag36h11":
			self._apriltag_family = tags.tag36h11_create();

#cdef class AprilTagDetection:


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

	def add_family(self, AprilTagFamily tag_family not None):
		capriltag.apriltag_detector_add_family(self._apriltag_detector, tag_family._apriltag_family)

	property nthreads:
		def __get__(self):
			return self._apriltag_detector.nthreads
		def __set__(self, int nthreads):
			self._apriltag_detector.nthreads = nthreads

	property quad_decimate:
		def __get__(self):
			return self._apriltag_detector.quad_decimate
		def __set__(self, float quad_decimate):
			self._apriltag_detector.quad_decimate = quad_decimate

	property quad_sigma:
		def __get__(self):
			return self._apriltag_detector.quad_sigma
		def __set__(self, float quad_sigma):
			self._apriltag_detector.quad_sigma = quad_sigma

	property refine_decode:
		def __get__(self):
			return self._apriltag_detector.refine_decode
		def __set__(self, bint refine_decode):
			self._apriltag_detector.refine_decode = refine_decode

	property debug:
		def __get__(self):
			return self._apriltag_detector.debug
		def __set__(self, bint debug):
			self._apriltag_detector.debug = debug

	def detect(AprilTagImage image not None):
		zarray* zdetections = capriltag.apriltag_detector_detect(self._apriltag_detector, image._image_u8)
		detections = []
		for i in range(0, zarray.zarray_size(zdetections)):
			capriltag.apriltag_detection_t* detection
			zarray_get(zdetections, i, &detection)
			detections.append(AprilTagDetection(detection))