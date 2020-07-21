Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 040022277DE
	for <lists+dm-devel@lfdr.de>; Tue, 21 Jul 2020 07:01:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225--LoILUTVORKNYyPcuh4JAQ-1; Tue, 21 Jul 2020 01:01:42 -0400
X-MC-Unique: -LoILUTVORKNYyPcuh4JAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B307100CCC0;
	Tue, 21 Jul 2020 05:01:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 820715C22A;
	Tue, 21 Jul 2020 05:01:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7CAB094EFC;
	Tue, 21 Jul 2020 05:01:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06L50xic010086 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 01:00:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 45398218ADCB; Tue, 21 Jul 2020 05:00:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4098B218ADCE
	for <dm-devel@redhat.com>; Tue, 21 Jul 2020 05:00:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CD9B1012443
	for <dm-devel@redhat.com>; Tue, 21 Jul 2020 05:00:56 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-241-bw2PU4LVPQWH3fomXmov0g-1;
	Tue, 21 Jul 2020 01:00:51 -0400
X-MC-Unique: bw2PU4LVPQWH3fomXmov0g-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 42A716736F; Tue, 21 Jul 2020 07:00:48 +0200 (CEST)
Date: Tue, 21 Jul 2020 07:00:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: Richard Weinberger <richard.weinberger@gmail.com>
Message-ID: <20200721050047.GA9707@lst.de>
References: <20200720075148.172156-1-hch@lst.de>
	<20200720075148.172156-5-hch@lst.de>
	<CAFLxGvxNHGEOrj6nKTtDeiU+Rx4xv_6asjSQYcFWXhk5m=1cBA@mail.gmail.com>
	<20200720120734.GA29061@lst.de>
	<2827a5dbd94bc5c2c1706a6074d9a9a32a590feb.camel@gmail.com>
	<CAFLxGvyxtYnJ5UdD18uNA97zQaDB8-Wv8MHQn2g9GYD74v7cTg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFLxGvyxtYnJ5UdD18uNA97zQaDB8-Wv8MHQn2g9GYD74v7cTg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Artem Bityutskiy <dedekind1@gmail.com>,
	Song Liu <song@kernel.org>, Richard Weinberger <richard@nod.at>,
	drbd-dev@tron.linbit.com, LKML <linux-kernel@vger.kernel.org>,
	linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	device-mapper development <dm-devel@redhat.com>,
	linux-mtd@lists.infradead.org, linux-mm@kvack.org,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	cgroups mailinglist <cgroups@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 04/14] bdi: initialize ->ra_pages in bdi_init
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jul 20, 2020 at 11:27:57PM +0200, Richard Weinberger wrote:
> On Mon, Jul 20, 2020 at 2:37 PM Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >
> > On Mon, 2020-07-20 at 14:07 +0200, Christoph Hellwig wrote:
> > > What about jffs2 and blk2mtd raw block devices?
> 
> I don't worry much about blk2mtd.
> 
> > If my memory serves me correctly JFFS2 did not mind readahead.
> 
> This covers my knowledge too.
> I fear enabling readahead on JFFS2 will cause performance issues, this
> filesystem
> is mostly used on small and slow NOR devices.

I'm going to wait for Hans for feedback on vboxsf, but in doubt I'll
ust add a prep patch or fold for this one to explicit set ra_pages to 0
with a comment then.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

