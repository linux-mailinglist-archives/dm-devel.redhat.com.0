Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B21102B6AD2
	for <lists+dm-devel@lfdr.de>; Tue, 17 Nov 2020 17:58:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-gWG_nc5bMJiSeWh-wP30Sw-1; Tue, 17 Nov 2020 11:58:52 -0500
X-MC-Unique: gWG_nc5bMJiSeWh-wP30Sw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A536610866B5;
	Tue, 17 Nov 2020 16:58:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 146985C1CF;
	Tue, 17 Nov 2020 16:58:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8EAD8181A07B;
	Tue, 17 Nov 2020 16:58:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AHFpABs024348 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 17 Nov 2020 10:51:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F18942166BA3; Tue, 17 Nov 2020 15:51:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC2D42166BA0
	for <dm-devel@redhat.com>; Tue, 17 Nov 2020 15:51:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83DE1811E95
	for <dm-devel@redhat.com>; Tue, 17 Nov 2020 15:51:06 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-256-KDKFfjs0NhaO9R9o8AnXOg-1;
	Tue, 17 Nov 2020 10:51:03 -0500
X-MC-Unique: KDKFfjs0NhaO9R9o8AnXOg-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id DE1F36736F; Tue, 17 Nov 2020 16:51:00 +0100 (CET)
Date: Tue, 17 Nov 2020 16:51:00 +0100
From: Christoph Hellwig <hch@lst.de>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20201117155100.GA20977@lst.de>
References: <20201116212020.1099154-1-hch@lst.de>
	<20201117154629.GA27085@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201117154629.GA27085@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Jens Axboe <axboe@kernel.dk>, Minchan Kim <minchan@kernel.org>,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] misc struct block_device related driver cleanups
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 17, 2020 at 10:46:29AM -0500, Mike Snitzer wrote:
> On Mon, Nov 16 2020 at  4:20pm -0500,
> Christoph Hellwig <hch@lst.de> wrote:
> 
> > Hi Jens, Minchan and Mike,
> > 
> > this series cleans up a few interactions of driver with struct
> > block_device, in preparation for big changes to struct block_device
> > that I plan to send soon.
> 
> Thanks, I've picked up 5 and 6 for 5.11.

I actually need them in Jens' for-5.11/block tree for my next series..

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

