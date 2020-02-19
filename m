Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DB379164056
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 10:27:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582104459;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NAlPYE9ES9JC2AOa2cFnvloZbrRrd7J0BZbGVEwy7b4=;
	b=Pyw6ggsNtMZYVgpRH9DydalS2XwdT0/rJETiyE9itNTTZQcu5wZMxBQhmzzuuTRDJiIzU0
	JUUrovvPFOEmrqYaCM+bJz1Owqkqam2Cw7JdTJK+niqmauEVrpMIQiZarh2PNS04ZjbS8F
	o7Cs3pX9rF3pFI/0AvGA1RvMOfcK4U8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-S4emIB60Nx6ayejsQxhnOQ-1; Wed, 19 Feb 2020 04:27:37 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CCE48010F2;
	Wed, 19 Feb 2020 09:27:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 270E81001B28;
	Wed, 19 Feb 2020 09:27:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6118235AF3;
	Wed, 19 Feb 2020 09:27:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J9R7Vv026648 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 04:27:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 46F972063FE6; Wed, 19 Feb 2020 09:27:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 424A62026D67
	for <dm-devel@redhat.com>; Wed, 19 Feb 2020 09:27:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF6DB80387A
	for <dm-devel@redhat.com>; Wed, 19 Feb 2020 09:27:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-241-tvDFQtFhNqaks6_ItsDESA-1;
	Wed, 19 Feb 2020 04:26:58 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 2F9C9AFD4;
	Wed, 19 Feb 2020 09:26:57 +0000 (UTC)
Message-ID: <d947b08c9f137b08f8f22fa0831cb77ccd9299c4.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Wed, 19 Feb 2020 10:28:31 +0100
In-Reply-To: <1582095273-10279-2-git-send-email-bmarzins@redhat.com>
References: <1582095273-10279-1-git-send-email-bmarzins@redhat.com>
	<1582095273-10279-2-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: tvDFQtFhNqaks6_ItsDESA-1
X-MC-Unique: S4emIB60Nx6ayejsQxhnOQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J9R7Vv026648
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/5] multipath: fix issues found by compiling
	with gcc 10
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-02-19 at 00:54 -0600, Benjamin Marzinski wrote:
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  kpartx/dasd.c        | 6 +++---
>  libmultipath/print.c | 3 ++-
>  multipath/main.c     | 2 +-
>  3 files changed, 6 insertions(+), 5 deletions(-)

I don't recall having raised issues about this, actually I haven't
tested with gcc10 so far. But never mind :-)

> diff --git a/kpartx/dasd.c b/kpartx/dasd.c
> index 1486ccaa..57305825 100644
> --- a/kpartx/dasd.c
> +++ b/kpartx/dasd.c
> @@ -186,7 +186,7 @@ read_dasd_pt(int fd, __attribute__((unused))
> struct slice all,
>  		goto out;
>  	}
>  
> -	if ((!info.FBA_layout) && (!strcmp(info.type, "ECKD")))
> +	if ((!info.FBA_layout) && (!strncmp(info.type, "ECKD", 4)))
>  		memcpy (&vlabel, data, sizeof(vlabel));

It looks to me as if this should actually be memcmp(), as info.type is
not NUL-terminated.

>  	else {
>  		bzero(&vlabel,4);
> @@ -216,7 +216,7 @@ read_dasd_pt(int fd, __attribute__((unused))
> struct slice all,
>  		sp[0].size  = size - sp[0].start;
>  		retval = 1;
>  	} else if ((strncmp(type, "VOL1", 4) == 0) &&
> -		(!info.FBA_layout) && (!strcmp(info.type, "ECKD"))) {
> +		(!info.FBA_layout) && (!strncmp(info.type, "ECKD",4)))
> {
>  		/*
>  		 * New style VOL1 labeled disk
>  		 */
> @@ -265,7 +265,7 @@ read_dasd_pt(int fd, __attribute__((unused))
> struct slice all,
>  			if (vlabel.ldl_version == 0xf2) {
>  				fmt_size =
> sectors512(vlabel.formatted_blocks,
>  						      blocksize);
> -			} else if (!strcmp(info.type, "ECKD")) {
> +			} else if (!strncmp(info.type, "ECKD",4)) {
>  				/* formatted w/o large volume support
> */
>  				fmt_size = geo.cylinders * geo.heads
>  					* geo.sectors * (blocksize >>
> 9);
> diff --git a/libmultipath/print.c b/libmultipath/print.c
> index 1858d8ea..55b19195 100644
> --- a/libmultipath/print.c
> +++ b/libmultipath/print.c
> @@ -29,6 +29,7 @@
>  #include "uevent.h"
>  #include "debug.h"
>  #include "discovery.h"
> +#include "util.h"
>  
>  #define MAX(x,y) (((x) > (y)) ? (x) : (y))
>  #define MIN(x,y) (((x) > (y)) ? (y) : (x))
> @@ -2056,7 +2057,7 @@ int snprint_devices(struct config *conf, char *
> buff, int len,
>  
>  		devptr = devpath + 11;
>  		*devptr = '\0';
> -		strncat(devptr, blkdev->d_name, PATH_MAX-12);
> +		strlcpy(devptr, blkdev->d_name, PATH_MAX-11);
>  		if (stat(devpath, &statbuf) < 0)
>  			continue;

If you use strlcpy(), you can delete the "*devptr = '\0'" statement (we
can be certain that (PATH_MAX-11 > 0), thus strlcpy() is guaranteed to
write a NUL byte).

Moreover, while you're at that, copying "/sys/block/" to devpath before
the loop is an ugly pseudo-optimization (not your fault). Readability
would be improved by ditching that and simply writing

     if (safe_snprintf(devpath, sizeof(devpath), 
                       "/sys/block/%s", devptr))
             continue;

inside the loop.

Martin




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

