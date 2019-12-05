Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C5BBA1143DD
	for <lists+dm-devel@lfdr.de>; Thu,  5 Dec 2019 16:43:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575560633;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HFSLNIQgP+CpkDMX3ke0dULyoWAPdwlPwSZXRG2VlQo=;
	b=HRd28fZuSilNKRmfruR9KXecIQZCN/qEwqzx9VaVg99ByqkhFzVWm3xgr7PpsqXGbumauh
	llQx8ylI3MbR9Na8wEj//THulrPdUzrqBXLGr4SpR9aQ+jDWcpqKMb8pETS9gZSOUjdqZW
	/FmNW+ExuPFyhIexbHpwx+9fGLUl5rk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-vX6qu0RiMU-xVwAf3RjDCA-1; Thu, 05 Dec 2019 10:43:51 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E88F6DB64;
	Thu,  5 Dec 2019 15:43:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 442425D6AE;
	Thu,  5 Dec 2019 15:43:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 51B291809567;
	Thu,  5 Dec 2019 15:43:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB5FgPdd022784 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Dec 2019 10:42:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3B49E10016E8; Thu,  5 Dec 2019 15:42:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63DE710013D9;
	Thu,  5 Dec 2019 15:42:22 +0000 (UTC)
Date: Thu, 5 Dec 2019 10:42:21 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <20191205154221.GA4792@redhat.com>
References: <20191204140742.26273-1-ntsironis@arrikto.com>
	<alpine.LRH.2.11.1912041907490.11561@mx.ewheeler.net>
	<20191204201710.GA31432@redhat.com>
	<a60f1571-fff1-8be8-5537-f604747b39c9@arrikto.com>
MIME-Version: 1.0
In-Reply-To: <a60f1571-fff1-8be8-5537-f604747b39c9@arrikto.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Eric Wheeler <dm-devel@lists.ewheeler.net>, dm-devel@redhat.com,
	thornber@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH 0/2] dm thin: Flush data device before
 committing metadata to avoid data corruption
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: vX6qu0RiMU-xVwAf3RjDCA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Dec 05 2019 at 10:31am -0500,
Nikos Tsironis <ntsironis@arrikto.com> wrote:

> On 12/4/19 10:17 PM, Mike Snitzer wrote:
> >On Wed, Dec 04 2019 at  2:58pm -0500,
> >Eric Wheeler <dm-devel@lists.ewheeler.net> wrote:
> >
> >>On Wed, 4 Dec 2019, Nikos Tsironis wrote:
> >>
> >>>The thin provisioning target maintains per thin device mappings that map
> >>>virtual blocks to data blocks in the data device.
> >>>
> >>>When we write to a shared block, in case of internal snapshots, or
> >>>provision a new block, in case of external snapshots, we copy the shared
> >>>block to a new data block (COW), update the mapping for the relevant
> >>>virtual block and then issue the write to the new data block.
> >>>
> >>>Suppose the data device has a volatile write-back cache and the
> >>>following sequence of events occur:
> >>
> >>For those with NV caches, can the data disk flush be optional (maybe as a
> >>table flag)?
> >
> >IIRC block core should avoid issuing the flush if not needed.  I'll have
> >a closer look to verify as much.
> >
> 
> For devices without a volatile write-back cache block core strips off
> the REQ_PREFLUSH and REQ_FUA bits from requests with a payload and
> completes empty REQ_PREFLUSH requests before entering the driver.
> 
> This happens in generic_make_request_checks():
> 
> 		/*
> 		 * Filter flush bio's early so that make_request based
> 		 * drivers without flush support don't have to worry
> 		 * about them.
> 		 */
> 		if (op_is_flush(bio->bi_opf) &&
> 		    !test_bit(QUEUE_FLAG_WC, &q->queue_flags)) {
> 		        bio->bi_opf &= ~(REQ_PREFLUSH | REQ_FUA);
> 		        if (!nr_sectors) {
> 		                status = BLK_STS_OK;
> 		                goto end_io;
> 		        }
> 		}
> 
> If I am not mistaken, it all depends on whether the underlying device
> reports the existence of a write back cache or not.

Yes, thanks for confirming my memory of the situation.

> You could check this by looking at /sys/block/<device>/queue/write_cache
> If it says "write back" then flushes will be issued.
> 
> In case the sysfs entry reports a "write back" cache for a device with a
> non-volatile write cache, I think you can change the kernel's view of
> the device by writing to this entry (you could also create a udev rule
> for this).
> 
> This way you can set the write cache as write through. This will
> eliminate the cache flushes issued by the kernel, without altering the
> device state (Documentation/block/queue-sysfs.rst).

Not delved into this aspect of Linux's capabilities but it strikes me as
"dangerous" to twiddle device capabilities like this.  Best to fix
driver to properly expose cache (or not, as the case may be).  It should
also be noted that with DM; the capabilities are stac ked up at device
creation time.  So any changes to the underlying devices will _not_ be
reflected to the high level DM device.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

