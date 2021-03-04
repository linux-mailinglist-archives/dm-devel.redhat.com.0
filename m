Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 30C7832D624
	for <lists+dm-devel@lfdr.de>; Thu,  4 Mar 2021 16:12:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614870730;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p3/AfCq8V8a4ZwK7vIQhtIW7MA3Xwu7U2T5Jzt9Up6Q=;
	b=MJezloNXub0sapQvR8yNW2Ck7S485U8mK+8Dpi6fKqYEvr31lzh10AMbh9jv8CUYYNbZdB
	jbgsgzlKspE3LqxWwi8m+vTaaEdO9vVd8sB5pz1FwmVKjEgnEj2+SToGzFf5Ct35ENKsci
	bIvG0b2YqA1AMAfFs19t6DLBF6z4x2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-mU-uF4cWP42ozXLuE4t9UQ-1; Thu, 04 Mar 2021 10:12:06 -0500
X-MC-Unique: mU-uF4cWP42ozXLuE4t9UQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D4BC80416F;
	Thu,  4 Mar 2021 15:12:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25CD410023B2;
	Thu,  4 Mar 2021 15:11:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20551C844;
	Thu,  4 Mar 2021 15:11:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 124FBkdY014022 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Mar 2021 10:11:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1F07369FA2; Thu,  4 Mar 2021 15:11:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81FAA19809;
	Thu,  4 Mar 2021 15:11:42 +0000 (UTC)
Date: Thu, 4 Mar 2021 10:11:41 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Jeff Moyer <jmoyer@redhat.com>
Message-ID: <20210304151141.GB14551@redhat.com>
References: <20210302190555.201228400@debian-a64.vm>
	<33fa121a-88a8-5c27-0a43-a7efc9b5b3e3@linux.alibaba.com>
	<alpine.LRH.2.02.2103030505460.29593@file01.intranet.prod.int.rdu2.redhat.com>
	<x49o8fzklnx.fsf@segfault.boston.devel.redhat.com>
MIME-Version: 1.0
In-Reply-To: <x49o8fzklnx.fsf@segfault.boston.devel.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, Heinz Mauelshagen <heinzm@redhat.com>,
	caspar@linux.alibaba.com, hch@lst.de,
	linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	JeffleXu <jefflexu@linux.alibaba.com>, io-uring@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 4/4] dm: support I/O polling
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 04 2021 at 10:01am -0500,
Jeff Moyer <jmoyer@redhat.com> wrote:

> Hi, Mikulas,
> 
> Mikulas Patocka <mpatocka@redhat.com> writes:
> 
> > On Wed, 3 Mar 2021, JeffleXu wrote:
> >
> >> 
> >> 
> >> On 3/3/21 3:05 AM, Mikulas Patocka wrote:
> >> 
> >> > Support I/O polling if submit_bio_noacct_mq_direct returned non-empty
> >> > cookie.
> >> > 
> >> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> >> > 
> >> > ---
> >> >  drivers/md/dm.c |    5 +++++
> >> >  1 file changed, 5 insertions(+)
> >> > 
> >> > Index: linux-2.6/drivers/md/dm.c
> >> > ===================================================================
> >> > --- linux-2.6.orig/drivers/md/dm.c	2021-03-02 19:26:34.000000000 +0100
> >> > +++ linux-2.6/drivers/md/dm.c	2021-03-02 19:26:34.000000000 +0100
> >> > @@ -1682,6 +1682,11 @@ static void __split_and_process_bio(stru
> >> >  		}
> >> >  	}
> >> >  
> >> > +	if (ci.poll_cookie != BLK_QC_T_NONE) {
> >> > +		while (atomic_read(&ci.io->io_count) > 1 &&
> >> > +		       blk_poll(ci.poll_queue, ci.poll_cookie, true)) ;
> >> > +	}
> >> > +
> >> >  	/* drop the extra reference count */
> >> >  	dec_pending(ci.io, errno_to_blk_status(error));
> >> >  }
> >> 
> >> It seems that the general idea of your design is to
> >> 1) submit *one* split bio
> >> 2) blk_poll(), waiting the previously submitted split bio complets
> >
> > No, I submit all the bios and poll for the last one.
> 
> What happens if the last bio completes first?  It looks like you will
> call blk_poll with a cookie that already completed, and I'm pretty sure
> that's invalid.

In addition, I'm concerned this approach to have DM internalize IO
polling is a non-starter.

I just don't think this approach adheres to the io_uring + IO polling
interface.. it never returns a cookie to upper layers... so there is
really no opportunity for standard io_uring + IO polling interface to
work is there?

But Heinz and Mikulas are about to kick off some fio io_uring + hipri=1
(io polling) testing of Jeffle's latest v5 patchset:
https://patchwork.kernel.org/project/dm-devel/list/?series=442075

compared to Mikulas' patchset:
https://patchwork.kernel.org/project/dm-devel/list/?series=440719

We should have definitive answers soon enough, just using Jeffle's fio
config (with hipri=1 for IO polling) that was documented here:
https://listman.redhat.com/archives/dm-devel/2020-October/msg00129.html

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

