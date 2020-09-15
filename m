Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 933E5269F14
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 09:06:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497---VydAaMMcKAZs2YyZfP9A-1; Tue, 15 Sep 2020 03:06:10 -0400
X-MC-Unique: --VydAaMMcKAZs2YyZfP9A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A73B6801A9D;
	Tue, 15 Sep 2020 07:06:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A2817512B;
	Tue, 15 Sep 2020 07:05:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9067744A4B;
	Tue, 15 Sep 2020 07:05:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08F75XsH016060 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 03:05:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DC3D320235B7; Tue, 15 Sep 2020 07:05:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6EA0202450E
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 07:05:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AA8518AE949
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 07:05:30 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-15-1r7FoUhrMEiLaH17VzuEgQ-1;
	Tue, 15 Sep 2020 03:05:28 -0400
X-MC-Unique: 1r7FoUhrMEiLaH17VzuEgQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9B14E68AFE; Tue, 15 Sep 2020 09:05:22 +0200 (CEST)
Date: Tue, 15 Sep 2020 09:05:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200915070522.GA19974@lst.de>
References: <20200726150333.305527-1-hch@lst.de>
	<20200726150333.305527-7-hch@lst.de>
	<20200826220737.GA25613@redhat.com> <20200902151144.GA1738@lst.de>
	<20200902162007.GB5513@redhat.com> <20200910092813.GA27229@lst.de>
	<20200910171541.GB21919@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200910171541.GB21919@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	martin.petersen@oracle.com, Hans de Goede <hdegoede@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	Minchan Kim <minchan@kernel.org>, drbd-dev@tron.linbit.com,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 06/14] block: lift setting the readahead size
 into the block layer
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
Content-Disposition: inline

On Thu, Sep 10, 2020 at 01:15:41PM -0400, Mike Snitzer wrote:
> > I'll move it to blk_register_queue, which should work just fine.
> 
> That'll work for initial DM table load as part of DM device creation
> (dm_setup_md_queue).  But it won't account for DM table reloads that
> might change underlying devices on a live DM device (done using
> __bind).
> 
> Both dm_setup_md_queue() and __bind() call dm_table_set_restrictions()
> to set/update queue_limits.  It feels like __bind() will need to call a
> new block helper to set/update parts of queue_limits (e.g. ra_pages and
> io_pages).
> 
> Any chance you're open to factoring out that block function as an
> exported symbol for use by blk_register_queue() and code like DM's
> __bind()?

I agree with the problem statement.  OTOH adding an exported helper
for two trivial assignments seems a little silly..

For now I'll just keep the open coded ->io_pages assignment in
dm.  Note that dm doesn't currently update the ->ra_pages value
based on the underlying devices, so an incremental patch to do that
might be useful as well.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

