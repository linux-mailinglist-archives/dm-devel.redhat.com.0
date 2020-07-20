Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E159B225EBA
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 14:42:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-W_3C2_QPPEW1buQvJfUxdg-1; Mon, 20 Jul 2020 08:42:03 -0400
X-MC-Unique: W_3C2_QPPEW1buQvJfUxdg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 549FE1005271;
	Mon, 20 Jul 2020 12:41:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D1AE10002B5;
	Mon, 20 Jul 2020 12:41:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AFA241809554;
	Mon, 20 Jul 2020 12:41:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06KCcN1A012103 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 08:38:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A33C6208DD81; Mon, 20 Jul 2020 12:38:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CE9A208DD86
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 12:38:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96B9B8007C8
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 12:38:21 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-262-WNM9aTVuOdy7odc0iTs8vQ-1; Mon, 20 Jul 2020 08:38:19 -0400
X-MC-Unique: WNM9aTVuOdy7odc0iTs8vQ-1
IronPort-SDR: yc3fdEAPzFgCogH+FUizOZhlzs/Lv38+dgR6IjJaqNPK4byTRrtnkHDk7unp+yjnuS1jT8weUG
	Etv8iruDgIFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="211443038"
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="211443038"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	20 Jul 2020 05:37:15 -0700
IronPort-SDR: 7deXD1XW+A1Hva+QiCJdaK4EIpnjzCtylsXLbkZMEWcV3EA4SSFqyWHsLulKcoOBu1VF1DCfC/
	jsIW9xbLx4ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="487228228"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 20 Jul 2020 05:37:15 -0700
Received: from abityuts-desk1.fi.intel.com (abityuts-desk1.fi.intel.com
	[10.237.72.186])
	by linux.intel.com (Postfix) with ESMTP id A1092580299;
	Mon, 20 Jul 2020 05:37:11 -0700 (PDT)
Message-ID: <2827a5dbd94bc5c2c1706a6074d9a9a32a590feb.camel@gmail.com>
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Christoph Hellwig <hch@lst.de>, Richard Weinberger
	<richard.weinberger@gmail.com>
Date: Mon, 20 Jul 2020 15:37:10 +0300
In-Reply-To: <20200720120734.GA29061@lst.de>
References: <20200720075148.172156-1-hch@lst.de>
	<20200720075148.172156-5-hch@lst.de>
	<CAFLxGvxNHGEOrj6nKTtDeiU+Rx4xv_6asjSQYcFWXhk5m=1cBA@mail.gmail.com>
	<20200720120734.GA29061@lst.de>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, Richard Weinberger <richard@nod.at>,
	drbd-dev@tron.linbit.com, LKML <linux-kernel@vger.kernel.org>,
	linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	device-mapper development <dm-devel@redhat.com>,
	linux-mtd@lists.infradead.org,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	cgroups mailinglist <cgroups@vger.kernel.org>, linux-mm@kvack.org
Subject: Re: [dm-devel] [PATCH 04/14] bdi: initialize ->ra_pages in bdi_init
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: dedekind1@gmail.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-07-20 at 14:07 +0200, Christoph Hellwig wrote:
> What about jffs2 and blk2mtd raw block devices?

If my memory serves me correctly JFFS2 did not mind readahead.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

