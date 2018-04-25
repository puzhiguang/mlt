#ifndef LIBGEN_H
#define LIBGEN_H

#ifdef __cplusplus
extern "C" {
#endif
#if defined(_WIN32)
	#define basename(x) ((x))
#endif
#ifdef __cplusplus
}
#endif

#endif /* LIBGEN_H */
