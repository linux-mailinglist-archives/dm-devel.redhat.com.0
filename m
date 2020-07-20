Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0B561226F82
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 22:13:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-7Wc3012xPOC_Lxft2jpiZw-1; Mon, 20 Jul 2020 16:13:54 -0400
X-MC-Unique: 7Wc3012xPOC_Lxft2jpiZw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 047E71DE4;
	Mon, 20 Jul 2020 20:13:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AE7E5BAD5;
	Mon, 20 Jul 2020 20:13:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C7621809554;
	Mon, 20 Jul 2020 20:13:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06KHrEsK023916 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 13:53:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 820E72157F26; Mon, 20 Jul 2020 17:53:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DFC42166B28
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 17:53:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4270280CC2C
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 17:53:12 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-192-kaqB3JJePOiConrhr4aEbQ-1; Mon, 20 Jul 2020 13:53:09 -0400
X-MC-Unique: kaqB3JJePOiConrhr4aEbQ-1
Received: by mail-lj1-f196.google.com with SMTP id s9so21181556ljm.11
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 10:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Kya9ou2H4xCIeg2jTugLQPDLPsUiSPAXkhjVJRHMDG8=;
	b=E7icvdBB5p0K7BsWnDQ3x6SE1lkcD+z8d8eruFXQmWKYMHB4LgrbnUdikHGXjnBDmG
	zjL0EM+DGqZSTywM9DpJIHpK4jGF7b5U4x762u0CTzx51rQMFa8pV6eHe/8K/In0V9Kk
	ks8OlnxEXkkBg9R/3hk5YLcxwy3U4w3RUVZSp6SihmE/fJcF+BVLt5EWTOAXz99yzCyv
	lwcRaoGN2FrLYLsPPVBMl2eDS2r2dBM6pOwGaEuQ6Vt1ZQZPGj+yn4TVDCBrHgQjQ/0M
	vPAVBxA6NMEXyXGZ406AFqESjopwBjgNdGVEP9ZDoCueq60BMPRvececvPkbJwtJTs2d
	cxzg==
X-Gm-Message-State: AOAM531hkkBiTZfFYxqrkIttcg6FyMpCfLywKv1VaHZFm7VV3Yxi8lvs
	SYrH6Yg1CZ2405qsdXT/syUmBF5/lyVrXB3m+vp66A==
X-Google-Smtp-Source: ABdhPJxVEb/gDZEkvQ7LMo203fIZqznHvbPDVwx5Y0R9jHwZ6CsaSCd83ZH/mrB+5f45z4TkFHBNvGDSXrXZqTZC034=
X-Received: by 2002:a2e:8e36:: with SMTP id r22mr10983662ljk.77.1595267587620; 
	Mon, 20 Jul 2020 10:53:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200720075148.172156-1-hch@lst.de>
	<20200720075148.172156-12-hch@lst.de>
In-Reply-To: <20200720075148.172156-12-hch@lst.de>
From: Shakeel Butt <shakeelb@google.com>
Date: Mon, 20 Jul 2020 10:52:55 -0700
Message-ID: <CALvZod7ACBnNX5W-gtTzheh8R-rxv1nB-5q7UcDUZ7BvtpakpA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>, Minchan Kim <minchan@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 20 Jul 2020 16:13:03 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Richard Weinberger <richard@nod.at>,
	LKML <linux-kernel@vger.kernel.org>,
	"open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, Cgroups <cgroups@vger.kernel.org>,
	drbd-dev@tron.linbit.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linux MM <linux-mm@kvack.org>
Subject: Re: [dm-devel] [PATCH 11/14] mm: use SWP_SYNCHRONOUS_IO more
	intelligently
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

+Minchan Kim

On Mon, Jul 20, 2020 at 12:52 AM Christoph Hellwig <hch@lst.de> wrote:
>
> There is no point in trying to call bdev_read_page if SWP_SYNCHRONOUS_IO
> is not set, as the device won't support it.  Also there is no point in
> trying a bio submission if bdev_read_page failed.

This will at least break the failure path of zram_rw_page().

>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  mm/page_io.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/mm/page_io.c b/mm/page_io.c
> index ccda7679008851..63b44b8221af0f 100644
> --- a/mm/page_io.c
> +++ b/mm/page_io.c
> @@ -403,8 +403,11 @@ int swap_readpage(struct page *page, bool synchronous)
>                 goto out;
>         }
>
> -       ret = bdev_read_page(sis->bdev, swap_page_sector(page), page);
> -       if (!ret) {
> +       if (sis->flags & SWP_SYNCHRONOUS_IO) {
> +               ret = bdev_read_page(sis->bdev, swap_page_sector(page), page);
> +               if (ret)
> +                       goto out;
> +
>                 if (trylock_page(page)) {
>                         swap_slot_free_notify(page);
>                         unlock_page(page);
> --
> 2.27.0
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

