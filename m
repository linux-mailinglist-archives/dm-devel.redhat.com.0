Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E813D225E2F
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 14:08:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-jr_qdfnYP_ui6bwMIOF-6Q-1; Mon, 20 Jul 2020 08:08:25 -0400
X-MC-Unique: jr_qdfnYP_ui6bwMIOF-6Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D2791DE4;
	Mon, 20 Jul 2020 12:08:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 926A178524;
	Mon, 20 Jul 2020 12:08:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A695D1809554;
	Mon, 20 Jul 2020 12:08:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06KC7k94008402 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 08:07:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0961A2156708; Mon, 20 Jul 2020 12:07:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 058FE2156880
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 12:07:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC8AA80CC2A
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 12:07:43 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-304-V3bgnzcsMcOSLb8gFFKhzA-1;
	Mon, 20 Jul 2020 08:07:38 -0400
X-MC-Unique: V3bgnzcsMcOSLb8gFFKhzA-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 18CA168BFE; Mon, 20 Jul 2020 14:07:35 +0200 (CEST)
Date: Mon, 20 Jul 2020 14:07:34 +0200
From: Christoph Hellwig <hch@lst.de>
To: Richard Weinberger <richard.weinberger@gmail.com>
Message-ID: <20200720120734.GA29061@lst.de>
References: <20200720075148.172156-1-hch@lst.de>
	<20200720075148.172156-5-hch@lst.de>
	<CAFLxGvxNHGEOrj6nKTtDeiU+Rx4xv_6asjSQYcFWXhk5m=1cBA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxNHGEOrj6nKTtDeiU+Rx4xv_6asjSQYcFWXhk5m=1cBA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Richard Weinberger <richard@nod.at>,
	LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	linux-mtd@lists.infradead.org, linux-mm@kvack.org,
	cgroups mailinglist <cgroups@vger.kernel.org>, drbd-dev@tron.linbit.com,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jul 20, 2020 at 01:58:22PM +0200, Richard Weinberger wrote:
> Hello Chrstoph,
> 
> On Mon, Jul 20, 2020 at 9:53 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > Set up a readahead size by default.  This changes behavior for mtd,
> > ubifs, and vboxsf to actually enabled readahead, the lack of which
> > very much looks like an oversight.
> 
> UBIFS doesn't enable readahead on purpose, please see:
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_readahead

What about jffs2 and blk2mtd raw block devices?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

