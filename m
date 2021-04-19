Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE49364564
	for <lists+dm-devel@lfdr.de>; Mon, 19 Apr 2021 15:55:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618840542;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QL+g85JLmwuvjHuziS3H8oa0Ljiv24Vf3+bBpD1Icmo=;
	b=WhIKbhlthN/92qWThkB7Hv5cj7uj8wiLqmYeNT5yUf9AaG7GA5+8r7aQC4kbbmK4W6z9o5
	MCu4N29yUn4XsFhOIy93uohU8qpCDO9++BqcJljSDbx9Ou0RrGI7ZQw1BfSOiQMxw8IVdg
	T1JnEYzs4nOIo9YiE37JAximpljSOpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-rMOhOIBaPReC3IhoHP4fjA-1; Mon, 19 Apr 2021 09:55:39 -0400
X-MC-Unique: rMOhOIBaPReC3IhoHP4fjA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C9CE801814;
	Mon, 19 Apr 2021 13:55:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4202460BF1;
	Mon, 19 Apr 2021 13:55:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 722211809C82;
	Mon, 19 Apr 2021 13:55:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13JDtORI029775 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 09:55:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C52B45D9C0; Mon, 19 Apr 2021 13:55:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FB8E5D9CA;
	Mon, 19 Apr 2021 13:55:18 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 13JDtH4F018187; Mon, 19 Apr 2021 09:55:17 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 13JDtHQu018179; Mon, 19 Apr 2021 09:55:17 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Mon, 19 Apr 2021 09:55:17 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Damien Le Moal <Damien.LeMoal@wdc.com>
In-Reply-To: <BL0PR04MB65147D94E7E30C3E1063A282E7499@BL0PR04MB6514.namprd04.prod.outlook.com>
Message-ID: <alpine.LRH.2.02.2104190951070.17565@file01.intranet.prod.int.rdu2.redhat.com>
References: <20210417023323.852530-1-damien.lemoal@wdc.com>
	<alpine.LRH.2.02.2104190840310.9677@file01.intranet.prod.int.rdu2.redhat.com>
	<BL0PR04MB65147D94E7E30C3E1063A282E7499@BL0PR04MB6514.namprd04.prod.outlook.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>, Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 0/3] Fix dm-crypt zoned block device
 support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Mon, 19 Apr 2021, Damien Le Moal wrote:

> > I would say that it is incompatible with all dm targets - even the linear 
> > target is changing the sector number and so it may redirect the write 
> > outside of the range specified in dm-table and cause corruption.
> 
> DM remapping of BIO sectors is zone compatible because target entries must be
> zone aligned. In the case of zone append, the BIO sector always point to the
> start sector of the target zone. DM sector remapping will remap that to another
> zone start as all zones are the same size. No issue here. We extensively use
> dm-linear for various test environment to reduce the size of the device tested
> (to speed up tests). I am confident there are no problems there.
> 
> > Instead of complicating device mapper with imperfect support, I would just 
> > disable REQ_OP_ZONE_APPEND on device mapper at all.
> 
> That was my initial approach, but for dm-crypt only since other targets that
> support zoned devices are fine. However, this breaks zoned block device
> requirement that zone append be supported so that users are presented with a
> uniform interface for different devices. So while simple to do, disabling zone
> append is far from ideal.

So, we could enable it for the linear target and disable for all other 
targets?

I talked with Milan about it and he doesn't want to add more bloat to the 
crypt target. I agree with him.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

