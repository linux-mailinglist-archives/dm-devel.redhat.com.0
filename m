Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9261032D5CB
	for <lists+dm-devel@lfdr.de>; Thu,  4 Mar 2021 16:01:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614870088;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gJ+8HhUmu6RiyVFjPiXn7qOnYqAjVtYAJhRvojurrIo=;
	b=J7KmnalriVL+HWDfDvtzQmn1xU7MgGSLu9Xy3FAenSD/rWq/1Zu0hung8M/TFXf+PqSVXw
	knUf7GNCrzNaGpzWzsGjjpGotywngaCmjghu+Wi6fc4QAPLAvZjJxl6sVv0sWWFSO7H5hc
	u2wgwr6tXBILhxXT8rArZJygvrWeJ+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-wmVHCzPBN9mzLziW9G8ZOw-1; Thu, 04 Mar 2021 10:01:25 -0500
X-MC-Unique: wmVHCzPBN9mzLziW9G8ZOw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F8D71019629;
	Thu,  4 Mar 2021 15:01:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 288F35D9C6;
	Thu,  4 Mar 2021 15:01:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 006771809C8C;
	Thu,  4 Mar 2021 15:01:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 124F12ta013251 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Mar 2021 10:01:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D9DD45D755; Thu,  4 Mar 2021 15:01:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from segfault.boston.devel.redhat.com
	(segfault.boston.devel.redhat.com [10.19.60.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60BBB5D705;
	Thu,  4 Mar 2021 15:00:58 +0000 (UTC)
From: Jeff Moyer <jmoyer@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
References: <20210302190555.201228400@debian-a64.vm>
	<33fa121a-88a8-5c27-0a43-a7efc9b5b3e3@linux.alibaba.com>
	<alpine.LRH.2.02.2103030505460.29593@file01.intranet.prod.int.rdu2.redhat.com>
X-PGP-KeyID: 1F78E1B4
X-PGP-CertKey: F6FE 280D 8293 F72C 65FD  5A58 1FF8 A7CA 1F78 E1B4
Date: Thu, 04 Mar 2021 10:01:38 -0500
In-Reply-To: <alpine.LRH.2.02.2103030505460.29593@file01.intranet.prod.int.rdu2.redhat.com>
	(Mikulas Patocka's message of "Wed, 3 Mar 2021 05:09:18 -0500 (EST)")
Message-ID: <x49o8fzklnx.fsf@segfault.boston.devel.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, Mike Snitzer <msnitzer@redhat.com>,
	Heinz Mauelshagen <heinzm@redhat.com>, caspar@linux.alibaba.com,
	hch@lst.de, linux-block@vger.kernel.org,
	joseph.qi@linux.alibaba.com, dm-devel@redhat.com,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi, Mikulas,

Mikulas Patocka <mpatocka@redhat.com> writes:

> On Wed, 3 Mar 2021, JeffleXu wrote:
>
>> 
>> 
>> On 3/3/21 3:05 AM, Mikulas Patocka wrote:
>> 
>> > Support I/O polling if submit_bio_noacct_mq_direct returned non-empty
>> > cookie.
>> > 
>> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
>> > 
>> > ---
>> >  drivers/md/dm.c |    5 +++++
>> >  1 file changed, 5 insertions(+)
>> > 
>> > Index: linux-2.6/drivers/md/dm.c
>> > ===================================================================
>> > --- linux-2.6.orig/drivers/md/dm.c	2021-03-02 19:26:34.000000000 +0100
>> > +++ linux-2.6/drivers/md/dm.c	2021-03-02 19:26:34.000000000 +0100
>> > @@ -1682,6 +1682,11 @@ static void __split_and_process_bio(stru
>> >  		}
>> >  	}
>> >  
>> > +	if (ci.poll_cookie != BLK_QC_T_NONE) {
>> > +		while (atomic_read(&ci.io->io_count) > 1 &&
>> > +		       blk_poll(ci.poll_queue, ci.poll_cookie, true)) ;
>> > +	}
>> > +
>> >  	/* drop the extra reference count */
>> >  	dec_pending(ci.io, errno_to_blk_status(error));
>> >  }
>> 
>> It seems that the general idea of your design is to
>> 1) submit *one* split bio
>> 2) blk_poll(), waiting the previously submitted split bio complets
>
> No, I submit all the bios and poll for the last one.

What happens if the last bio completes first?  It looks like you will
call blk_poll with a cookie that already completed, and I'm pretty sure
that's invalid.

Thanks,
Jeff

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

