Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 413BD1465DF
	for <lists+dm-devel@lfdr.de>; Thu, 23 Jan 2020 11:36:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579775793;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=e20a1oKQk+/i6Rzr/HBIsotwxHB1lyoN5qJw086er80=;
	b=btFWJll70gwOdR8XWf9HGfIC/8eJHMatRt+cY6UDXjmT1Prr0IcT2e2Kub4b4GoXutiVtl
	l3KqR7IbRG40Qt2fgAOnBx9HtgnL94ZvQ71bFJBm93QVkjz5/B3SEipjBYi0ULGBUgP6jW
	E7+b4KNUMt9AqtNhKi6iVHi+eXliGgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-4UcmUpvENxK9z99Ry-BIZg-1; Thu, 23 Jan 2020 05:36:30 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98C518017CC;
	Thu, 23 Jan 2020 10:36:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 294AB60BE1;
	Thu, 23 Jan 2020 10:36:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 958A818089CD;
	Thu, 23 Jan 2020 10:36:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NAZjH0021860 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 05:35:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 154111CB; Thu, 23 Jan 2020 10:35:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4742F85757;
	Thu, 23 Jan 2020 10:35:42 +0000 (UTC)
Date: Thu, 23 Jan 2020 05:35:41 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Stefan Bader <stefan.bader@canonical.com>
Message-ID: <20200123103541.GA28102@redhat.com>
References: <20200123091713.12623-1-stefan.bader@canonical.com>
	<20200123091713.12623-2-stefan.bader@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20200123091713.12623-2-stefan.bader@canonical.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-MC-Unique: 4UcmUpvENxK9z99Ry-BIZg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jan 23 2020 at  4:17am -0500,
Stefan Bader <stefan.bader@canonical.com> wrote:

> When device-mapper adapted for multi-queue functionality, they
> also re-organized the way the make-request function was set.
> Before, this happened when the device-mapper logical device was
> created. Now it is done once the mapping table gets loaded the
> first time (this also decides whether the block device is request
> or bio based).
> 
> However in generic_make_request(), the request function gets used
> without further checks and this happens if one tries to mount such
> a partially set up device.
> 
> This can easily be reproduced with the following steps:
>  - dmsetup create -n test
>  - mount /dev/dm-<#> /mnt
> 
> This maybe is something which also should be fixed up in device-
> mapper.

I'll look closer at other options.

> But given there is already a check for an unset queue
> pointer and potentially there could be other drivers which do or
> might do the same, it sounds like a good move to add another check
> to generic_make_request_checks() and to bail out if the request
> function has not been set, yet.
> 
> BugLink: https://bugs.launchpad.net/bugs/1860231

>From that bug;
"The currently proposed fix introduces no chance of stability
regressions. There is a chance of a very small performance regression
since an additional pointer comparison is performed on each block layer
request but this is unlikely to be noticeable."

This captures my immediate concern: slowing down everyone for this DM
edge-case isn't desirable.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

