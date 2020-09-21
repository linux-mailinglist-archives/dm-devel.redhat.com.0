Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0893227267F
	for <lists+dm-devel@lfdr.de>; Mon, 21 Sep 2020 16:00:55 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-7dHGVNNbPB27r6Ec6hw1rw-1; Mon, 21 Sep 2020 10:00:51 -0400
X-MC-Unique: 7dHGVNNbPB27r6Ec6hw1rw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 359C510082E5;
	Mon, 21 Sep 2020 14:00:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9297455765;
	Mon, 21 Sep 2020 14:00:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD20B183D041;
	Mon, 21 Sep 2020 14:00:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08LE0OPr027539 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 10:00:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 80A6B20244F7; Mon, 21 Sep 2020 14:00:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B1272028E91
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 14:00:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF6C880351B
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 14:00:21 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-207-u-A7xCwLPjGPfTbgVDnMFQ-1;
	Mon, 21 Sep 2020 10:00:15 -0400
X-MC-Unique: u-A7xCwLPjGPfTbgVDnMFQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id A75DA68AFE; Mon, 21 Sep 2020 16:00:11 +0200 (CEST)
Date: Mon, 21 Sep 2020 16:00:10 +0200
From: Christoph Hellwig <hch@lst.de>
To: Coly Li <colyli@suse.de>
Message-ID: <20200921140010.GA14672@lst.de>
References: <20200921080734.452759-1-hch@lst.de>
	<20200921080734.452759-4-hch@lst.de>
	<b547a1b6-ab03-0520-012d-86d112c83d92@suse.de>
MIME-Version: 1.0
In-Reply-To: <b547a1b6-ab03-0520-012d-86d112c83d92@suse.de>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Sep 21, 2020 at 05:54:59PM +0800, Coly Li wrote:
> I am not sure whether virtual bcache device's optimal request size can
> be simply set like this.
> 
> Most of time inherit backing device's optimal request size is fine, but
> there are two exceptions,
> - Read request hits on cache device
> - User sets sequential_cuttoff as 0, all writing may go into cache
> device firstly.
> For the above two conditions, all I/Os goes into cache device, using
> optimal request size of backing device might be improper.
> 
> Just a guess, is it OK to set the optimal request size of the virtual
> bcache device as the least common multiple of cache device's and backing
> device's optimal request sizes ?

Well, if the optimal I/O size is wrong, the read ahead size also is
wrong.  Can we just drop the setting?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

