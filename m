Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA7C2D3842
	for <lists+dm-devel@lfdr.de>; Wed,  9 Dec 2020 02:24:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607477049;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zZIckrZDMsPssxDVD/p2HhXGhXFasLkQGFKlzltkScM=;
	b=FVDKRC5eeSiSF/tT5yhu7chebiilxDvh8FDx+3CjtkJ0kdNfeZgxwv4unuOOztrBq2rNx7
	5/U/xCB24dm/2oPQnT0Jcfzoh0oqGR5TPBYWz/Fyci5YVEKiZIeMTUjYJahhHwUfC10Vhj
	hLFjPaib8RG5unNALz0eE1WpZq7Rb8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-wKmnj-4CMxeHgPxxylXiEA-1; Tue, 08 Dec 2020 20:24:07 -0500
X-MC-Unique: wKmnj-4CMxeHgPxxylXiEA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E221107ACE3;
	Wed,  9 Dec 2020 01:23:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5CCE19C78;
	Wed,  9 Dec 2020 01:23:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1CA174BB7B;
	Wed,  9 Dec 2020 01:23:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B91NbVA006106 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 20:23:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8894260BF1; Wed,  9 Dec 2020 01:23:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-139.pek2.redhat.com [10.72.12.139])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEBD660BE2;
	Wed,  9 Dec 2020 01:23:21 +0000 (UTC)
Date: Wed, 9 Dec 2020 09:23:17 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20201209012317.GC1217988@T590>
References: <20201207131918.2252553-1-hch@lst.de>
	<20201207131918.2252553-5-hch@lst.de>
	<20201208102923.GD1202995@T590> <20201208105927.GB21762@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201208105927.GB21762@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>,
	Mike Snitzer <snitzer@redhat.com>, Oleksii Kurochko <olkuroch@cisco.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-nvme@lists.infradead.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 4/6] block: propagate BLKROSET on the whole
 device to all partitions
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 08, 2020 at 11:59:27AM +0100, Christoph Hellwig wrote:
> On Tue, Dec 08, 2020 at 06:29:23PM +0800, Ming Lei wrote:
> > > -		test_bit(GD_READ_ONLY, &bdev->bd_disk->state);
> > > +	return bdev->bd_read_only || get_disk_ro(bdev->bd_disk);
> > >  }
> > >  EXPORT_SYMBOL(bdev_read_only);
> > 
> > I think this patch should be folded into previous one, otherwise
> > bdev_read_only(part) may return false even though ioctl(BLKROSET)
> > has been done on the whole disk.
> 
> The above is the existing behavior going back back very far, and I feel
> much more comfortable having a small self-contained patch that changes
> this behavior.
> 

OK, then looks fine:

Reviewed-by: Ming Lei <ming.lei@redhat.com>

-- 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

