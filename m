Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E8BA43FBDD4
	for <lists+dm-devel@lfdr.de>; Mon, 30 Aug 2021 23:01:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-PEpaYKAIP9a3XwPX5mj_2Q-1; Mon, 30 Aug 2021 17:01:48 -0400
X-MC-Unique: PEpaYKAIP9a3XwPX5mj_2Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6059B1008064;
	Mon, 30 Aug 2021 21:01:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D07016A8EE;
	Mon, 30 Aug 2021 21:01:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 12FA3181A1CE;
	Mon, 30 Aug 2021 21:01:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17UL1SvB006075 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Aug 2021 17:01:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 42B86217B436; Mon, 30 Aug 2021 21:01:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D73D2168683
	for <dm-devel@redhat.com>; Mon, 30 Aug 2021 21:01:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C9EB101A52C
	for <dm-devel@redhat.com>; Mon, 30 Aug 2021 21:01:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-213--0AzDhyUPMKtZYc8rhAxFw-1; Mon, 30 Aug 2021 17:01:23 -0400
X-MC-Unique: -0AzDhyUPMKtZYc8rhAxFw-1
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mKoOo-000ZII-6j; Mon, 30 Aug 2021 21:00:58 +0000
Date: Mon, 30 Aug 2021 14:00:58 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YS1HCgP/XdWmMtFN@bombadil.infradead.org>
References: <20210823202930.137278-1-mcgrof@kernel.org>
	<20210823202930.137278-9-mcgrof@kernel.org>
	<YSSP6ujNQttGN2sZ@infradead.org>
	<YSk1EhUIr9OjIoVv@bombadil.infradead.org>
	<YSnnXdKLvxEY8yay@infradead.org>
MIME-Version: 1.0
In-Reply-To: <YSnnXdKLvxEY8yay@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: ulf.hansson@linaro.org, snitzer@redhat.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	agk@redhat.com, beanhuo@micron.com, ming.lei@redhat.com,
	sagi@grimberg.me, linux-scsi@vger.kernel.org, jejb@linux.ibm.com,
	josef@toxicpanda.com, nbd@other.debian.org,
	linux-block@vger.kernel.org, avri.altman@wdc.com,
	kbusch@kernel.org, swboyd@chromium.org, bvanassche@acm.org,
	axboe@kernel.dk, martin.petersen@oracle.com,
	linux-mmc@vger.kernel.org, adrian.hunter@intel.com
Subject: Re: [dm-devel] [PATCH 08/10] dm: add add_disk() error handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Aug 28, 2021 at 08:35:57AM +0100, Christoph Hellwig wrote:
> On Fri, Aug 27, 2021 at 11:55:14AM -0700, Luis Chamberlain wrote:
> > > I think the add_disk should just return r.  If you look at the
> > > callers they eventualy end up in dm_table_destroy, which does
> > > this cleanup.
> > 
> > I don't see it. What part of dm_table_destroy() does this?
> 
> Sorry, dm_destroy, not dm_table_destroy.  For dm_early_create it's
> trivial as that calls both dm_table_destroy and dm_destroy in the error
> path.  The normal table_load case is a separate ioctl, but if that
> fails userspace needs to call the DM_DEV_REMOVE_CMD to cleanup
> the state - similar to any other failure.

I see, ok sure I'll document this on the commit log as its not so
obvious.

  Luis

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

