Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D84191247D3
	for <lists+dm-devel@lfdr.de>; Wed, 18 Dec 2019 14:14:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576674861;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Fdqj+Okf0wb4UsM3zdH1845NaxdrOOgFcBgsVbzGgUk=;
	b=Kr6lzCCtrYxai+ZzVOT8j4eg3iuKV1vpx3V3g7G+c4jwVVtRS868v9RtmxJe5unyyjHAwt
	tqGfPJ5CTVnsEobUrH6jyDAB5UwJmvU6EndEAOGLqzr3FQAGBeIJTmLKqDyYtKf6nx7M9j
	jfeV0WvgRgqKWIfkh6LMjVwb0nmmAck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-LbtwVKPxM4-B9Tv9qSPvUg-1; Wed, 18 Dec 2019 08:14:17 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A00C9107B783;
	Wed, 18 Dec 2019 13:14:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBA005C3F8;
	Wed, 18 Dec 2019 13:14:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C52231832DEA;
	Wed, 18 Dec 2019 13:13:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBIDDcGR005899 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 18 Dec 2019 08:13:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7A65060C63; Wed, 18 Dec 2019 13:13:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.33.36.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7CC3860C18;
	Wed, 18 Dec 2019 13:13:35 +0000 (UTC)
Date: Wed, 18 Dec 2019 13:13:34 +0000
From: Joe Thornber <thornber@redhat.com>
To: Eric Wheeler <dm-devel@lists.ewheeler.net>
Message-ID: <20191218131334.pngvyqoebsdmicun@reti>
Mail-Followup-To: Eric Wheeler <dm-devel@lists.ewheeler.net>,
	Nikos Tsironis <ntsironis@arrikto.com>,
	JeffleXu <jefflexu@linux.alibaba.com>, dm-devel@redhat.com
References: <35cf1ecf-5cd8-604b-ec4e-18c9fd4a4195@linux.alibaba.com>
	<20191122185530.pcrgmb655dkdbdcq@reti>
	<629bd851-8d89-00bd-0fea-d140961e8752@arrikto.com>
	<alpine.LRH.2.11.1912130129120.11561@mx.ewheeler.net>
	<alpine.LRH.2.11.1912152140020.11561@mx.ewheeler.net>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.11.1912152140020.11561@mx.ewheeler.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: JeffleXu <jefflexu@linux.alibaba.com>, dm-devel@redhat.com,
	Nikos Tsironis <ntsironis@arrikto.com>
Subject: Re: [dm-devel] dm-thin: Several Questions on dm-thin performance.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: LbtwVKPxM4-B9Tv9qSPvUg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sun, Dec 15, 2019 at 09:44:49PM +0000, Eric Wheeler wrote:
> I was looking through the dm-bio-prison-v2 commit for dm-cache (b29d4986d) 
> and it is huge, ~5k lines.  Do you still have a git branch with these 
> commits in smaller pieces (not squashed) so we can find the bits that 
> might be informative for converting lv-thin to use dm-bio-prison-v2?
> 
> For example, I think that, at least, the policy changes and 
> btracker code is dm-cache specific and just a distraction when trying to 
> understand the dm-bio-prison-v2 conversion.

To be honest I would hold off for a couple of months.  I've been working
on the design for thinp 2 and have got to the point where I need to write
a userland proof of concept implementation.  In particular I've focussed on
packing more into btree nodes, and separating transactions so IO to different
thins has no locking contention.  The proof of concept will tell me just how
small I can get the metadata.  If the level of metadata compression is ~1/10th
we'll plug the new btrees into the existing design and switch to bio prison v2.
If it's greater, say 1/50th, then I'll rewrite the whole target to
use write-ahead logging for transactionality and ditch all metadata sharing altogether.
When the metadata is that small we can copy entire btrees to implement snapshots.

- Joe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

