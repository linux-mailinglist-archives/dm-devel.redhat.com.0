Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 84E2D263F57
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 10:08:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-BhA9gfqwOL2UG6rJGDfthg-1; Thu, 10 Sep 2020 04:07:17 -0400
X-MC-Unique: BhA9gfqwOL2UG6rJGDfthg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 801161882FCC;
	Thu, 10 Sep 2020 08:07:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B56863A40;
	Thu, 10 Sep 2020 08:07:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D7F3180B655;
	Thu, 10 Sep 2020 08:07:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0890u6ee008922 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Sep 2020 20:56:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 68748200A799; Wed,  9 Sep 2020 00:56:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 632422014E1B
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 00:56:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E7B2800296
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 00:56:04 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-159-eTY0_hWYMMWEvowwKxNMsg-1;
	Tue, 08 Sep 2020 20:56:01 -0400
X-MC-Unique: eTY0_hWYMMWEvowwKxNMsg-1
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 99C3721D41
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 00:56:00 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id c2so1238226ljj.12
	for <dm-devel@redhat.com>; Tue, 08 Sep 2020 17:56:00 -0700 (PDT)
X-Gm-Message-State: AOAM531A6xHMYWa/FC0XQH145CknpJoSU9cHfAXROBtXRnRlUAWSSII7
	7GkGGBp419gpTPHDFqf76r2zWlxV39G6PN65wyk=
X-Google-Smtp-Source: ABdhPJxM7jCblK+I3K12WYnFdTKastGkaOpZLr2TCZ6RdAZ0LK1RcX7wDsfx2yoNcvq/FpYJy3EsInbbGExnKObCwTE=
X-Received: by 2002:a2e:9c8d:: with SMTP id x13mr523960lji.392.1599612958934; 
	Tue, 08 Sep 2020 17:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200903054104.228829-1-hch@lst.de>
	<20200903054104.228829-5-hch@lst.de>
In-Reply-To: <20200903054104.228829-5-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Tue, 8 Sep 2020 17:55:48 -0700
X-Gmail-Original-Message-ID: <CAPhsuW62Cd329s-LUR9uQVcFvn4pbOj7H0434P7zwRhbNVScgA@mail.gmail.com>
Message-ID: <CAPhsuW62Cd329s-LUR9uQVcFvn4pbOj7H0434P7zwRhbNVScgA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 10 Sep 2020 04:06:55 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid <linux-raid@vger.kernel.org>,
	linux-scsi@vger.kernel.org,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	linux-s390@vger.kernel.org, linux-mmc@vger.kernel.org,
	open list <linux-kernel@vger.kernel.org>,
	linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org, drbd-dev@tron.linbit.com
Subject: Re: [dm-devel] [PATCH 4/9] md: don't detour through bd_contains for
	the gendisk
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 2, 2020 at 10:43 PM Christoph Hellwig <hch@lst.de> wrote:
>
> bd_disk is set on all block devices, including those for partitions.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Song Liu <song@kernel.org>

> ---
>  drivers/md/md.c | 2 +-
>  drivers/md/md.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 3f33562d10d6f5..5a0fd93769a70e 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -8444,7 +8444,7 @@ static int is_mddev_idle(struct mddev *mddev, int init)
>         idle = 1;
>         rcu_read_lock();
>         rdev_for_each_rcu(rdev, mddev) {
> -               struct gendisk *disk = rdev->bdev->bd_contains->bd_disk;
> +               struct gendisk *disk = rdev->bdev->bd_disk;
>                 curr_events = (int)part_stat_read_accum(&disk->part0, sectors) -
>                               atomic_read(&disk->sync_io);
>                 /* sync IO will cause sync_io to increase before the disk_stats
> diff --git a/drivers/md/md.h b/drivers/md/md.h
> index f9e2ccdd22c478..2175a5ac4f7c68 100644
> --- a/drivers/md/md.h
> +++ b/drivers/md/md.h
> @@ -551,7 +551,7 @@ extern void mddev_unlock(struct mddev *mddev);
>
>  static inline void md_sync_acct(struct block_device *bdev, unsigned long nr_sectors)
>  {
> -       atomic_add(nr_sectors, &bdev->bd_contains->bd_disk->sync_io);
> +       atomic_add(nr_sectors, &bdev->bd_disk->sync_io);
>  }
>
>  static inline void md_sync_acct_bio(struct bio *bio, unsigned long nr_sectors)
> --
> 2.28.0
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

