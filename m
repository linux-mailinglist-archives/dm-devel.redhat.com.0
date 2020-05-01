Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0841C1C90
	for <lists+dm-devel@lfdr.de>; Fri,  1 May 2020 20:06:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588356390;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+7SZwixqBVOSTwllnrUFUC+uzRGfJp9BYpxB4yVlMVQ=;
	b=f5l39uNL/0Tw4QauMMDMTDPzq0KWp+buASINhgAOywp7lVXfGTRjyswBVSCPvL+AyDcutU
	7YObF1bhM8temypPm+m+j+z5V3Coc9lA2KS6OENVWLFEcKal2+POOWfbejbovIr0Bf0rhv
	4CXVasuExGIST6Xe68/wXP9I8nR1uUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-UDIfcZFLM92-xcDKS_l_KA-1; Fri, 01 May 2020 14:06:17 -0400
X-MC-Unique: UDIfcZFLM92-xcDKS_l_KA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13BA3108BD0B;
	Fri,  1 May 2020 18:06:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AA516084A;
	Fri,  1 May 2020 18:06:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF48F180954D;
	Fri,  1 May 2020 18:05:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 041I3j7q016944 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 1 May 2020 14:03:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6AC0860E1C; Fri,  1 May 2020 18:03:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FFE460BE1;
	Fri,  1 May 2020 18:03:39 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 041I3dfH030222; Fri, 1 May 2020 14:03:39 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 041I3dWj030218; Fri, 1 May 2020 14:03:39 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 1 May 2020 14:03:39 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <20200430183335.GA29892@redhat.com>
Message-ID: <alpine.LRH.2.02.2005011355270.29501@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200428005146.242231-1-krisman@collabora.com>
	<85lfmcrhif.fsf@collabora.com> <20200430183335.GA29892@redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Bryn Reeves <breeves@redhat.com>, khazhy@google.com, dm-devel@redhat.com,
	kernel@collabora.com,
	Gabriel Krisman Bertazi <krisman@collabora.com>, agk@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Thu, 30 Apr 2020, Mike Snitzer wrote:

> On Thu, Apr 30 2020 at  1:49pm -0400,
> Gabriel Krisman Bertazi <krisman@collabora.com> wrote:
> 
> > Gabriel Krisman Bertazi <krisman@collabora.com> writes:
> > 
> > > Hi Mike,
> > >
> > > Please find an updated version of HST integrating the change you
> > > requested to also support BIO based multipath.  I hope you don't mind me
> > > folding the function you implemented into patch 2.  If you prefer, I can
> > > integrate a patch you provide into the series.
> > 
> > Hi Mike,
> > 
> > Sorry for the encapsulation patches, I'll pass the parameter directly on
> > v3.
> 
> Great, thanks.
> 
> > > One interesting data point is that the selection performance on
> > > BIO-based is worse when compared to request-based.  I tested a bit and I
> > > believe the reason is that the paths are more sticky because the bucket
> > > is too large, and it takes longer for HST to detect differences.  By
> > > changing the bucket_size indirectly through the bucket_shift, the
> > > bio-based multipath performance improved, but I'm not sure this is a
> > > knob we want to expose to users.  For now, please consider the patches
> > > below, for review.
> > >
> > 
> > The reason for the BIO-based being worse than request-based was that we
> > are comparing the jiffies_to_nsecs(jiffies) with ktime_get_ns(), which is not
> > accurate, given the different precision of the clocks.  Problem is,
> > request-based mpath uses ktime_get_ns in the block layer, while
> > dm_io->start_time uses jiffies, and inside the path selector, we don't
> > have a way to distinguish those paths.  I see a few ways forward, but in
> > the best interest of getting it right early, I'd like to hear what you
> > think it is best:
> > 
> > 1) My best suggestion would be converting dm_io->start_time to use
> > ktime_get_ns.  This has the advantage of simplifying dm_stats_account_io
> > and wouldn't affect the ABI of the accounting histogram.  The only
> > downside, from what I can see is that ktime_get is slightly more
> > expensive than reading jiffies, which might be a problem according to
> > Documentation/admin-guide/device-mapper/statistics.rst.  Is that really
> > a problem?
> 
> We should check with Mikulas (now cc'd) but given the speed improvements
> of storage we'll likely need to use "precise_timestamps" going forward
> anyway.
> 
> So I'm inclined to just take the hit of ktime_get_ns().  Mikulas would
> you be OK with this?

You can use ktime_get_ns() inside the multipath target. But I wouldn't use 
it in the general device mapper code because it would slow down 
everything.

I suggest to use ktime_get_ns() in the multipath map routine and in the 
the end_io routine and subract these two values to get precise time. I 
think that we don't need to hack generic dm code with that.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

