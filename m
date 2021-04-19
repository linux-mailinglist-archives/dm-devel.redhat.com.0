Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0908B363F0C
	for <lists+dm-devel@lfdr.de>; Mon, 19 Apr 2021 11:44:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-3giisIIQMWOvJyLQNiVBKQ-1; Mon, 19 Apr 2021 05:44:03 -0400
X-MC-Unique: 3giisIIQMWOvJyLQNiVBKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82B50107ACC7;
	Mon, 19 Apr 2021 09:43:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23D0160C04;
	Mon, 19 Apr 2021 09:43:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED1341806D17;
	Mon, 19 Apr 2021 09:43:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13J9hliC029774 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 05:43:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 70B212160289; Mon, 19 Apr 2021 09:43:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B44B2182DF3
	for <dm-devel@redhat.com>; Mon, 19 Apr 2021 09:43:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1580B100DE77
	for <dm-devel@redhat.com>; Mon, 19 Apr 2021 09:43:44 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-108-6ZMTijqKM7OtPUzfMXDbGQ-1; Mon, 19 Apr 2021 05:43:42 -0400
X-MC-Unique: 6ZMTijqKM7OtPUzfMXDbGQ-1
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lYQD9-00DWee-NI; Mon, 19 Apr 2021 09:29:02 +0000
Date: Mon, 19 Apr 2021 10:28:55 +0100
From: Christoph Hellwig <hch@infradead.org>
To: dsterba@suse.cz, Damien Le Moal <damien.lemoal@wdc.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-nvme@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Naohiro Aota <naohiro.aota@wdc.com>
Message-ID: <20210419092855.GA3223318@infradead.org>
References: <20210416030528.757513-1-damien.lemoal@wdc.com>
	<20210416030528.757513-4-damien.lemoal@wdc.com>
	<20210416161720.GA7604@twin.jikos.cz>
MIME-Version: 1.0
In-Reply-To: <20210416161720.GA7604@twin.jikos.cz>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 16, 2021 at 06:17:21PM +0200, David Sterba wrote:
> On Fri, Apr 16, 2021 at 12:05:27PM +0900, Damien Le Moal wrote:
> > From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> > 
> > For zoned btrfs, zone append is mandatory to write to a sequential write
> > only zone, otherwise parallel writes to the same zone could result in
> > unaligned write errors.
> > 
> > If a zoned block device does not support zone append (e.g. a dm-crypt
> > zoned device using a non-NULL IV cypher), fail to mount.
> > 
> > Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> > Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> 
> Added to misc-next, thanks. I'll queue it for 5.13, it's not an urgent
> fix for 5.12 release but i'll tag it as stable so it'll apear in 5.12.x
> later.

Please don't.  Zone append is a strict requirement for zoned devices,
no need to add cargo cult code like this everywhere.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

