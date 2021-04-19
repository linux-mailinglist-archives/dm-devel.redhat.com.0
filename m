Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1B5363EF7
	for <lists+dm-devel@lfdr.de>; Mon, 19 Apr 2021 11:42:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-k2o1vn2BNSmrY8-ZeD1xzQ-1; Mon, 19 Apr 2021 05:42:25 -0400
X-MC-Unique: k2o1vn2BNSmrY8-ZeD1xzQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D527801814;
	Mon, 19 Apr 2021 09:42:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11B469CA0;
	Mon, 19 Apr 2021 09:42:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 27A7E1809C82;
	Mon, 19 Apr 2021 09:42:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13J9gE2c029623 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 05:42:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2E09B30BB9; Mon, 19 Apr 2021 09:42:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28BFF2EFB0
	for <dm-devel@redhat.com>; Mon, 19 Apr 2021 09:42:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAE958037AD
	for <dm-devel@redhat.com>; Mon, 19 Apr 2021 09:42:10 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-84-Gf06DBV1OTi-zuT_D3arHA-1; Mon, 19 Apr 2021 05:42:05 -0400
X-MC-Unique: Gf06DBV1OTi-zuT_D3arHA-1
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lYQNF-00DXWh-2b; Mon, 19 Apr 2021 09:39:47 +0000
Date: Mon, 19 Apr 2021 10:39:21 +0100
From: "hch@infradead.org" <hch@infradead.org>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20210419093921.GA3226573@infradead.org>
References: <20210416030528.757513-1-damien.lemoal@wdc.com>
	<20210416030528.757513-4-damien.lemoal@wdc.com>
	<20210416161720.GA7604@twin.jikos.cz>
	<20210419092855.GA3223318@infradead.org>
	<BL0PR04MB651459AE484861FD4EA20669E7499@BL0PR04MB6514.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BL0PR04MB651459AE484861FD4EA20669E7499@BL0PR04MB6514.namprd04.prod.outlook.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	"dsterba@suse.cz" <dsterba@suse.cz>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Josef Bacik <josef@toxicpanda.com>,
	"hch@infradead.org" <hch@infradead.org>, David Sterba <dsterba@suse.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
	Naohiro Aota <Naohiro.Aota@wdc.com>
Subject: Re: [dm-devel] [PATCH 3/4] btrfs: zoned: fail mount if the device
 does not support zone append
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 19, 2021 at 09:35:37AM +0000, Damien Le Moal wrote:
> This is only to avoid someone from running zoned-btrfs on top of dm-crypt.
> Without this patch, mount will be OK and file data writes will also actually be
> OK. But all reads will miserably fail... I would rather have this patch in than
> deal with the "bug reports" about btrfs failing to read files. No ?
> 
> Note that like you, I dislike having to add such code. But it was my oversight
> when I worked on getting dm-crypt to work on zoned drives. Zone append was
> overlooked at that time... My bad, really.

dm-crypt needs to stop pretending it supports zoned devices if it
doesn't.  Note that dm-crypt could fairly trivially support zone append
by doing the same kind of emulation that the sd driver does.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

