Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id ACFEC2E0C13
	for <lists+dm-devel@lfdr.de>; Tue, 22 Dec 2020 15:54:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608648845;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FSmBPPUP0z5/N8yxLmkfNQYAMnIa+qkyCuyDNBJe06k=;
	b=UmgT5Ivwb53fWHSy+k3OXTxoAGYCT8Yhy8R3U+tl6iAkqcpHU3+lBSoVpQ0p7ApoWjiBO0
	mwG0SJpe2B62G6mc0pB7oQS0ApiaPOmAPkiBWOZowgaZt8tQJvA/Psvn763gqZUEb9B+7c
	YbdvABq6JGIYjUQoIxCigD1I2kZqi00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-ryd8P-U4MIWneNivc5wRFA-1; Tue, 22 Dec 2020 09:54:02 -0500
X-MC-Unique: ryd8P-U4MIWneNivc5wRFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1044A803620;
	Tue, 22 Dec 2020 14:53:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 375E46A253;
	Tue, 22 Dec 2020 14:53:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EDBF65002C;
	Tue, 22 Dec 2020 14:53:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BMEra1B022671 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 22 Dec 2020 09:53:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 649AC5D9E2; Tue, 22 Dec 2020 14:53:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C21AC5D9CC;
	Tue, 22 Dec 2020 14:53:27 +0000 (UTC)
Date: Tue, 22 Dec 2020 09:53:27 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	dm-devel@redhat.com
Message-ID: <20201222145327.GC12885@redhat.com>
References: <20201222095056.7a5ac0a0@canb.auug.org.au>
	<20201222131528.GA29822@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201222131528.GA29822@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Alasdair G Kergon <agk@redhat.com>
Subject: [dm-devel] DM's filesystem lookup in dm_get_dev_t() [was: Re:
 linux-next: manual merge of the device-mapper tree with Linus' tree]
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

[added linux-block and dm-devel, if someone replies to this email to
continue "proper discussion" _please_ at least drop sfr and linux-next
from Cc]

On Tue, Dec 22 2020 at  8:15am -0500,
Christoph Hellwig <hch@lst.de> wrote:

> Mike, Hannes,
> 
> I think this patch is rather harmful.  Why does device mapper even
> mix file system path with a dev_t and all the other weird forms
> parsed by name_to_dev_t, which was supposed to be be for the early
> init code where no file system is available.

OK, I'll need to revisit (unless someone beats me to it) because this
could've easily been a blind-spot for me when the dm-init code went in.
Any dm-init specific enabling interface shouldn't be used by more
traditional DM interfaces.  So Hannes' change might be treating symptom
rather than the core problem (which would be better treated by factoring
out dm-init requirements for a name_to_dev_t()-like interface?).

DM has supported passing maj:min and blockdev names on DM table lines
forever... so we'll need to be very specific about where/why things
regressed.

> Can we please kick off a proper discussion for this on the linux-block
> list?

Sure, done. But I won't drive that discussion in the near-term. I need
to take some time off for a few weeks.

In the meantime I'll drop Hannes' patch for 5.11; I'm open to an
alternative fix that I'd pickup during 5.11-rcX.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

