Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2560F270B4E
	for <lists+dm-devel@lfdr.de>; Sat, 19 Sep 2020 08:58:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-4knRz90wP-6E9C3ZeypJ2A-1; Sat, 19 Sep 2020 02:58:44 -0400
X-MC-Unique: 4knRz90wP-6E9C3ZeypJ2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B293186DD46;
	Sat, 19 Sep 2020 06:58:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C1D019D6C;
	Sat, 19 Sep 2020 06:58:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98A59183D041;
	Sat, 19 Sep 2020 06:58:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08J6wR5i007645 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 19 Sep 2020 02:58:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C1EF41009BB5; Sat, 19 Sep 2020 06:58:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD4951010AF7
	for <dm-devel@redhat.com>; Sat, 19 Sep 2020 06:58:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D50586CFED
	for <dm-devel@redhat.com>; Sat, 19 Sep 2020 06:58:25 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-30-qoTJsPjnMGygdiRX1C_3JQ-1;
	Sat, 19 Sep 2020 02:58:20 -0400
X-MC-Unique: qoTJsPjnMGygdiRX1C_3JQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9D9B768BEB; Sat, 19 Sep 2020 08:58:16 +0200 (CEST)
Date: Sat, 19 Sep 2020 08:58:16 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Message-ID: <20200919065816.GA8237@lst.de>
References: <20200910144833.742260-1-hch@lst.de>
	<20200910144833.742260-4-hch@lst.de>
	<20200917095507.GJ7347@quack2.suse.cz>
MIME-Version: 1.0
In-Reply-To: <20200917095507.GJ7347@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-mm@kvack.org,
	cgroups@vger.kernel.org, drbd-dev@tron.linbit.com,
	linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 03/12] drbd: remove RB_CONGESTED_REMOTE
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Sep 17, 2020 at 11:55:07AM +0200, Jan Kara wrote:
> On Thu 10-09-20 16:48:23, Christoph Hellwig wrote:
> > This case isn't ever used.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> 
> Are you sure it's never used? As far as I'm reading drdb code the contents
> of the disk_conf structure seems to be received through netlink (that code
> is really a macro hell) and so read_balancing attribute passed to
> remote_due_to_read_balancing() can have any value userspace passed to it.

You are right, looking at how disk_conf is used I can't convince myself
that it is indeed not set through netlink and I've thus dropped the
patch.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

