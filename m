Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 601063136DB
	for <lists+dm-devel@lfdr.de>; Mon,  8 Feb 2021 16:17:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612797455;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FcA74ykpKfvbiG9RXI1Wn4UXTREDY/ErRYLIU7qlb+o=;
	b=F7GOX9OhwOL9n0E3PMmXkE23XrrV+uYVIwyyxVA6soKDwyGUl6SG6SG3uJfGVpabdniuoj
	62fu9USW5H8c2lyuBA8/pOvgu8lW9tMqq0QYRggP9Safy7xLjTqLpk28fmuXXXwG7Yxls+
	E9dOijWIMzgfIPBvH1vp1GgjzS3583A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-wG4nHOo1NiWaAywPQlyGXQ-1; Mon, 08 Feb 2021 10:17:31 -0500
X-MC-Unique: wG4nHOo1NiWaAywPQlyGXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D68F385B6C3;
	Mon,  8 Feb 2021 15:17:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE3656085D;
	Mon,  8 Feb 2021 15:17:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C198218095CA;
	Mon,  8 Feb 2021 15:17:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 118FH4d7010870 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 8 Feb 2021 10:17:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1419060CEC; Mon,  8 Feb 2021 15:17:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0167B6087C;
	Mon,  8 Feb 2021 15:17:00 +0000 (UTC)
Date: Mon, 8 Feb 2021 10:17:00 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <20210208151700.GA22064@redhat.com>
References: <20210202033528.76166-1-jefflexu@linux.alibaba.com>
	<20210205183909.GA4722@redhat.com>
	<59ca57e0-5a5f-33b6-24ed-90d615c40949@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <59ca57e0-5a5f-33b6-24ed-90d615c40949@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: joseph.qi@linux.alibaba.com, msb@chromium.org, dm-devel@redhat.com,
	toshi.kani@hpe.com, mbroz@redhat.com
Subject: Re: [dm-devel] dm: fix iterate_device sanity check
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 05 2021 at  9:03pm -0500,
JeffleXu <jefflexu@linux.alibaba.com> wrote:

> 
> 
> On 2/6/21 2:39 AM, Mike Snitzer wrote:
> > On Mon, Feb 01 2021 at 10:35pm -0500,
> > Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
> > 
> >> According to the definition of dm_iterate_devices_fn:
> >>  * This function must iterate through each section of device used by the
> >>  * target until it encounters a non-zero return code, which it then returns.
> >>  * Returns zero if no callout returned non-zero.
> >>
> >> For some target type (e.g., dm-stripe), one call of iterate_devices() may
> >> iterate multiple underlying devices internally, in which case a non-zero
> >> return code returned by iterate_devices_callout_fn will stop the iteration
> >> in advance.
> >>
> >> Thus if we want to ensure that _all_ underlying devices support some kind of
> >> attribute, the iteration structure like dm_table_supports_nowait() should be
> >> used, while the input iterate_devices_callout_fn should handle the 'not
> >> support' semantics. On the opposite, the iteration structure like
> >> dm_table_any_device_attribute() should be used if _any_ underlying device
> >> supporting this attibute is sufficient. In this case, the input
> >> iterate_devices_callout_fn should handle the 'support' semantics.
> >>
> >> Fixes: 545ed20e6df6 ("dm: add infrastructure for DAX support")
> >> Fixes: c3c4555edd10 ("dm table: clear add_random unless all devices have it set")
> >> Fixes: 4693c9668fdc ("dm table: propagate non rotational flag")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> > 
> > Thanks for auditing and fixing this up.  It has been on my todo so
> > you've really helped me out -- your changes look correct to me.
> > 
> > I've staged it for 5.12, the stable fix will likely need manual fixups
> > depending on the stable tree... we'll just need to assist with
> > backport(s) as needed.
> 
> I'm glad to help offer the stable backport. But I don't know which
> kernel version the stable kernel is still being maintained. Also which
> mailing list I should send to when I finished backporting?

All your v2 changes speak to needing more discipline in crafting
individual stable@ fixes that are applicable to various kernels.. when
all applied to mainline then it'd be the equivalent of your single
monolithic patch.

But without splitting the changes into separate patches, for stable@'s
benefit, we'll have a much more difficult time of shepherding the
applicable changes into the disparate stable@ kernels.

I'll have a look at splitting your v2 up accordingly.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

