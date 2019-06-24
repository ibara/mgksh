# mgksh Makefile.

CC =		cc
CFLAGS =	-O2 -pipe -DEMACS -DVI -DREGEX
LDFLAGS =	-static
PREFIX =	/usr/local
MANDIR =	/usr/local/man
PROG =		mgksh

# ksh
OBJS =	alloc.o asprintf.o c_ksh.o c_sh.o c_test.o c_ulimit.o edit.o \
	emacs.o eval.o exec.o expr.o history.o io.o jobs.o lex.o mail.o \
	main.o misc.o path.o shf.o syn.o table.o trap.o tree.o tty.o var.o \
	version.o vi.o confstr.o reallocarray.o siglist.o signame.o \
	strlcat.o strlcpy.o strtonum.o unvis.o vis.o

# mg
OBJS +=	mg_autoexec.o mg_basic.o mg_bell.o mg_buffer.o mg_cinfo.o mg_dir.o mg_display.o \
	mg_echo.o mg_extend.o mg_file.o mg_fileio.o mg_funmap.o mg_help.o mg_kbd.o mg_keymap.o \
	mg_line.o mg_macro.o mg_main.o mg_match.o mg_modes.o mg_paragraph.o mg_re_search.o \
	mg_region.o mg_search.o mg_spawn.o mg_tty.o mg_ttyio.o mg_ttykbd.o mg_undo.o mg_util.o \
	mg_version.o mg_window.o mg_word.o mg_yank.o mg_cmode.o mg_cscope.o mg_dired.o \
	mg_grep.o mg_tags.o mg_fparseln.o mg_fstatat.o mg_futimens.o mg_getline.o \
	mg_reallocarray.o mg_strlcat.o mg_strlcpy.o mg_strndup.o mg_strtonum.o \
	mg_extensions.o

ETS =	`grep -w ${PREFIX}/bin/${PROG} /etc/shells > /dev/null; \
	[ $$? -ne 0 ] && echo "${PREFIX}/bin/${PROG}" >> /etc/shells`

all: ${PROG}

${PROG}: ${OBJS}
	${CC} ${LDFLAGS} -o ${PROG} ${OBJS} ./ncurses/lib/libncursesw.a -lutil

install:
	install -d ${DESTDIR}${PREFIX}/bin
	install -d ${DESTDIR}${MANDIR}/man1
	install -c -s -m 755 ${PROG} ${DESTDIR}${PREFIX}/bin
	install -c -m 644 oksh.1 ${DESTDIR}${MANDIR}/man1/${PROG}.1
	@echo "Please add /usr/local/bin/oksh to /etc/shells"

test:
	echo "No tests"

clean:
	rm -f ${PROG} ${OBJS}

distclean: clean
	rm -f Makefile pconfig.h
