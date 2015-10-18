#!/usr/bin/make
#
# combox - paper
#
# Makefile
#
# By Siddharth Ravikumar <sravik@bgsu.edu>
#
# No rights reserved. Dedicated to Public Domain.
# <https://creativecommons.org/publicdomain/zero/1.0/>

F_ALLOC = fallocate
F_ALLOC_OPT = -l

BLOB_DIR = blobs/

# blobs
20MB = $(BLOB_DIR)20MB.blob
30MB = $(BLOB_DIR)30MB.blob
40MB = $(BLOB_DIR)40MB.blob
50MB = $(BLOB_DIR)50MB.blob
60MB = $(BLOB_DIR)60MB.blob
70MB = $(BLOB_DIR)70MB.blob
80MB = $(BLOB_DIR)80MB.blob
90MB = $(BLOB_DIR)90MB.blob
100MB = $(BLOB_DIR)100MB.blob

ALL_BLOBS = $(20MB) $(30MB) $(40MB) $(50MB) $(60MB) $(70MB) \
			$(80MB) $(90MB) $(100MB)


blobs: $(ALL_BLOBS)


$(BLOB_DIR):
	mkdir -p $(BLOB_DIR)


$(20MB): $(BLOB_DIR)
	$(F_ALLOC) $(F_ALLOC_OPT) 20MiB $(20MB)

$(30MB): $(BLOB_DIR)
	$(F_ALLOC) $(F_ALLOC_OPT) 30MiB $(30MB)

$(40MB): $(BLOB_DIR)
	$(F_ALLOC) $(F_ALLOC_OPT) 40MiB $(40MB)

$(50MB): $(BLOB_DIR)
	$(F_ALLOC) $(F_ALLOC_OPT) 50MiB $(50MB)

$(60MB): $(BLOB_DIR)
	$(F_ALLOC) $(F_ALLOC_OPT) 60MiB $(60MB)

$(70MB): $(BLOB_DIR)
	$(F_ALLOC) $(F_ALLOC_OPT) 70MiB $(70MB)

$(80MB): $(BLOB_DIR)
	$(F_ALLOC) $(F_ALLOC_OPT) 80MiB $(80MB)

$(90MB): $(BLOB_DIR)
	$(F_ALLOC) $(F_ALLOC_OPT) 90MiB $(90MB)

$(100MB): $(BLOB_DIR)
	$(F_ALLOC) $(F_ALLOC_OPT) 100MiB $(100MB)


blobs-clean:
	rm -f $(ALL_BLOBS)
	rmdir $(BLOB_DIR)

.PHONY: blobs blobs-clean
