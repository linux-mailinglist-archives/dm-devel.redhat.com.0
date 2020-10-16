Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CEDD9290D18
	for <lists+dm-devel@lfdr.de>; Fri, 16 Oct 2020 23:06:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602882410;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JA4B/IxHXjMnpt/JBWMtfiwpy1RbJyRzQZFUyUc20Q0=;
	b=JyfTIJBmo4YHlgSPqCAT85Y8OLmf6I8bI+i5nOWFlYXBg+DNVLjAMlTKF9CBmj5UFDPwNC
	yXIaAxgJePN1NjBQ9vzuuM19QzEA0DyMP7T69OdqWcZ3DftK9ltV8YFMMLHuo8PC6rjqGE
	JxtcH59JftFOeBp1XPjcruKlgI5iWGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-17WO2uPCPmiP0T0zmTAscw-1; Fri, 16 Oct 2020 17:06:48 -0400
X-MC-Unique: 17WO2uPCPmiP0T0zmTAscw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC18D57053;
	Fri, 16 Oct 2020 21:06:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5DD25B4A0;
	Fri, 16 Oct 2020 21:06:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ECEBF44A47;
	Fri, 16 Oct 2020 21:06:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09GL4Xd9003472 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Oct 2020 17:04:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0D39155781; Fri, 16 Oct 2020 21:04:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2465B55775;
	Fri, 16 Oct 2020 21:04:30 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 09GL4S7o027162; 
	Fri, 16 Oct 2020 16:04:28 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 09GL4R59027161;
	Fri, 16 Oct 2020 16:04:27 -0500
Date: Fri, 16 Oct 2020 16:04:27 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20201016210427.GW3384@octiron.msp.redhat.com>
References: <20201016104239.8217-1-mwilck@suse.com>
	<20201016104239.8217-9-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20201016104239.8217-9-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 08/12] libmultipath: create separate .so
	for unit tests
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 16, 2020 at 12:42:35PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> The unit tests use a lot of internal symbols that we don't want
> to add to the ABI if we don't have to. As long as we don't
> have to make incompatible changes to functions, we can work around
> that by simply using a non-versioned library for the unit tests.
> Therefore we add a seperate rule here. Do this before actually
> adding a version script, to avoid breakage during bisection.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/Makefile |  7 +++++++
>  tests/Makefile        | 10 ++++++----
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/libmultipath/Makefile b/libmultipath/Makefile
> index af5bb77..cf13561 100644
> --- a/libmultipath/Makefile
> +++ b/libmultipath/Makefile
> @@ -74,6 +74,13 @@ $(LIBS): $(OBJS)
>  $(DEVLIB): $(LIBS)
>  	$(LN) $(LIBS) $@
>  
> +../tests/$(LIBS): $(OBJS) $(VERSION_SCRIPT)
> +	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -Wl,-soname=`basename $@` \
> +		-o $@ $(OBJS) $(LIBDEPS)
> +	$(LN) $@ ${@:.so.0=.so}
> +
> +test-lib:	../tests/$(LIBS)
> +
>  install: all
>  	$(INSTALL_PROGRAM) -d $(DESTDIR)$(syslibdir)
>  	$(INSTALL_PROGRAM) -m 755 $(LIBS) $(DESTDIR)$(syslibdir)/$(LIBS)
> diff --git a/tests/Makefile b/tests/Makefile
> index 502377f..f6ef16a 100644
> --- a/tests/Makefile
> +++ b/tests/Makefile
> @@ -10,7 +10,7 @@ W_MISSING_INITIALIZERS := $(call TEST_MISSING_INITIALIZERS)
>  
>  CFLAGS += $(BIN_CFLAGS) -I$(multipathdir) -I$(mpathcmddir) \
>  	-Wno-unused-parameter $(W_MISSING_INITIALIZERS)
> -LIBDEPS += -L$(multipathdir) -L$(mpathcmddir) -lmultipath -lmpathcmd -lcmocka
> +LIBDEPS += -L. -L$(mpathcmddir) -lmultipath -lmpathcmd -lcmocka
>  
>  TESTS := uevent parser util dmevents hwtable blacklist unaligned vpd pgpolicy \
>  	 alias directio valid devt
> @@ -67,7 +67,7 @@ lib/libchecktur.so:
>  
>  %.out:	%-test lib/libchecktur.so
>  	@echo == running $< ==
> -	@LD_LIBRARY_PATH=$(multipathdir):$(mpathcmddir) ./$< >$@
> +	@LD_LIBRARY_PATH=.:$(mpathcmddir) ./$< >$@
>  
>  %.vgr:  %-test lib/libchecktur.so
>  	@echo == running valgrind for $< ==
> @@ -77,7 +77,7 @@ lib/libchecktur.so:
>  OBJS = $(TESTS:%=%.o) test-lib.o
>  
>  test_clean:
> -	$(RM) $(TESTS:%=%.out) $(TESTS:%=%.vgr)
> +	$(RM) $(TESTS:%=%.out) $(TESTS:%=%.vgr) *.so*
>  
>  valgrind_clean:
>  	$(RM) $(TESTS:%=%.vgr)
> @@ -97,12 +97,14 @@ dep_clean:
>  	@sed -n 's/^.*__wrap_\([a-zA-Z0-9_]*\).*$$/-Wl,--wrap=\1/p' $< | \
>  		sort -u | tr '\n' ' ' >$@
>  
> +libmultipath.so.0:
> +	$(MAKE) -C $(multipathdir) test-lib
>  
>  # COLON will get expanded during second expansion below
>  COLON:=:
>  .SECONDEXPANSION:
>  %-test:	%.o %.o.wrap $$($$@_OBJDEPS) $$($$@_TESTDEPS) $$($$@_TESTDEPS$$(COLON).o=.o.wrap) \
> -		$(multipathdir)/libmultipath.so Makefile
> +		libmultipath.so.0 Makefile
>  	$(CC) $(CFLAGS) -o $@ $(LDFLAGS) $< $($@_TESTDEPS) $($@_OBJDEPS) \
>  		$(LIBDEPS) $($@_LIBDEPS) \
>  		$(shell cat $<.wrap) $(foreach dep,$($@_TESTDEPS),$(shell cat $(dep).wrap))
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

