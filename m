Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9F13E277ECB
	for <lists+dm-devel@lfdr.de>; Fri, 25 Sep 2020 06:02:42 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601006561;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xEhKtQK6/1p667MnhPHcoFdql2B27E2rmde/M8Kywsw=;
	b=Fp89NjIN8ot1So/ZqFG9eQ6KcvHCq/I+4a7XTBJtCdylP+eLfHcFT+y5m1W/D77NJ15yBb
	38NIzYrgceHbtO0Pkt0X3FP9GkSaeZzOfGW27aMUwScchilmvmzYAIcFStgj4cdoT2lbfm
	07rOaHL/t7TcnnGC677j+Tut8ao9ECU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-CDCqb65lNzG43qG81IpdkA-1; Fri, 25 Sep 2020 00:02:38 -0400
X-MC-Unique: CDCqb65lNzG43qG81IpdkA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37AB3802B46;
	Fri, 25 Sep 2020 04:02:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4134C5D9F1;
	Fri, 25 Sep 2020 04:02:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F10F180B656;
	Fri, 25 Sep 2020 04:02:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08P40elH030242 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 00:00:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 40AF37368E; Fri, 25 Sep 2020 04:00:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E181F7C83D;
	Fri, 25 Sep 2020 04:00:36 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08P40Z4g025041; 
	Thu, 24 Sep 2020 23:00:35 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08P40Ymn025040;
	Thu, 24 Sep 2020 23:00:34 -0500
Date: Thu, 24 Sep 2020 23:00:34 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200925040034.GN11108@octiron.msp.redhat.com>
References: <20200924133644.14034-1-mwilck@suse.com>
	<20200924133644.14034-11-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200924133644.14034-11-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 10/11] libmpathpersist: add linker version
	script
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24, 2020 at 03:36:43PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> This defines the ABI of libmpathpersist in the current state.
> ---
>  libmpathpersist/Makefile                |  6 ++++--
>  libmpathpersist/libmpathpersist.version | 20 ++++++++++++++++++++
>  2 files changed, 24 insertions(+), 2 deletions(-)
>  create mode 100644 libmpathpersist/libmpathpersist.version
> 
> diff --git a/libmpathpersist/Makefile b/libmpathpersist/Makefile
> index 9e869fd..456ce4c 100644
> --- a/libmpathpersist/Makefile
> +++ b/libmpathpersist/Makefile
> @@ -3,6 +3,7 @@ include ../Makefile.inc
>  SONAME = 0
>  DEVLIB = libmpathpersist.so
>  LIBS = $(DEVLIB).$(SONAME)
> +VERSION_SCRIPT := libmpathpersist.version
>  
>  CFLAGS += $(LIB_CFLAGS) -I$(multipathdir) -I$(mpathpersistdir) -I$(mpathcmddir)
>  
> @@ -13,8 +14,9 @@ OBJS = mpath_persist.o mpath_updatepr.o mpath_pr_ioctl.o
>  
>  all: $(DEVLIB) man
>  
> -$(LIBS): $(OBJS)
> -	$(CC) $(LDFLAGS) $(SHARED_FLAGS) $(LIBDEPS) -Wl,-soname=$@ -o $@ $(OBJS)
> +$(LIBS): $(OBJS) $(VERSION_SCRIPT)
> +	$(CC) $(LDFLAGS) $(SHARED_FLAGS) $(LIBDEPS) -Wl,-soname=$@ \
> +		-Wl,--version-script=$(VERSION_SCRIPT) -o $@ $(OBJS)
>  
>  $(DEVLIB): $(LIBS)
>  	$(LN) $(LIBS) $@
> diff --git a/libmpathpersist/libmpathpersist.version b/libmpathpersist/libmpathpersist.version
> new file mode 100644
> index 0000000..1bb8212
> --- /dev/null
> +++ b/libmpathpersist/libmpathpersist.version
> @@ -0,0 +1,20 @@
> +LIBMPATHPERSIST_0.8.4.0 {

I have a question about this version. Do you plan on bumping this each
time a new release is tagged? It seems like we only ever want to change
the version if we actually change the ABI. Or is 0.8.4 just because
that's the relesae where we started this?

-Ben

> +global:
> +
> +	__mpath_persistent_reserve_in;
> +	__mpath_persistent_reserve_out;
> +	dumpHex;
> +	mpath_alloc_prin_response;
> +	mpath_lib_exit;
> +	mpath_lib_init;
> +	mpath_mx_alloc_len;
> +	mpath_persistent_reserve_in;
> +	mpath_persistent_reserve_init_vecs;
> +	mpath_persistent_reserve_out;
> +	mpath_persistent_reserve_free_vecs;
> +	prin_do_scsi_ioctl;
> +	prout_do_scsi_ioctl;
> +	update_map_pr;
> +
> +local: *;
> +};
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

