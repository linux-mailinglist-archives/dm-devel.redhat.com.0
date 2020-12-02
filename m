Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5708D2CC09D
	for <lists+dm-devel@lfdr.de>; Wed,  2 Dec 2020 16:19:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606922366;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3AehZtbeNOLAGrLURpBeJS3Dqfr5rrlaJZ3kfGIWakA=;
	b=idWEyycbekjsDhtFccYCBOkyJLBzUvi3t3y1+g2x7KgR4KQ9KrfhSahc7en3TtQZAxmBam
	yj3jLJqdzHjCWnoCVFRYofIqNNGjCGQzR7xEEhsvjmj7kMv60KoIQxnkZZOr1DN2eZEK1B
	emwIOJa/LT2IJgcZM1MDbGi32rP8RYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-XPb5rq7mOFeji-A9jd1HFQ-1; Wed, 02 Dec 2020 10:19:23 -0500
X-MC-Unique: XPb5rq7mOFeji-A9jd1HFQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 719EE612A8;
	Wed,  2 Dec 2020 15:19:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF61719D9C;
	Wed,  2 Dec 2020 15:19:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 78CB41809C9F;
	Wed,  2 Dec 2020 15:19:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B2FJ6Em026830 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Dec 2020 10:19:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CCA42189B6; Wed,  2 Dec 2020 15:19:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A508560636;
	Wed,  2 Dec 2020 15:19:03 +0000 (UTC)
Date: Wed, 2 Dec 2020 10:19:02 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <20201202151902.GE20535@redhat.com>
References: <20201130113339.42817-1-jefflexu@linux.alibaba.com>
	<38922bfe-4d52-af4d-f6f0-9d452b257ba1@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <38922bfe-4d52-af4d-f6f0-9d452b257ba1@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: joseph.qi@linux.alibaba.com, dm-devel@redhat.com
Subject: Re: [dm-devel] dm crypt: export sysfs of kcryptd workqueue
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 01 2020 at 11:04pm -0500,
JeffleXu <jefflexu@linux.alibaba.com> wrote:

> Hi Mike,
> 
> What about this patch?
> 
> On 11/30/20 7:33 PM, Jeffle Xu wrote:
> > It should be helpful to export sysfs of "kcryptd" workqueue in some
> > cases, such as setting specific CPU affinity of the workqueue.
> > 
> > Besides, also tweak the name format a little. The slash inside a
> > directory name will be translate into exclamation mark, such as
> > /sys/devices/virtual/workqueue/'kcryptd!253:0'.
> > 
> > Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> > ---
> >  drivers/md/dm-crypt.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> > index 392337f16ecf..6b4c1f674239 100644
> > --- a/drivers/md/dm-crypt.c
> > +++ b/drivers/md/dm-crypt.c
> > @@ -3166,11 +3166,12 @@ static int crypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
> >  	}
> >  
> >  	if (test_bit(DM_CRYPT_SAME_CPU, &cc->flags))
> > -		cc->crypt_queue = alloc_workqueue("kcryptd/%s", WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM,
> > +		cc->crypt_queue = alloc_workqueue("kcryptd-%s", WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM,
> >  						  1, devname);
> >  	else
> > -		cc->crypt_queue = alloc_workqueue("kcryptd/%s",
> > -						  WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM | WQ_UNBOUND,
> > +		cc->crypt_queue = alloc_workqueue("kcryptd-%s",
> > +						  WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM |
> > +						  WQ_UNBOUND | WQ_SYSFS,
> >  						  num_online_cpus(), devname);
> >  	if (!cc->crypt_queue) {
> >  		ti->error = "Couldn't create kcryptd queue";
> > 

Looks fine, I'll get it staged for 5.11.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

