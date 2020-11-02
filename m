Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6C16F2A2FCE
	for <lists+dm-devel@lfdr.de>; Mon,  2 Nov 2020 17:29:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604334578;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=X5rUOsT/TChTA3ANYsb5c0paZQDK1+3l+VqvD41QYmM=;
	b=aJQTJ6qtzZlck4qUshsz3mA13Gt/FHxdYNNdVAnoBqbevCZ7/hJHMXwAvicf9+PLQQL52U
	O5o828k2DREl4RsvIbt5X8N6G5m9CUtbMsNZ94MvSzqz32TO7sx1z6b5YkNoy48zKmMfM5
	O+Axpoz+Pg/wcZxe4Soqzd4uAWc08Tg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-0WpnP6mcPkSKfpmfpje0wQ-1; Mon, 02 Nov 2020 11:29:35 -0500
X-MC-Unique: 0WpnP6mcPkSKfpmfpje0wQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACD24186840A;
	Mon,  2 Nov 2020 16:29:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61B9D73669;
	Mon,  2 Nov 2020 16:29:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BACC88C7AD;
	Mon,  2 Nov 2020 16:29:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A2GSp9h012266 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 11:28:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C3B1E5576E; Mon,  2 Nov 2020 16:28:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A8AA55766;
	Mon,  2 Nov 2020 16:28:48 +0000 (UTC)
Date: Mon, 2 Nov 2020 10:28:23 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <20201102152822.GA20466@redhat.com>
References: <20201020065420.124885-1-jefflexu@linux.alibaba.com>
	<20201021203906.GA10896@redhat.com>
	<da936cfa-93a8-d6ec-bd88-c0fad6c67c8b@linux.alibaba.com>
	<20201026185334.GA8463@redhat.com>
	<33c32cd1-5116-9a42-7fe2-b2a383f1c7a0@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <33c32cd1-5116-9a42-7fe2-b2a383f1c7a0@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, xiaoguang.wang@linux.alibaba.com,
	linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, haoxu@linux.alibaba.com, io-uring@vger.kernel.org
Subject: Re: [dm-devel] [RFC 0/3] Add support of iopoll for dm device
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

On Sun, Nov 01 2020 at 10:14pm -0500,
JeffleXu <jefflexu@linux.alibaba.com> wrote:

> 
> On 10/27/20 2:53 AM, Mike Snitzer wrote:
> >What you detailed there isn't properly modeling what it needs to.
> >A given dm_target_io could result in quite a few bios (e.g. for
> >dm-striped we clone each bio for each of N stripes).  So the fan-out,
> >especially if then stacked on N layers of stacked devices, to all the
> >various hctx at the lowest layers is like herding cats.
> >
> >But the recursion in block core's submit_bio path makes that challenging
> >to say the least.  So much so that any solution related to enabling
> >proper bio-based IO polling is going to need a pretty significant
> >investment in fixing block core (storing __submit_bio()'s cookie during
> >recursion, possibly storing to driver provided memory location,
> >e.g. DM initialized bio->submit_cookie pointer to a blk_qc_t within a DM
> >clone bio's per-bio-data).
> >
> >SO __submit_bio_noacct would become:
> >
> >    retp = &ret;
> >    if (bio->submit_cookie)
> >           retp = bio->submit_cookie;
> >    *retp = __submit_bio(bio);
> 
> Sorry for the late reply. Exactly I missed this point before. IF you
> have not started working on this, I'd like to try to implement this as
> an RFC.

I did start on this line of development but it needs quite a bit more
work.  Even the pseudo code I provided above isn't useful in the context
of DM clone bios that have their own per-bio-data to assist with this
implementation.  Because the __submit_bio_noacct() recursive call
drivers/md/dm.c:__split_and_process_bio() makes is supplying the
original bio (modified to only point to remaining work).

But sure, I'm not opposed to you carrying this line of work forward.  I
can always lend a hand if you need help later or if you need to hand it
off to me.

> >I think you probably just got caught out by the recursive nature of the bio
> >submission path -- makes creating a graph of submitted bios and their
> >associated per-bio-data and generated cookies a mess to track (again,
> >like herding cats).
> >
> >Could also be you didn't quite understand the DM code's various
> >structures.
> >
> >In any case, the block core changes needed to make bio-based IO polling
> >work is the main limiting factor right now.
>
> Yes the logic is kind of subtle and maybe what I'm concerned here is
> really should be concerned at the coding phase.

Definitely, lots of little details and associations.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

