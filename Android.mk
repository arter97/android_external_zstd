LOCAL_PATH := $(call my-dir)

common_c_flags := -O3 \
	-Wall -Wextra \
	-Wcast-qual -Wcast-align \
	-Wshadow -Wstrict-aliasing=1 -Wswitch-enum \
	-Wundef \
	-DZSTD_LEGACY_SUPPORT=4 -DNDEBUG -DXXH_NAMESPACE=ZSTD_ -DZSTD_MULTITHREAD
common_c_only_flags := -Wdeclaration-after-statement -Wstrict-prototypes

common_includes := \
	$(LOCAL_PATH)/lib \
	$(LOCAL_PATH)/lib/common \
	$(LOCAL_PATH)/lib/dictBuilder \
	$(LOCAL_PATH)/lib/legacy \
	$(LOCAL_PATH)/programs

include $(CLEAR_VARS)
LOCAL_MODULE := libzstd
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \
	lib/common/debug.c \
	lib/common/entropy_common.c \
	lib/common/error_private.c \
	lib/common/fse_decompress.c \
	lib/common/pool.c \
	lib/common/threading.c \
	lib/common/xxhash.c \
	lib/common/zstd_common.c \
	lib/compress/fse_compress.c \
	lib/compress/hist.c \
	lib/compress/huf_compress.c \
	lib/compress/zstd_compress.c \
	lib/compress/zstd_double_fast.c \
	lib/compress/zstd_fast.c \
	lib/compress/zstd_lazy.c \
	lib/compress/zstd_ldm.c \
	lib/compress/zstd_opt.c \
	lib/compress/zstdmt_compress.c \
	lib/decompress/huf_decompress.c \
	lib/decompress/zstd_decompress.c \
	lib/deprecated/zbuff_common.c \
	lib/deprecated/zbuff_compress.c \
	lib/deprecated/zbuff_decompress.c \
	lib/dictBuilder/cover.c \
	lib/dictBuilder/divsufsort.c \
	lib/dictBuilder/zdict.c \
	lib/legacy/zstd_v04.c \
	lib/legacy/zstd_v05.c \
	lib/legacy/zstd_v06.c \
	lib/legacy/zstd_v07.c
LOCAL_C_INCLUDES := $(common_includes)
LOCAL_CFLAGS := $(common_c_flags)
LOCAL_CONLYFLAGS := $(common_c_only_flags)
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := zstd
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \
	programs/bench.c \
	programs/datagen.c \
	programs/dibio.c \
	programs/fileio.c \
	programs/zstdcli.c
LOCAL_STATIC_LIBRARIES := libzstd
LOCAL_C_INCLUDES := $(common_includes)
LOCAL_CFLAGS := $(common_c_flags)
LOCAL_CONLYFLAGS := $(common_c_only_flags)
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
include $(BUILD_EXECUTABLE)
