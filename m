Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8DD34D437
	for <lists+dm-devel@lfdr.de>; Mon, 29 Mar 2021 17:45:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-tdjgOXrhPA-r3qM9NCYcBQ-1; Mon, 29 Mar 2021 11:45:29 -0400
X-MC-Unique: tdjgOXrhPA-r3qM9NCYcBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69CFA501FC;
	Mon, 29 Mar 2021 15:45:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15DA42DAD0;
	Mon, 29 Mar 2021 15:45:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C1CF24BB7C;
	Mon, 29 Mar 2021 15:45:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12TFj9Gb020901 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Mar 2021 11:45:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BDACB43670; Mon, 29 Mar 2021 15:45:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7801170F4
	for <dm-devel@redhat.com>; Mon, 29 Mar 2021 15:45:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E355100E640
	for <dm-devel@redhat.com>; Mon, 29 Mar 2021 15:45:02 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-552-NUuuAqTgPu6GYiDruMTHHw-1; Mon, 29 Mar 2021 11:44:59 -0400
X-MC-Unique: NUuuAqTgPu6GYiDruMTHHw-1
Received: by mail-wr1-f46.google.com with SMTP id e18so13344831wrt.6;
	Mon, 29 Mar 2021 08:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=fJPbnd2X7Qj6wc9YMaxiYGAvJGoxphEDD7e/nWF13iU=;
	b=esqNh8WxEpURRgHFgxgBZJdS6Dd6M+3zM6XLUHMnu3H96waxqK/Y0JLRWIaxQfBlbA
	HRVLs+e1fB/AVoe5uRsXp1RqiSmgByeyhjmUVcpjePRJZDziDk1Kn12htgX1MD521OkF
	iF2oYClhMvAHqwdX5MayqOZJek8qVZyhE21zdk4CJQgLloKVr9nJCVlUh/64T5ry1q8T
	tnH2ZO/BsRzG0L4IDhpmXl6Nly/hfmCdDbBSKtM+FnnXVjJmBDT9SqFCwUrHSdJE6r+K
	k4m8QDCRuVqxT0F9agXgUvTD50uy6mvwwgN0+WdopUMXi1UepNW/0OO5ijGPvzxTq8/6
	ZinQ==
X-Gm-Message-State: AOAM530gNBQ9Bajn+fi7M0U73oIydxmzPhrE+yjVKW3FQZwkLJpxZX3s
	mtGlIW5S9Or6dC40RzP1pzELK6RXKg==
X-Google-Smtp-Source: ABdhPJxeqSkVp36YmSo1G9pW7gnhxPZwovk0K9lVvJV4EM7i9dOh6m3VoqPWD4R1F2FMipGU41Qnhw==
X-Received: by 2002:a5d:698e:: with SMTP id g14mr28554909wru.127.1617032697954;
	Mon, 29 Mar 2021 08:44:57 -0700 (PDT)
Received: from localhost ([84.39.178.196]) by smtp.gmail.com with ESMTPSA id
	e8sm25094331wme.14.2021.03.29.08.44.56
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 29 Mar 2021 08:44:57 -0700 (PDT)
To: mwilck@suse.com, Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	Helmut Grohne <helmutg@debian.org>
References: <20210326212944.3136-1-mwilck@suse.com>
	<20210326212944.3136-2-mwilck@suse.com>
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
Message-ID: <a4b71ca9-2b8b-5515-b895-8f66d200cc8b@gmail.com>
Date: Mon, 29 Mar 2021 17:44:55 +0200
MIME-Version: 1.0
In-Reply-To: <20210326212944.3136-2-mwilck@suse.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 1/7] multipath-tools Makefiles: make
 pkg-config configurable
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 3/26/21 10:29 PM, mwilck@suse.com wrote:

> From: Martin Wilck <mwilck@suse.com>
> 
> This is useful for building in a cross-compilation environment.

Debian has a similar patch:
https://salsa.debian.org/linux-blocks-team/multipath-tools/-/blob/master/debian/patches/0008-Bug-916521-FTCBFS-uses-the-wrong-pkg-config.patch


> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>   Makefile.inc     | 6 ++++--
>   libdmmp/Makefile | 4 ++--
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/Makefile.inc b/Makefile.inc
> index 0542930..f1e2313 100644
> --- a/Makefile.inc
> +++ b/Makefile.inc
> @@ -15,6 +15,8 @@
>   # Uncomment to disable dmevents polling support
>   # ENABLE_DMEVENTS_POLL = 0
>   
> +PKGCONFIG	?= pkg-config
> +
>   ifeq ($(TOPDIR),)
>   	TOPDIR	= ..
>   endif
> @@ -36,8 +38,8 @@ ifndef RUN
>   endif
>   
>   ifndef SYSTEMD
> -	ifeq ($(shell pkg-config --modversion libsystemd >/dev/null 2>&1 && echo 1), 1)
> -		SYSTEMD = $(shell pkg-config --modversion libsystemd | awk '{print $$1}')
> +	ifeq ($(shell $(PKGCONFIG) --modversion libsystemd >/dev/null 2>&1 && echo 1), 1)
> +		SYSTEMD = $(shell $(PKGCONFIG) --modversion libsystemd | awk '{print $$1}')
>   	else
>   		ifeq ($(shell systemctl --version >/dev/null 2>&1 && echo 1), 1)
>   			SYSTEMD = $(shell systemctl --version 2> /dev/null | \
> diff --git a/libdmmp/Makefile b/libdmmp/Makefile
> index 1dd3f34..4175c3f 100644
> --- a/libdmmp/Makefile
> +++ b/libdmmp/Makefile
> @@ -16,9 +16,9 @@ HEADERS = libdmmp/libdmmp.h
>   OBJS = libdmmp.o libdmmp_mp.o libdmmp_pg.o libdmmp_path.o libdmmp_misc.o
>   
>   CFLAGS += $(LIB_CFLAGS) -fvisibility=hidden -I$(libdmmpdir) -I$(mpathcmddir) \
> -	  $(shell pkg-config --cflags json-c)
> +	  $(shell $(PKGCONFIG) --cflags json-c)
>   
> -LIBDEPS += $(shell pkg-config --libs json-c) -L$(mpathcmddir) -lmpathcmd -lpthread
> +LIBDEPS += $(shell $(PKGCONFIG) --libs json-c) -L$(mpathcmddir) -lmpathcmd -lpthread
>   
>   all: $(LIBS) doc
>   
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

