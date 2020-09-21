Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 820D32731C8
	for <lists+dm-devel@lfdr.de>; Mon, 21 Sep 2020 20:19:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-5MjmWocWONOX1JVN6-hquA-1; Mon, 21 Sep 2020 14:19:40 -0400
X-MC-Unique: 5MjmWocWONOX1JVN6-hquA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DBE68014D9;
	Mon, 21 Sep 2020 18:19:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1745C9CBA;
	Mon, 21 Sep 2020 18:19:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 16EC618561B2;
	Mon, 21 Sep 2020 18:19:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08LIIqjE026028 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 14:18:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3A8AD2157F23; Mon, 21 Sep 2020 18:18:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 366862166B28
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 18:18:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC152180A599
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 18:18:48 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-513-bIN0MEOhPUyEJal7MGymEQ-1;
	Mon, 21 Sep 2020 14:18:44 -0400
X-MC-Unique: bIN0MEOhPUyEJal7MGymEQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 259D968B02; Mon, 21 Sep 2020 20:18:42 +0200 (CEST)
Date: Mon, 21 Sep 2020 20:18:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: Coly Li <colyli@suse.de>
Message-ID: <20200921181841.GB2067@lst.de>
References: <20200921080734.452759-1-hch@lst.de>
	<20200921080734.452759-4-hch@lst.de>
	<b547a1b6-ab03-0520-012d-86d112c83d92@suse.de>
	<20200921140010.GA14672@lst.de>
	<5bcc52dc-ca8f-bbdd-69ef-4b6312e7994a@suse.de>
MIME-Version: 1.0
In-Reply-To: <5bcc52dc-ca8f-bbdd-69ef-4b6312e7994a@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Justin Sanders <justin@coraid.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>, cgroups@vger.kernel.org,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, linux-mtd@lists.infradead.org, linux-mm@kvack.org,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	drbd-dev@tron.linbit.com, linux-fsdevel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 03/13] bcache: inherit the optimal I/O size
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Sep 21, 2020 at 11:09:48PM +0800, Coly Li wrote:
> I feel this is something should be fixed. Indeed I overlooked it until
> you point out the issue now.
> 
> The optimal request size and read ahead pages hint are necessary, but
> current initialization is simple. A better way might be dynamically
> setting them depends on the cache mode and some special configuration.
> 
> By your inspiration, I want to ACK your original patch although it
> doesn't work fine for all condition. Then we may know these two settings
> (ra_pages and queue_io_opt) should be improved for more situations. At
> lease for most part of the situations they provide proper hints.
> 
> How do you think of the above idea ?

Sounds like a plan.  I'd reall like to get this series in to get
some soaking before the end of the merge window, but we should still
have plenty of time for localized bcache updates.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

