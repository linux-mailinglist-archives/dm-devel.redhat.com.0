Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 23A5D2FF14F
	for <lists+dm-devel@lfdr.de>; Thu, 21 Jan 2021 18:04:28 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-_7M7njgLOsiQEmqKJyayFg-1; Thu, 21 Jan 2021 12:04:22 -0500
X-MC-Unique: _7M7njgLOsiQEmqKJyayFg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1399B107ACE4;
	Thu, 21 Jan 2021 17:04:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FDB45F9B5;
	Thu, 21 Jan 2021 17:04:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DEB5A4BB7B;
	Thu, 21 Jan 2021 17:04:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10LH3uc5002918 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 21 Jan 2021 12:03:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DB4252026D3F; Thu, 21 Jan 2021 17:03:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6B142026D3A
	for <dm-devel@redhat.com>; Thu, 21 Jan 2021 17:03:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE9A8101A566
	for <dm-devel@redhat.com>; Thu, 21 Jan 2021 17:03:53 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-594-ZcyNr1a8ONqi82Yr4OIsxQ-1;
	Thu, 21 Jan 2021 12:03:50 -0500
X-MC-Unique: ZcyNr1a8ONqi82Yr4OIsxQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id DCF1568B05; Thu, 21 Jan 2021 18:03:47 +0100 (CET)
Date: Thu, 21 Jan 2021 18:03:47 +0100
From: Christoph Hellwig <hch@lst.de>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20210121170347.GA29511@lst.de>
References: <20201210092459.81939-1-hare@suse.de>
	<29294c6553c7ec3d31e1bc3b9de524e9c7060f07.camel@suse.com>
	<e8d2e33fd4cb6ecb8c727b3c3c4c5e4c9e260c33.camel@suse.com>
	<20210121160933.GA4104@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210121160933.GA4104@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, hch@lst.de, Martin Wilck <mwilck@suse.com>
Subject: Re: [dm-devel] dm: avoid filesystem lookup in dm_get_dev_t()
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 21, 2021 at 11:09:33AM -0500, Mike Snitzer wrote:
> > Mike, do you need anything more to apply this one? Do you want a
> > cleaned-up resend?
> 
> It got hung up with Christoph correctly requesting more discussion, last
> linux-block/lkml mail on the associated thread I kicked off is here:
> https://lkml.org/lkml/2020/12/23/76
> 
> Basically if Hannes or yourself would like to review that thread and
> send a relevant v2 it'd really help move this forward.  I'm bogged down
> with too many competing tasks.  You guys may be able to act on this line
> of development/fixing quicker than I'll get to it.

I'll get back to this ASAP, sorry.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

