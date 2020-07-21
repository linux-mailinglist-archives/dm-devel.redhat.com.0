Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 654BE227C0B
	for <lists+dm-devel@lfdr.de>; Tue, 21 Jul 2020 11:47:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-ynASNvvfN8Oa6XokKaJ6Xg-1; Tue, 21 Jul 2020 05:47:03 -0400
X-MC-Unique: ynASNvvfN8Oa6XokKaJ6Xg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42A401DE1;
	Tue, 21 Jul 2020 09:46:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9140A7F8CC;
	Tue, 21 Jul 2020 09:46:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C1261809557;
	Tue, 21 Jul 2020 09:46:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06L5kREV015416 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 01:46:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 547CC202683E; Tue, 21 Jul 2020 05:46:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5065C2026D67
	for <dm-devel@redhat.com>; Tue, 21 Jul 2020 05:46:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32CA21012443
	for <dm-devel@redhat.com>; Tue, 21 Jul 2020 05:46:25 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-217-ulhh5Pe-ORylhnkDNpMicQ-1; Tue, 21 Jul 2020 01:46:22 -0400
X-MC-Unique: ulhh5Pe-ORylhnkDNpMicQ-1
Received: by mail-pj1-f68.google.com with SMTP id k5so1098871pjg.3;
	Mon, 20 Jul 2020 22:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=3veC3pi53wl7dFDGpjkOo+uS1itnPbzCOm4x4ko6JVY=;
	b=kuSdWwYFNb3WJ7SbbvPEmGGgIRyCf5BUftPMptIgHBRQwEBOudc4BoS0U+QERqRms8
	ZafVrOA0NlzaF4rsnp0+dC9h6oXB2xAglx3SXRUfP2pgBKf2EgqUev2CEDREYOkU/tCp
	zkVjzgKkk0YVMqAXHcJshiG/c2S2CzRWdWV5Evv+E3qwTlcVC0JtW23wD9xC+P2HERF5
	WYFW7ylSR8mSTlBmEiyP+f8q2Qh3QvJRYNjKbN4/xauRdNUlt2lkqi7L7TNDypmxX+vp
	UORvAPcQDMf0I4dnL+g2CBu9jKLzdODuIR50aT6nkxkOWTpNKPNBqQgxXE8axLwk84Bk
	JHvg==
X-Gm-Message-State: AOAM532rwVb14FUfsMT4/YwmTrmgRjmY9O/RuQ5TBwRiBhvo5Z97sD/X
	OXbdqn2j02168W/k5RbfNeQ=
X-Google-Smtp-Source: ABdhPJylrFyWY9zOcJ3tuosterYe/etVkRG4BboKrT7kWFS6Sy9YPaV4NbuHkPEn95UZ4BSYHonUbw==
X-Received: by 2002:a17:90a:dd44:: with SMTP id
	u4mr2794038pjv.203.1595310380927; 
	Mon, 20 Jul 2020 22:46:20 -0700 (PDT)
Received: from google.com ([2620:15c:211:1:7220:84ff:fe09:5e58])
	by smtp.gmail.com with ESMTPSA id
	nh14sm1541134pjb.4.2020.07.20.22.46.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jul 2020 22:46:19 -0700 (PDT)
Date: Mon, 20 Jul 2020 22:46:17 -0700
From: Minchan Kim <minchan@kernel.org>
To: Shakeel Butt <shakeelb@google.com>
Message-ID: <20200721054617.GA1879427@google.com>
References: <20200720075148.172156-1-hch@lst.de>
	<20200720075148.172156-12-hch@lst.de>
	<CALvZod7ACBnNX5W-gtTzheh8R-rxv1nB-5q7UcDUZ7BvtpakpA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALvZod7ACBnNX5W-gtTzheh8R-rxv1nB-5q7UcDUZ7BvtpakpA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 21 Jul 2020 05:46:39 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Richard Weinberger <richard@nod.at>,
	LKML <linux-kernel@vger.kernel.org>,
	"open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, Linux MM <linux-mm@kvack.org>,
	Cgroups <cgroups@vger.kernel.org>, drbd-dev@tron.linbit.com,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>
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
Content-Disposition: inline

Thanks for Ccing me, Shakeel.

On Mon, Jul 20, 2020 at 10:52:55AM -0700, Shakeel Butt wrote:
> +Minchan Kim
> 
> On Mon, Jul 20, 2020 at 12:52 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > There is no point in trying to call bdev_read_page if SWP_SYNCHRONOUS_IO
> > is not set, as the device won't support it.  Also there is no point in
> > trying a bio submission if bdev_read_page failed.
> 
> This will at least break the failure path of zram_rw_page().

Yes, it needs post processing for error propagaion like *page* handling
part in end_swap_bio_read(mostly, PG_error and PG_uptodate with pr_alert).
bdev_read_page's sematic doesn't need to be synchronous so it could just
submit the IO request and complete the IO afterward. In that case, we
need right error handling, too if the IO encoutered error. BIO fallback
makes it simple.

 * bdev_read_page() - Start reading a page from a block device
 * @bdev: The device to read the page from
 * @sector: The offset on the device to read the page to (need not be aligned)
 * @page: The page to read
 *
 * On entry, the page should be locked.  It will be unlocked when the page
 * has been read.  If the block driver implements rw_page synchronously,
 * that will be true on exit from this function, but it need not be.
 *
 * Errors returned by this function are usually "soft", eg out of memory, or
 * queue full; callers should try a different route to read this page rather
 * than propagate an error back up the stack.

The other concern about this patch is zram have used rw_page for a long
time even though sometime it doesn't declare BDI_CAP_SYNCHRONOUS_IO by itself
because rw_page shows 4~5% bandwidth improvement compared to bio-based.
The performance gain becomes more important these day because compressor
becomes more fast day by day.

> 
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  mm/page_io.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/page_io.c b/mm/page_io.c
> > index ccda7679008851..63b44b8221af0f 100644
> > --- a/mm/page_io.c
> > +++ b/mm/page_io.c
> > @@ -403,8 +403,11 @@ int swap_readpage(struct page *page, bool synchronous)
> >                 goto out;
> >         }
> >
> > -       ret = bdev_read_page(sis->bdev, swap_page_sector(page), page);
> > -       if (!ret) {
> > +       if (sis->flags & SWP_SYNCHRONOUS_IO) {
> > +               ret = bdev_read_page(sis->bdev, swap_page_sector(page), page);
> > +               if (ret)
> > +                       goto out;
> > +
> >                 if (trylock_page(page)) {
> >                         swap_slot_free_notify(page);
> >                         unlock_page(page);
> > --
> > 2.27.0
> >

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

