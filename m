Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 86F0811495C
	for <lists+dm-devel@lfdr.de>; Thu,  5 Dec 2019 23:35:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575585314;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1INIkPq2xzWT8UMFTIhAQl1poU2Xw48dNKZAC1xEzAY=;
	b=MEhkwhoK/TGmDnZN9JKwDmXk592sAAx1mfJdqpGjoljBaN93eRv5xr+OWyjwN+GkGYh48d
	/kIJZvXGoyXcpN8NhAA5bOIh7Za5Efpwv4PAzzi4ZoD5DtArXiUKACXTEpT357oRCNfQTT
	arkZWfNH0ihXCxdLW58OEYsgB+DbvBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-1FmVkEC_OiyXnKPw0-_0Hw-1; Thu, 05 Dec 2019 17:35:12 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8C861005514;
	Thu,  5 Dec 2019 22:35:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D897D5D6BB;
	Thu,  5 Dec 2019 22:35:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 572FA65D31;
	Thu,  5 Dec 2019 22:34:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB5MYfcC022154 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Dec 2019 17:34:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EBAD010A1D16; Thu,  5 Dec 2019 22:34:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E71A610A1D1A
	for <dm-devel@redhat.com>; Thu,  5 Dec 2019 22:34:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 469068E314C
	for <dm-devel@redhat.com>; Thu,  5 Dec 2019 22:34:38 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [173.205.220.69]) by
	relay.mimecast.com with ESMTP id us-mta-176-uHz4B3pEPZuqa6NAKTlR2A-1;
	Thu, 05 Dec 2019 17:34:34 -0500
Received: from localhost (localhost [127.0.0.1])
	by mx.ewheeler.net (Postfix) with ESMTP id 103A5A0692;
	Thu,  5 Dec 2019 22:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at ewheeler.net
Received: from mx.ewheeler.net ([127.0.0.1])
	by localhost (mx.ewheeler.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id k5C7jLapX4X4; Thu,  5 Dec 2019 22:34:02 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [173.205.220.69])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx.ewheeler.net (Postfix) with ESMTPSA id 49A4FA0633;
	Thu,  5 Dec 2019 22:34:02 +0000 (UTC)
Date: Thu, 5 Dec 2019 22:34:01 +0000 (UTC)
From: Eric Wheeler <dm-devel@lists.ewheeler.net>
X-X-Sender: lists@mx.ewheeler.net
To: Nikos Tsironis <ntsironis@arrikto.com>
In-Reply-To: <a60f1571-fff1-8be8-5537-f604747b39c9@arrikto.com>
Message-ID: <alpine.LRH.2.11.1912052227130.11561@mx.ewheeler.net>
References: <20191204140742.26273-1-ntsironis@arrikto.com>
	<alpine.LRH.2.11.1912041907490.11561@mx.ewheeler.net>
	<20191204201710.GA31432@redhat.com>
	<a60f1571-fff1-8be8-5537-f604747b39c9@arrikto.com>
User-Agent: Alpine 2.11 (LRH 23 2013-08-11)
MIME-Version: 1.0
X-MC-Unique: uHz4B3pEPZuqa6NAKTlR2A-1
X-MC-Unique: 1FmVkEC_OiyXnKPw0-_0Hw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB5MYfcC022154
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, thornber@redhat.com, agk@redhat.com,
	Mike Snitzer <snitzer@redhat.com>
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 5 Dec 2019, Nikos Tsironis wrote:
> On 12/4/19 10:17 PM, Mike Snitzer wrote:
> > On Wed, Dec 04 2019 at  2:58pm -0500,
> > Eric Wheeler <dm-devel@lists.ewheeler.net> wrote:
> > 
> > > On Wed, 4 Dec 2019, Nikos Tsironis wrote:
> > >
> > > > The thin provisioning target maintains per thin device mappings that map
> > > > virtual blocks to data blocks in the data device.
> > > >
> > > > When we write to a shared block, in case of internal snapshots, or
> > > > provision a new block, in case of external snapshots, we copy the shared
> > > > block to a new data block (COW), update the mapping for the relevant
> > > > virtual block and then issue the write to the new data block.
> > > >
> > > > Suppose the data device has a volatile write-back cache and the
> > > > following sequence of events occur:
> > >
> > > For those with NV caches, can the data disk flush be optional (maybe as a
> > > table flag)?
> > 
> > IIRC block core should avoid issuing the flush if not needed.  I'll have
> > a closer look to verify as much.
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
> 
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

Interesting, I'll remember that. I think this is a documentation bug, isn't this backwards:
	'This means that it might not be safe to toggle the setting from 
	"write back" to "write through", since that will also eliminate
	cache flushes issued by the kernel.'
	[https://www.kernel.org/doc/Documentation/block/queue-sysfs.rst]


How does this work with stacking blockdevs?  Does it inherit from the 
lower-level dev? If an upper-level is misconfigured, would a writeback at 
higher levels would clear the flush for lower levels?

--
Eric Wheeler



> Nikos
> 
> > Mike
> > 
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

