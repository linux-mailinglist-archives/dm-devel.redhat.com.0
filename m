Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A4F742D38FE
	for <lists+dm-devel@lfdr.de>; Wed,  9 Dec 2020 03:52:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607482332;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m6CrDTTZDZk6Q4dLzHTWMpd7Y16Q+CWoCKGWLrehYrE=;
	b=SfDX8cyHkC7GLL15TUTGffJSgmzBXK/ESVOLjgpJrtwhAWY21GG/bD7FGNAIOnAxv2PeJo
	rpXNJPp8m3rf7c02oOWQivGPOs50A9iHytsGwzJBAI5yaXclWHsk5zyxCpItctVlNqMmiO
	ekoymCv2f+ApeIk//HpV558o/ZtRd/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-mJZewHzAONWMwZXxezC7OQ-1; Tue, 08 Dec 2020 21:52:10 -0500
X-MC-Unique: mJZewHzAONWMwZXxezC7OQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 143421005513;
	Wed,  9 Dec 2020 02:52:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6270910013C0;
	Wed,  9 Dec 2020 02:52:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B987C180954D;
	Wed,  9 Dec 2020 02:51:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B92pfJT016775 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 21:51:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 88A065D6D5; Wed,  9 Dec 2020 02:51:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-139.pek2.redhat.com [10.72.12.139])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40E645D6AB;
	Wed,  9 Dec 2020 02:51:25 +0000 (UTC)
Date: Wed, 9 Dec 2020 10:51:21 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20201209025121.GD1217988@T590>
References: <20201208162829.2424563-1-hch@lst.de>
	<20201208162829.2424563-5-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201208162829.2424563-5-hch@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 08, 2020 at 05:28:27PM +0100, Christoph Hellwig wrote:
> Change the policy so that a BLKROSET on the whole device also affects
> partitions.  To quote Martin K. Petersen:
> 
> It's very common for database folks to twiddle the read-only state of
> block devices and partitions. I know that our users will find it very
> counter-intuitive that setting /dev/sda read-only won't prevent writes
> to /dev/sda1.
> 
> The existing behavior is inconsistent in the sense that doing:
> 
>   # blockdev --setro /dev/sda
>   # echo foo > /dev/sda1
> 
> permits writes. But:
> 
>   # blockdev --setro /dev/sda
>   <something triggers revalidate>
>   # echo foo > /dev/sda1
> 
> doesn't.
> 
> And a subsequent:
> 
>   # blockdev --setrw /dev/sda
>   # echo foo > /dev/sda1
> 
> doesn't work either since sda1's read-only policy has been inherited
> from the whole-disk device.
> 
> You need to do:
> 
>   # blockdev --rereadpt
> 
> after setting the whole-disk device rw to effectuate the same change on
> the partitions, otherwise they are stuck being read-only indefinitely.
> 
> However, setting the read-only policy on a partition does *not* require
> the revalidate step. As a matter of fact, doing the revalidate will blow
> away the policy setting you just made.
> 
> So the user needs to take different actions depending on whether they
> are trying to read-protect a whole-disk device or a partition. Despite
> using the same ioctl. That is really confusing.
> 
> I have lost count how many times our customers have had data clobbered
> because of ambiguity of the existing whole-disk device policy. The
> current behavior violates the principle of least surprise by letting the
> user think they write protected the whole disk when they actually
> didn't.
> 
> Suggested-by: Martin K. Petersen <martin.petersen@oracle.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> ---
>  block/genhd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/block/genhd.c b/block/genhd.c
> index d9f989c1514123..6e51ecb9280aca 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -1656,8 +1656,7 @@ EXPORT_SYMBOL(set_disk_ro);
>  
>  int bdev_read_only(struct block_device *bdev)
>  {
> -	return bdev->bd_read_only ||
> -		test_bit(GD_READ_ONLY, &bdev->bd_disk->state);
> +	return bdev->bd_read_only || get_disk_ro(bdev->bd_disk);
>  }
>  EXPORT_SYMBOL(bdev_read_only);
>  
> -- 
> 2.29.2
> 

Reviewed-by: Ming Lei <ming.lei@redhat.com>

-- 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

