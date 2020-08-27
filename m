Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 796F0253F8D
	for <lists+dm-devel@lfdr.de>; Thu, 27 Aug 2020 09:48:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-2LuW87D0Ni6EqQAUtaL6Dw-1; Thu, 27 Aug 2020 03:48:50 -0400
X-MC-Unique: 2LuW87D0Ni6EqQAUtaL6Dw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E406185FD71;
	Thu, 27 Aug 2020 07:48:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4564E7BA2E;
	Thu, 27 Aug 2020 07:48:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 03AF6181A06B;
	Thu, 27 Aug 2020 07:48:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07R7mArO032220 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Aug 2020 03:48:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 804C02166BDB; Thu, 27 Aug 2020 07:48:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A6202166BB3
	for <dm-devel@redhat.com>; Thu, 27 Aug 2020 07:48:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B4B7802D3D
	for <dm-devel@redhat.com>; Thu, 27 Aug 2020 07:48:05 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-7-jXsrRFJ0Oju_YrRxR3eq4Q-1;
	Thu, 27 Aug 2020 03:48:02 -0400
X-MC-Unique: jXsrRFJ0Oju_YrRxR3eq4Q-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id EC6DB68C65; Thu, 27 Aug 2020 09:47:58 +0200 (CEST)
Date: Thu, 27 Aug 2020 09:47:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20200827074758.GA8009@lst.de>
References: <20200823091043.2600261-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200823091043.2600261-1-hch@lst.de>
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
Cc: linux-s390@vger.kernel.org, Jan Hoeppner <hoeppner@linux.ibm.com>,
	Justin Sanders <justin@coraid.com>, linux-nvme@lists.infradead.org,
	Josef Bacik <josef@toxicpanda.com>, Xianting Tian <xianting_tian@126.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Stefan Haberland <sth@linux.ibm.com>,
	nbd@other.debian.org
Subject: Re: [dm-devel] fix block device size update serialization v2
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Jens, can you consider this for 5.9?  It reliably fixes the reported
hangs with nvme hotremoval that we've had for a few releases.

On Sun, Aug 23, 2020 at 11:10:40AM +0200, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series fixes how we update i_size for the block device inodes (and
> thus the block device).  Different helpers use two different locks
> (bd_mutex and i_rwsem) to protect the update, and it appears device
> mapper uses yet another internal lock.  A lot of the drivers do the
> update handcrafted in often crufty ways.  And in addition to that mess
> it turns out that the "main" lock, bd_mutex is pretty dead lock prone
> vs other spots in the block layer that acquire it during revalidation
> operations, as reported by Xianting.
> 
> Fix all that by adding a dedicated spinlock just for the size updates.
> 
> Changes since v1:
>  - don't call __invalidate_device under the new spinlock
>  - don't call into the file system code from the nvme removal code
---end quoted text---

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

