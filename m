Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE6A39B280
	for <lists+dm-devel@lfdr.de>; Fri,  4 Jun 2021 08:25:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-4e-RmMgsPKCPvFj1-pjncA-1; Fri, 04 Jun 2021 02:25:27 -0400
X-MC-Unique: 4e-RmMgsPKCPvFj1-pjncA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1B8D801B13;
	Fri,  4 Jun 2021 06:25:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91683E2F8;
	Fri,  4 Jun 2021 06:25:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B46E34ED79;
	Fri,  4 Jun 2021 06:25:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 153FbOWM008587 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Jun 2021 11:37:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 85A63108BED; Thu,  3 Jun 2021 15:37:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39E85113B4B
	for <dm-devel@redhat.com>; Thu,  3 Jun 2021 15:37:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81B63101D230
	for <dm-devel@redhat.com>; Thu,  3 Jun 2021 15:37:21 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
	[209.85.217.54]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-322-4d47S5dzPtGU6IbdMPAqdg-1; Thu, 03 Jun 2021 11:37:19 -0400
X-MC-Unique: 4d47S5dzPtGU6IbdMPAqdg-1
Received: by mail-vs1-f54.google.com with SMTP id s22so3199313vsl.10
	for <dm-devel@redhat.com>; Thu, 03 Jun 2021 08:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+W0QahdA5jm5lLp4qGqziVkevJrOYYIsAeli4hbSoMY=;
	b=P0HoTRH+Lmwx0StGNXNTnD8h6BiMsXeGbvVuVSat8BwJYKDgo+Q3rSlGPDTHAMW2V+
	jMwryoNXJCKEfGClBtH3N9+3Xj6SADj51tvioZGNRv2uWOwILW5+n9cE1jBbTKyDSuZT
	bXUztrYX/PapJ0P8AI/gJBLWzqDUwm9qWJf8MoaCtIYWLQ4jSses3qEuyRxNnC9HUq+d
	qRrE0VmrYwnAtMfZW3J/6KOmjmMQ66ZueYVz2nTkrw+QeqW5vXn60PHxRGRBVBVuzIjn
	Lc7eq0D4sw6yPSGSjHEjfPbUGUZPcJ79a2GLE9J/uvWncG6y9pkEu02tifphayKzJWld
	xyMg==
X-Gm-Message-State: AOAM532gF6aGl7vti9lkoCr1ET+YHUb4wZFveeYnHDLfUN5xmTcmTyx/
	OCAgAN65yNeZ6ADXXPxmTq0PiGuTOtBa+VZF1uHEtQ==
X-Google-Smtp-Source: ABdhPJzM3LSrPJI4FkB0laodTTeEei+m50SowhpqaGtsNgUdvieHcvbYUQloJUD/a79xzNmd816023E4d1PORKHhPJg=
X-Received: by 2002:a05:6102:3023:: with SMTP id
	v3mr756919vsa.19.1622734639015; 
	Thu, 03 Jun 2021 08:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210602065345.355274-1-hch@lst.de>
	<20210602065345.355274-8-hch@lst.de>
In-Reply-To: <20210602065345.355274-8-hch@lst.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Jun 2021 17:36:42 +0200
Message-ID: <CAPDyKFoJssCnHv5tmG4vJJ9m0Zj5HkMEVYvnsjamvyemusZaUg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
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
X-Mailman-Approved-At: Fri, 04 Jun 2021 02:21:36 -0400
Cc: Justin Sanders <justin@coraid.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Mike Snitzer <snitzer@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	virtualization@lists.linux-foundation.org, dm-devel@redhat.com,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Jack Wang <jinpu.wang@ionos.com>, Tim Waugh <tim@cyberelk.net>,
	linux-s390@vger.kernel.org, Maxim Levitsky <maximlevitsky@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
	Vasily Gorbik <gor@linux.ibm.com>, Alex Dubov <oakad@yahoo.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Heiko Carstens <hca@linux.ibm.com>, Josef Bacik <josef@toxicpanda.com>,
	Denis Efremov <efremov@linux.com>, nbd@other.debian.org,
	linux-block <linux-block@vger.kernel.org>,
	ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Geoff Levand <geoff@infradead.org>, linux-mmc <linux-mmc@vger.kernel.org>,
	linux-mtd@lists.infradead.org,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [dm-devel] [PATCH 07/30] ms_block: use blk_mq_alloc_disk
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2 Jun 2021 at 08:54, Christoph Hellwig <hch@lst.de> wrote:
>
> Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
> allocation.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  drivers/memstick/core/ms_block.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
> index 0bacf4268f83..dac258d12aca 100644
> --- a/drivers/memstick/core/ms_block.c
> +++ b/drivers/memstick/core/ms_block.c
> @@ -2110,21 +2110,17 @@ static int msb_init_disk(struct memstick_dev *card)
>         if (msb->disk_id  < 0)
>                 return msb->disk_id;
>
> -       msb->disk = alloc_disk(0);
> -       if (!msb->disk) {
> -               rc = -ENOMEM;
> +       rc = blk_mq_alloc_sq_tag_set(&msb->tag_set, &msb_mq_ops, 2,
> +                                    BLK_MQ_F_SHOULD_MERGE);
> +       if (rc)
>                 goto out_release_id;
> -       }
>
> -       msb->queue = blk_mq_init_sq_queue(&msb->tag_set, &msb_mq_ops, 2,
> -                                               BLK_MQ_F_SHOULD_MERGE);
> -       if (IS_ERR(msb->queue)) {
> -               rc = PTR_ERR(msb->queue);
> -               msb->queue = NULL;
> -               goto out_put_disk;
> +       msb->disk = blk_mq_alloc_disk(&msb->tag_set, card);
> +       if (IS_ERR(msb->disk)) {
> +               rc = PTR_ERR(msb->disk);
> +               goto out_free_tag_set;
>         }
> -
> -       msb->queue->queuedata = card;
> +       msb->queue = msb->disk->queue;
>
>         blk_queue_max_hw_sectors(msb->queue, MS_BLOCK_MAX_PAGES);
>         blk_queue_max_segments(msb->queue, MS_BLOCK_MAX_SEGS);
> @@ -2135,7 +2131,6 @@ static int msb_init_disk(struct memstick_dev *card)
>         sprintf(msb->disk->disk_name, "msblk%d", msb->disk_id);
>         msb->disk->fops = &msb_bdops;
>         msb->disk->private_data = msb;
> -       msb->disk->queue = msb->queue;
>
>         capacity = msb->pages_in_block * msb->logical_block_count;
>         capacity *= (msb->page_size / 512);
> @@ -2155,8 +2150,8 @@ static int msb_init_disk(struct memstick_dev *card)
>         dbg("Disk added");
>         return 0;
>
> -out_put_disk:
> -       put_disk(msb->disk);
> +out_free_tag_set:
> +       blk_mq_free_tag_set(&msb->tag_set);
>  out_release_id:
>         mutex_lock(&msb_disk_lock);
>         idr_remove(&msb_disk_idr, msb->disk_id);
> --
> 2.30.2
>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

