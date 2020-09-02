Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CDFB825BB38
	for <lists+dm-devel@lfdr.de>; Thu,  3 Sep 2020 08:48:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-_oZS0h4MM1aCu2_8fc0GhA-1; Thu, 03 Sep 2020 02:48:50 -0400
X-MC-Unique: _oZS0h4MM1aCu2_8fc0GhA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C542518B9ED1;
	Thu,  3 Sep 2020 06:48:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0E6D19C71;
	Thu,  3 Sep 2020 06:48:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 57F53181A050;
	Thu,  3 Sep 2020 06:48:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08267CC1021011 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 02:07:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 88B592166BA3; Wed,  2 Sep 2020 06:07:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8419B2166BA2
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 06:07:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7254787EF92
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 06:07:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-551-ct7xKa5KPlaF9Unr0HRelQ-1;
	Wed, 02 Sep 2020 02:07:07 -0400
X-MC-Unique: ct7xKa5KPlaF9Unr0HRelQ-1
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7DDC8208B3
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 06:07:06 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id w14so4417292ljj.4
	for <dm-devel@redhat.com>; Tue, 01 Sep 2020 23:07:06 -0700 (PDT)
X-Gm-Message-State: AOAM530IT96AMTYBmcnRcTvhb67WiFVnKyWb11u8srjQpY9p/QypvjDJ
	VuX8LJxHkcpf7QhFW1ZVELVF3+LDboL6slTWwGA=
X-Google-Smtp-Source: ABdhPJyE5jGOrYyZE6ORaRQIp51/fhLfZD64Ax0jpOVcS4L2G+U2YIU+6jbqUjHlXVyGhP2izG2P3ekqYZd5wXuophY=
X-Received: by 2002:a2e:81c2:: with SMTP id s2mr2472465ljg.10.1599026824658;
	Tue, 01 Sep 2020 23:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200901155748.2884-1-hch@lst.de>
	<20200901155748.2884-5-hch@lst.de>
In-Reply-To: <20200901155748.2884-5-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Tue, 1 Sep 2020 23:06:52 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5-nfKQK_178R-Y+ps6KLNMrwvWe0Rh5=M1-xvcKHYTgg@mail.gmail.com>
Message-ID: <CAPhsuW5-nfKQK_178R-Y+ps6KLNMrwvWe0Rh5=M1-xvcKHYTgg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 03 Sep 2020 02:48:19 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid <linux-raid@vger.kernel.org>,
	linux-scsi@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-nvdimm@lists.01.org, open list <linux-kernel@vger.kernel.org>,
	linux-nvme@lists.infradead.org,
	Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
	Dan Williams <dan.j.williams@intel.com>, nbd@other.debian.org,
	virtualization@lists.linux-foundation.org, ceph-devel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 4/9] block: add a new revalidate_disk_size
	helper
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 1, 2020 at 9:00 AM Christoph Hellwig <hch@lst.de> wrote:
>
[...]

>  drivers/md/md-cluster.c       |  6 ++---
>  drivers/md/md-linear.c        |  2 +-
>  drivers/md/md.c               | 10 ++++-----

For md bits:
Acked-by: Song Liu <song@kernel.org>

[...]
>
> +/**
> + * revalidate_disk_size - checks for disk size change and adjusts bdev size.
> + * @disk: struct gendisk to check
> + * @verbose: if %true log a message about a size change if there is any
> + *
> + * This routine checks to see if the bdev size does not match the disk size
> + * and adjusts it if it differs. When shrinking the bdev size, its all caches
> + * are freed.
> + */
> +void revalidate_disk_size(struct gendisk *disk, bool verbose)
> +{
> +       struct block_device *bdev;
> +
> +       /*
> +        * Hidden disks don't have associated bdev so there's no point in
> +        * revalidating them.
> +        */
> +       if (disk->flags & GENHD_FL_HIDDEN)
> +               return;
> +
> +       bdev = bdget_disk(disk, 0);
> +       if (bdev) {
> +               check_disk_size_change(disk, bdev, verbose);
> +               bdput(bdev);
> +       }
> +}
> +EXPORT_SYMBOL(revalidate_disk_size);

Shall we use EXPORT_SYMBOL_GPL() here?

[...]

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

