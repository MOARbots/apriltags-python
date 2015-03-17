cdef extern from "zarray.h":
	ctypedef struct zarray_t:
		size_t el_sz
		int size
		int alloc
		char *data

	zarray_t* zarray_create(size_t el_sz);
	void zarray_destroy(zarray_t* za);
	bint zarray_isempty(const zarray_t* za);
	void zarray_add(zarray_t* za, const void* p);
	void zarray_get(const zarray_t* za, int idx, void *p);