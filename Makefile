NAME=texworks-templates-japanese
VERSION=$(shell date +%Y%m%d)
REVISION=$(shell LC_ALL=C svn info 2> /dev/null | grep Revision | cut -d' ' -f2)

DESTDIR=

all:

tarxz: clean
	cd .. && rm -rf ${NAME}-${VERSION}
	cd .. && cp -arf ${NAME} ${NAME}-${VERSION}
	cd .. && \
	    tar --exclude CVS --exclude .svn --exclude .git \
	        -cf - ${NAME}-${VERSION} | xz -9 > ${NAME}-${VERSION}.tar.xz
	cd .. && rm -rf ${NAME}-${VERSION}

clean:
	find . -name *~ -exec rm -f {} \;
