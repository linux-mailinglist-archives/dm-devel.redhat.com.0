Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA9D263F4B
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 10:07:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-tTsp_E0CMZa4OmTuRyo_Qg-1; Thu, 10 Sep 2020 04:07:17 -0400
X-MC-Unique: tTsp_E0CMZa4OmTuRyo_Qg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB00D10060D5;
	Thu, 10 Sep 2020 08:07:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE57760BF1;
	Thu, 10 Sep 2020 08:07:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CCA2B922E1;
	Thu, 10 Sep 2020 08:07:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0890tmiS008893 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Sep 2020 20:55:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CD8B31102E11; Wed,  9 Sep 2020 00:55:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7EE41102E02
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 00:55:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8517A811E78
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 00:55:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-377-922qXp2tNFiwZvDu4aosMA-1;
	Tue, 08 Sep 2020 20:55:43 -0400
X-MC-Unique: 922qXp2tNFiwZvDu4aosMA-1
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D3FC7218AC
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 00:55:41 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id s205so1268240lja.7
	for <dm-devel@redhat.com>; Tue, 08 Sep 2020 17:55:41 -0700 (PDT)
X-Gm-Message-State: AOAM5306Rn2fklKo1/VwxCx8Ysw61qRnjj/F/xnWC0Vywn07HJw3Yxl9
	9awU/W7fnhxYYossDdfMuogI+eEmCibK1JRLBXM=
X-Google-Smtp-Source: ABdhPJxQq74vo5JbuRHxUTS8m9tdD+iAtivYUG50MMcb53T1num8JutKqyxkzEWd0qSatAXELIL2sCltGdwuDe8hang=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr561854lji.41.1599612940170;
	Tue, 08 Sep 2020 17:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200903054104.228829-1-hch@lst.de>
	<20200903054104.228829-4-hch@lst.de>
In-Reply-To: <20200903054104.228829-4-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Tue, 8 Sep 2020 17:55:29 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7ZtGruPhBWZpjCDoyq1DwoA3t_p3UXbSPrHGMnHh7enw@mail.gmail.com>
Message-ID: <CAPhsuW7ZtGruPhBWZpjCDoyq1DwoA3t_p3UXbSPrHGMnHh7enw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 10 Sep 2020 04:06:55 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid <linux-raid@vger.kernel.org>,
	linux-scsi@vger.kernel.org,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	linux-s390@vger.kernel.org, linux-mmc@vger.kernel.org,
	open list <linux-kernel@vger.kernel.org>,
	linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org, drbd-dev@tron.linbit.com
Subject: Re: [dm-devel] [PATCH 3/9] md: compare bd_disk instead of
	bd_contains
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 2, 2020 at 10:43 PM Christoph Hellwig <hch@lst.de> wrote:
>
> To check for partitions of the same disk bd_contains works as well, but
> bd_disk is way more obvious.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Song Liu <song@kernel.org>

> ---
>  drivers/md/md.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 9562ef598ae1f4..3f33562d10d6f5 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -2322,8 +2322,7 @@ static int match_mddev_units(struct mddev *mddev1, struct mddev *mddev2)
>                             test_bit(Journal, &rdev2->flags) ||
>                             rdev2->raid_disk == -1)
>                                 continue;
> -                       if (rdev->bdev->bd_contains ==
> -                           rdev2->bdev->bd_contains) {
> +                       if (rdev->bdev->bd_disk == rdev2->bdev->bd_disk) {
>                                 rcu_read_unlock();
>                                 return 1;
>                         }
> @@ -5944,8 +5943,8 @@ int md_run(struct mddev *mddev)
>                 rdev_for_each(rdev, mddev)
>                         rdev_for_each(rdev2, mddev) {
>                                 if (rdev < rdev2 &&
> -                                   rdev->bdev->bd_contains ==
> -                                   rdev2->bdev->bd_contains) {
> +                                   rdev->bdev->bd_disk ==
> +                                   rdev2->bdev->bd_disk) {
>                                         pr_warn("%s: WARNING: %s appears to be on the same physical disk as %s.\n",
>                                                 mdname(mddev),
>                                                 bdevname(rdev->bdev,b),
> --
> 2.28.0
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

