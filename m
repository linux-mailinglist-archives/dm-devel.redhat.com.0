Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBF4146FE4
	for <lists+dm-devel@lfdr.de>; Thu, 23 Jan 2020 18:38:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579801134;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mhHhn1NWE3lTLBLnBjiOq/my30uUul2oxPqlS75eoxo=;
	b=i1QsiAWoVCWTyht0A9Hvjx0vDauhTR0irUiLrhJlunS9z9ZgM0RpNWsEjmQQK1+Y2IsdF+
	+jfjfw/cKdhO67HFPy7YhTg9K563z5btpSql0vPie3m60rGDGi1SpBPYqAtexBMNO9qfoB
	FgH8UY8TJOKDYa+U2LOMn8eRzbPi08M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-tU8xegQHOMiEkpqTLQC3Zw-1; Thu, 23 Jan 2020 12:28:53 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39AB5A0CCD;
	Thu, 23 Jan 2020 17:28:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E19AF60BE1;
	Thu, 23 Jan 2020 17:28:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0490D8594A;
	Thu, 23 Jan 2020 17:28:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NHSJAP019495 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 12:28:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D247B8CCE7; Thu, 23 Jan 2020 17:28:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C8058CCEC;
	Thu, 23 Jan 2020 17:28:17 +0000 (UTC)
Date: Thu, 23 Jan 2020 12:28:16 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Stefan Bader <stefan.bader@canonical.com>
Message-ID: <20200123172816.GA31063@redhat.com>
References: <20200123091713.12623-1-stefan.bader@canonical.com>
	<20200123091713.12623-2-stefan.bader@canonical.com>
	<20200123103541.GA28102@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200123103541.GA28102@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Tyler Hicks <tyler.hicks@canonical.com>, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/1] blk/core: Gracefully handle unset
	make_request_fn
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: tU8xegQHOMiEkpqTLQC3Zw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jan 23 2020 at  5:35am -0500,
Mike Snitzer <snitzer@redhat.com> wrote:

> On Thu, Jan 23 2020 at  4:17am -0500,
> Stefan Bader <stefan.bader@canonical.com> wrote:
> 
> > When device-mapper adapted for multi-queue functionality, they
> > also re-organized the way the make-request function was set.
> > Before, this happened when the device-mapper logical device was
> > created. Now it is done once the mapping table gets loaded the
> > first time (this also decides whether the block device is request
> > or bio based).
> > 
> > However in generic_make_request(), the request function gets used
> > without further checks and this happens if one tries to mount such
> > a partially set up device.
> > 
> > This can easily be reproduced with the following steps:
> >  - dmsetup create -n test
> >  - mount /dev/dm-<#> /mnt
> > 
> > This maybe is something which also should be fixed up in device-
> > mapper.
> 
> I'll look closer at other options.
> 
> > But given there is already a check for an unset queue
> > pointer and potentially there could be other drivers which do or
> > might do the same, it sounds like a good move to add another check
> > to generic_make_request_checks() and to bail out if the request
> > function has not been set, yet.
> > 
> > BugLink: https://bugs.launchpad.net/bugs/1860231
> 
> >From that bug;
> "The currently proposed fix introduces no chance of stability
> regressions. There is a chance of a very small performance regression
> since an additional pointer comparison is performed on each block layer
> request but this is unlikely to be noticeable."
> 
> This captures my immediate concern: slowing down everyone for this DM
> edge-case isn't desirable.

SO I had a look and there isn't anything easier than adding the proposed
NULL check in generic_make_request_checks().  Given the many
conditionals in that  function.. what's one more? ;)

I looked at marking the queue frozen to prevent IO via
blk_queue_enter()'s existing cheeck -- but that quickly felt like an
abuse, especially in that there isn't a queue unfreeze for bio-based.

Jens, I'll defer to you to judge this patch further.  If you're OK with
it: cool.  If not, I'm open to suggestions for how to proceed.  

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

