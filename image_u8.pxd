cdef extern from "image_u8.h":
	ctypedef struct image_u8_t:
		const int width
		const int height
		const int stride
		uint8_t* const buf

	void image_u8_destroy(image_u8* image)