Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 298C21C04E3
	for <lists+dm-devel@lfdr.de>; Thu, 30 Apr 2020 20:34:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588271656;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KIrAHkHmQ0X7iaDgUcYx+ZiMcqsMJu6IvH0S2eAMXyg=;
	b=AyrVSkcsGkO50MLLtDqzrHrVKuhhdXTf9cELX5K8JT9AZL4O3y+/3iUu6h1hHKtlBhkl7u
	EPsvixnkYUkOO4jXoLsSSV52GGexGDIcVsSLH31yeiPj5al2U7d7saqI+w13T1wCVZEPNm
	WR0+gYNeHPFAEJaWMjXtg7s1Y6PplsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-pcOopaClPdexwPPlBKRwAQ-1; Thu, 30 Apr 2020 14:34:13 -0400
X-MC-Unique: pcOopaClPdexwPPlBKRwAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9212E462;
	Thu, 30 Apr 2020 18:34:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C558E60FB9;
	Thu, 30 Apr 2020 18:34:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 877A34CAA0;
	Thu, 30 Apr 2020 18:33:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03UIXdgr018175 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 30 Apr 2020 14:33:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2C77F6607E; Thu, 30 Apr 2020 18:33:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 766FA6A030;
	Thu, 30 Apr 2020 18:33:36 +0000 (UTC)
Date: Thu, 30 Apr 2020 14:33:35 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20200430183335.GA29892@redhat.com>
References: <20200428005146.242231-1-krisman@collabora.com>
	<85lfmcrhif.fsf@collabora.com>
MIME-Version: 1.0
In-Reply-To: <85lfmcrhif.fsf@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Bryn Reeves <breeves@redhat.com>, khazhy@google.com, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, kernel@collabora.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v2 0/3] Historical Service Time Path Selector
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Apr 30 2020 at  1:49pm -0400,
Gabriel Krisman Bertazi <krisman@collabora.com> wrote:

> Gabriel Krisman Bertazi <krisman@collabora.com> writes:
> 
> > Hi Mike,
> >
> > Please find an updated version of HST integrating the change you
> > requested to also support BIO based multipath.  I hope you don't mind me
> > folding the function you implemented into patch 2.  If you prefer, I can
> > integrate a patch you provide into the series.
> 
> Hi Mike,
> 
> Sorry for the encapsulation patches, I'll pass the parameter directly on
> v3.

Great, thanks.

> > One interesting data point is that the selection performance on
> > BIO-based is worse when compared to request-based.  I tested a bit and I
> > believe the reason is that the paths are more sticky because the bucket
> > is too large, and it takes longer for HST to detect differences.  By
> > changing the bucket_size indirectly through the bucket_shift, the
> > bio-based multipath performance improved, but I'm not sure this is a
> > knob we want to expose to users.  For now, please consider the patches
> > below, for review.
> >
> 
> The reason for the BIO-based being worse than request-based was that we
> are comparing the jiffies_to_nsecs(jiffies) with ktime_get_ns(), which is not
> accurate, given the different precision of the clocks.  Problem is,
> request-based mpath uses ktime_get_ns in the block layer, while
> dm_io->start_time uses jiffies, and inside the path selector, we don't
> have a way to distinguish those paths.  I see a few ways forward, but in
> the best interest of getting it right early, I'd like to hear what you
> think it is best:
> 
> 1) My best suggestion would be converting dm_io->start_time to use
> ktime_get_ns.  This has the advantage of simplifying dm_stats_account_io
> and wouldn't affect the ABI of the accounting histogram.  The only
> downside, from what I can see is that ktime_get is slightly more
> expensive than reading jiffies, which might be a problem according to
> Documentation/admin-guide/device-mapper/statistics.rst.  Is that really
> a problem?

We should check with Mikulas (now cc'd) but given the speed improvements
of storage we'll likely need to use "precise_timestamps" going forward
anyway.

So I'm inclined to just take the hit of ktime_get_ns().  Mikulas would
you be OK with this?

> I see your FIXME note on the function you implemented, but
> are you suggesting exactly this or simply storing
> jiffies_to_nsecs(jiffies) in dm_io->start_time?

Yes, I am suggesting exactly this (1) in that FIXME.

> As you can see, I'm leaning towards option 1.  Would you be open to a
> patch like the following?  Completely untested, still need some work,
> just to show the idea.

Yes, follow-on work would be something like the patch you provided.
Only nit I see is we should rename io->start_time to io->start_time_ns

But please keep this patch (that does the work to address the "FIXME" I
added) separate from your HST patchset.  The need to improve bio-based
HST is a secondary concern given bio-based multipath isn't widely
deployed AFAICT.  So we can address the conversion to nanoseconds with
later followon work that builds on your initial HST patchset.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

