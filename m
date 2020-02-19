Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B1A8F1649A5
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 17:15:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582128947;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Sw6RihQuJ+JhVfzwYOBzM3Alvw0nyr6Vmjyo4JkOHl0=;
	b=JhSw7PrIxUNY/kIWotdjaHi1XztnC1yjHMbD8pzJN4L5nezbt2XNmpD1VtXEWqw/cuYloj
	tZq+bLo/OCwSeKo3IA5px38Tcoiz/Qx9y7V38SjE8STxNbCQm9LGgWvSVAcrUNW8SjX7jU
	Zzgwxi6IXBtpANi2y1D51hCenZcZ7CM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-qG6ZGDmFMReE_XWxZL-O0g-1; Wed, 19 Feb 2020 11:15:38 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 946E3801A0E;
	Wed, 19 Feb 2020 16:15:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 213B29051B;
	Wed, 19 Feb 2020 16:15:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 50A5718034EA;
	Wed, 19 Feb 2020 16:15:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JGFHgj015956 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 11:15:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D4F645C28D; Wed, 19 Feb 2020 16:15:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 434DD5C241;
	Wed, 19 Feb 2020 16:15:15 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 01JGFEXC014923; 
	Wed, 19 Feb 2020 10:15:14 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 01JGFDwp014922;
	Wed, 19 Feb 2020 10:15:13 -0600
Date: Wed, 19 Feb 2020 10:15:13 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200219161513.GM30153@octiron.msp.redhat.com>
References: <1582095273-10279-1-git-send-email-bmarzins@redhat.com>
	<1582095273-10279-2-git-send-email-bmarzins@redhat.com>
	<d947b08c9f137b08f8f22fa0831cb77ccd9299c4.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <d947b08c9f137b08f8f22fa0831cb77ccd9299c4.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: qG6ZGDmFMReE_XWxZL-O0g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Feb 19, 2020 at 10:28:31AM +0100, Martin Wilck wrote:
> On Wed, 2020-02-19 at 00:54 -0600, Benjamin Marzinski wrote:
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  kpartx/dasd.c        | 6 +++---
> >  libmultipath/print.c | 3 ++-
> >  multipath/main.c     | 2 +-
> >  3 files changed, 6 insertions(+), 5 deletions(-)
> 
> I don't recall having raised issues about this, actually I haven't
> tested with gcc10 so far. But never mind :-)

Actually, this is just because I happened to be working on these patches
on a machine with gcc10 installed.

I'll fix these issues and resent.

-Ben

> 
> > diff --git a/kpartx/dasd.c b/kpartx/dasd.c
> > index 1486ccaa..57305825 100644
> > --- a/kpartx/dasd.c
> > +++ b/kpartx/dasd.c
> > @@ -186,7 +186,7 @@ read_dasd_pt(int fd, __attribute__((unused))
> > struct slice all,
> >  		goto out;
> >  	}
> >  
> > -	if ((!info.FBA_layout) && (!strcmp(info.type, "ECKD")))
> > +	if ((!info.FBA_layout) && (!strncmp(info.type, "ECKD", 4)))
> >  		memcpy (&vlabel, data, sizeof(vlabel));
> 
> It looks to me as if this should actually be memcmp(), as info.type is
> not NUL-terminated.
> 
> >  	else {
> >  		bzero(&vlabel,4);
> > @@ -216,7 +216,7 @@ read_dasd_pt(int fd, __attribute__((unused))
> > struct slice all,
> >  		sp[0].size  = size - sp[0].start;
> >  		retval = 1;
> >  	} else if ((strncmp(type, "VOL1", 4) == 0) &&
> > -		(!info.FBA_layout) && (!strcmp(info.type, "ECKD"))) {
> > +		(!info.FBA_layout) && (!strncmp(info.type, "ECKD",4)))
> > {
> >  		/*
> >  		 * New style VOL1 labeled disk
> >  		 */
> > @@ -265,7 +265,7 @@ read_dasd_pt(int fd, __attribute__((unused))
> > struct slice all,
> >  			if (vlabel.ldl_version == 0xf2) {
> >  				fmt_size =
> > sectors512(vlabel.formatted_blocks,
> >  						      blocksize);
> > -			} else if (!strcmp(info.type, "ECKD")) {
> > +			} else if (!strncmp(info.type, "ECKD",4)) {
> >  				/* formatted w/o large volume support
> > */
> >  				fmt_size = geo.cylinders * geo.heads
> >  					* geo.sectors * (blocksize >>
> > 9);
> > diff --git a/libmultipath/print.c b/libmultipath/print.c
> > index 1858d8ea..55b19195 100644
> > --- a/libmultipath/print.c
> > +++ b/libmultipath/print.c
> > @@ -29,6 +29,7 @@
> >  #include "uevent.h"
> >  #include "debug.h"
> >  #include "discovery.h"
> > +#include "util.h"
> >  
> >  #define MAX(x,y) (((x) > (y)) ? (x) : (y))
> >  #define MIN(x,y) (((x) > (y)) ? (y) : (x))
> > @@ -2056,7 +2057,7 @@ int snprint_devices(struct config *conf, char *
> > buff, int len,
> >  
> >  		devptr = devpath + 11;
> >  		*devptr = '\0';
> > -		strncat(devptr, blkdev->d_name, PATH_MAX-12);
> > +		strlcpy(devptr, blkdev->d_name, PATH_MAX-11);
> >  		if (stat(devpath, &statbuf) < 0)
> >  			continue;
> 
> If you use strlcpy(), you can delete the "*devptr = '\0'" statement (we
> can be certain that (PATH_MAX-11 > 0), thus strlcpy() is guaranteed to
> write a NUL byte).
> 
> Moreover, while you're at that, copying "/sys/block/" to devpath before
> the loop is an ugly pseudo-optimization (not your fault). Readability
> would be improved by ditching that and simply writing
> 
>      if (safe_snprintf(devpath, sizeof(devpath), 
>                        "/sys/block/%s", devptr))
>              continue;
> 
> inside the loop.
> 
> Martin
> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

