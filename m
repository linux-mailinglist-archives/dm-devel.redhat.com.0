Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 343472D2966
	for <lists+dm-devel@lfdr.de>; Tue,  8 Dec 2020 11:59:56 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-3Wyxd29kOECuI6iCraO-rQ-1; Tue, 08 Dec 2020 05:59:53 -0500
X-MC-Unique: 3Wyxd29kOECuI6iCraO-rQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6545180A096;
	Tue,  8 Dec 2020 10:59:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BFE51001901;
	Tue,  8 Dec 2020 10:59:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A3553180954D;
	Tue,  8 Dec 2020 10:59:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B8AxcKx004568 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 05:59:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4406C112C267; Tue,  8 Dec 2020 10:59:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FDB8112C266
	for <dm-devel@redhat.com>; Tue,  8 Dec 2020 10:59:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8A39100FBC9
	for <dm-devel@redhat.com>; Tue,  8 Dec 2020 10:59:35 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-391-bgio22RfNN2eZqs_9j90Fw-1;
	Tue, 08 Dec 2020 05:59:31 -0500
X-MC-Unique: bgio22RfNN2eZqs_9j90Fw-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1A43D6736F; Tue,  8 Dec 2020 11:59:29 +0100 (CET)
Date: Tue, 8 Dec 2020 11:59:27 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20201208105927.GB21762@lst.de>
References: <20201207131918.2252553-1-hch@lst.de>
	<20201207131918.2252553-5-hch@lst.de>
	<20201208102923.GD1202995@T590>
MIME-Version: 1.0
In-Reply-To: <20201208102923.GD1202995@T590>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>,
	Mike Snitzer <snitzer@redhat.com>, Oleksii Kurochko <olkuroch@cisco.com>,
	ceph-devel@vger.kernel.org, Dongsheng Yang <dongsheng.yang@easystack.cn>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-nvme@lists.infradead.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Ilya Dryomov <idryomov@gmail.com>, Christoph Hellwig <hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 08, 2020 at 06:29:23PM +0800, Ming Lei wrote:
> > -		test_bit(GD_READ_ONLY, &bdev->bd_disk->state);
> > +	return bdev->bd_read_only || get_disk_ro(bdev->bd_disk);
> >  }
> >  EXPORT_SYMBOL(bdev_read_only);
> 
> I think this patch should be folded into previous one, otherwise
> bdev_read_only(part) may return false even though ioctl(BLKROSET)
> has been done on the whole disk.

The above is the existing behavior going back back very far, and I feel
much more comfortable having a small self-contained patch that changes
this behavior.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

