Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA5A2DE8F2
	for <lists+dm-devel@lfdr.de>; Fri, 18 Dec 2020 19:37:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608316627;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SO4269e55DtoM5XffbiegF9nvFo6RnyMUMunRhtssDc=;
	b=OGpSqyY2jZCRbmZfM9JHX32iEvt/ZOR7tEm9kBlV6UblvTGlOtG9p9Y8Q+mwwz9YK5v3FS
	FRpwWzwtmNX21pmR1fq4+C4vkVTM1kVCr7whXpiMitIBcMUSPKNQEELC1scptFYHgHSn3u
	FPdKBnbJqRWVrtDBy27GXUd+pLw+WDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-q3xgnkPPMXu-E-DADxuyvw-1; Fri, 18 Dec 2020 13:37:05 -0500
X-MC-Unique: q3xgnkPPMXu-E-DADxuyvw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A82A7803642;
	Fri, 18 Dec 2020 18:36:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFD955C1C5;
	Fri, 18 Dec 2020 18:36:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 13D79180954D;
	Fri, 18 Dec 2020 18:36:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BIIadSt002006 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Dec 2020 13:36:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4590E60C5F; Fri, 18 Dec 2020 18:36:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DB8860C47;
	Fri, 18 Dec 2020 18:36:35 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0BIIaYPQ008488; 
	Fri, 18 Dec 2020 12:36:34 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0BIIaXU7008487;
	Fri, 18 Dec 2020 12:36:33 -0600
Date: Fri, 18 Dec 2020 12:36:33 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20201218183633.GM3103@octiron.msp.redhat.com>
References: <20201217110018.3347-1-mwilck@suse.com>
	<20201217110018.3347-7-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20201217110018.3347-7-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 6/7] multipath-tools: make sure plugin DSOs
 use symbol versions
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 17, 2020 at 12:00:17PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> By adding -Wl,-z,defs, we'll get warnings about unresolved symbols
> at the linking stage. This way we make sure our plugins (checkers etc.)
> will use versioned symbols from libmultipath, and incompatible plugins
> can't be loaded any more. Doing this requires explicitly linking
> the plugins with all libraries they use, in particular libmultipath.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  Makefile                           | 1 +
>  Makefile.inc                       | 2 +-
>  libmpathpersist/Makefile           | 8 ++++----
>  libmultipath/checkers/Makefile     | 7 +++----
>  libmultipath/foreign/Makefile      | 4 +++-
>  libmultipath/prioritizers/Makefile | 7 +++----
>  6 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index f127ff9..bddb2bf 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -31,6 +31,7 @@ $(BUILDDIRS):
>  
>  libmultipath libdmmp: libmpathcmd
>  libmpathpersist libmpathvalid multipath multipathd: libmultipath
> +libmultipath/prioritizers libmultipath/checkers libmultipath/foreign: libmultipath
>  mpathpersist multipathd:  libmpathpersist
>  
>  libmultipath/checkers.install \
> diff --git a/Makefile.inc b/Makefile.inc
> index 13587a9..0542930 100644
> --- a/Makefile.inc
> +++ b/Makefile.inc
> @@ -105,7 +105,7 @@ CFLAGS		:= --std=gnu99 $(CFLAGS) $(OPTFLAGS) $(WARNFLAGS) -pipe \
>  BIN_CFLAGS	= -fPIE -DPIE
>  LIB_CFLAGS	= -fPIC
>  SHARED_FLAGS	= -shared
> -LDFLAGS		:= $(LDFLAGS) -Wl,-z,relro -Wl,-z,now
> +LDFLAGS		:= $(LDFLAGS) -Wl,-z,relro -Wl,-z,now -Wl,-z,defs
>  BIN_LDFLAGS	= -pie
>  
>  # Check whether a function with name $1 has been declared in header file $2.
> diff --git a/libmpathpersist/Makefile b/libmpathpersist/Makefile
> index 456ce4c..57103e5 100644
> --- a/libmpathpersist/Makefile
> +++ b/libmpathpersist/Makefile
> @@ -6,17 +6,17 @@ LIBS = $(DEVLIB).$(SONAME)
>  VERSION_SCRIPT := libmpathpersist.version
>  
>  CFLAGS += $(LIB_CFLAGS) -I$(multipathdir) -I$(mpathpersistdir) -I$(mpathcmddir)
> +LDFLAGS += -L$(multipathdir) -L$(mpathcmddir)
>  
> -LIBDEPS += -lpthread -ldevmapper -ldl -L$(multipathdir) -lmultipath \
> -	   -L$(mpathcmddir) -lmpathcmd
> +LIBDEPS += -lmultipath -lmpathcmd -ldevmapper -lpthread -ldl
>  
>  OBJS = mpath_persist.o mpath_updatepr.o mpath_pr_ioctl.o
>  
>  all: $(DEVLIB) man
>  
>  $(LIBS): $(OBJS) $(VERSION_SCRIPT)
> -	$(CC) $(LDFLAGS) $(SHARED_FLAGS) $(LIBDEPS) -Wl,-soname=$@ \
> -		-Wl,--version-script=$(VERSION_SCRIPT) -o $@ $(OBJS)
> +	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -Wl,-soname=$@ \
> +		-Wl,--version-script=$(VERSION_SCRIPT) -o $@ $(OBJS) $(LIBDEPS)
>  
>  $(DEVLIB): $(LIBS)
>  	$(LN) $(LIBS) $@
> diff --git a/libmultipath/checkers/Makefile b/libmultipath/checkers/Makefile
> index 01c0451..8e0ed5e 100644
> --- a/libmultipath/checkers/Makefile
> +++ b/libmultipath/checkers/Makefile
> @@ -4,6 +4,8 @@
>  include ../../Makefile.inc
>  
>  CFLAGS += $(LIB_CFLAGS) -I..
> +LDFLAGS += -L.. -lmultipath
> +LIBDEPS = -lmultipath -laio -lpthread -lrt
>  
>  # If you add or remove a checker also update multipath/multipath.conf.5
>  LIBS= \
> @@ -17,11 +19,8 @@ LIBS= \
>  
>  all: $(LIBS)
>  
> -libcheckdirectio.so: directio.o
> -	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^ -laio
> -
>  libcheck%.so: %.o
> -	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^
> +	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^ $(LIBDEPS)
>  
>  install:
>  	$(INSTALL_PROGRAM) -m 755 $(LIBS) $(DESTDIR)$(libdir)
> diff --git a/libmultipath/foreign/Makefile b/libmultipath/foreign/Makefile
> index fae58a0..f447a1c 100644
> --- a/libmultipath/foreign/Makefile
> +++ b/libmultipath/foreign/Makefile
> @@ -5,13 +5,15 @@ TOPDIR=../..
>  include ../../Makefile.inc
>  
>  CFLAGS += $(LIB_CFLAGS) -I.. -I$(nvmedir)
> +LDFLAGS += -L..
> +LIBDEPS = -lmultipath -ludev -lpthread -lrt
>  
>  LIBS = libforeign-nvme.so
>  
>  all: $(LIBS)
>  
>  libforeign-%.so: %.o
> -	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^
> +	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^ $(LIBDEPS)
>  
>  install:
>  	$(INSTALL_PROGRAM) -m 755 $(LIBS) $(DESTDIR)$(libdir)
> diff --git a/libmultipath/prioritizers/Makefile b/libmultipath/prioritizers/Makefile
> index fc6e0e0..8d34ae3 100644
> --- a/libmultipath/prioritizers/Makefile
> +++ b/libmultipath/prioritizers/Makefile
> @@ -4,6 +4,8 @@
>  include ../../Makefile.inc
>  
>  CFLAGS += $(LIB_CFLAGS) -I..
> +LDFLAGS += -L..
> +LIBDEPS = -lmultipath -lm -lpthread -lrt
>  
>  # If you add or remove a prioritizer also update multipath/multipath.conf.5
>  LIBS = \
> @@ -28,11 +30,8 @@ endif
>  
>  all: $(LIBS)
>  
> -libpriopath_latency.so: path_latency.o
> -	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^ -lm
> -
>  libprio%.so: %.o
> -	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^
> +	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^ $(LIBDEPS)
>  
>  install: $(LIBS)
>  	$(INSTALL_PROGRAM) -m 755 libprio*.so $(DESTDIR)$(libdir)
> -- 
> 2.29.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

