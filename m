Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0461D78712
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jul 2019 10:13:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47B6D3084295;
	Mon, 29 Jul 2019 08:13:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DD825F9C7;
	Mon, 29 Jul 2019 08:13:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 897E041F63;
	Mon, 29 Jul 2019 08:13:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6R2CcMl017428 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jul 2019 22:12:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6554712C91; Sat, 27 Jul 2019 02:12:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from ming.t460p (ovpn-8-20.pek2.redhat.com [10.72.8.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E2525D9C6;
	Sat, 27 Jul 2019 02:12:24 +0000 (UTC)
Date: Sat, 27 Jul 2019 10:12:20 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Benjamin Block <bblock@linux.ibm.com>
Message-ID: <20190727021219.GA6926@ming.t460p>
References: <20190720030637.14447-1-ming.lei@redhat.com>
	<20190726162046.GA7523@t480-pf1aa2c2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726162046.GA7523@t480-pf1aa2c2>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 29 Jul 2019 04:12:24 -0400
Cc: Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, "James E . J . Bottomley" <jejb@linux.ibm.com>,
	"Ewan D . Milne" <emilne@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>, stable@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Bart Van Assche <bvanassche@acm.org>
Subject: Re: [dm-devel] [PATCH V2 0/2] block/scsi/dm-rq: fix leak of request
 private data in dm-mpath
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 29 Jul 2019 08:13:27 +0000 (UTC)

On Fri, Jul 26, 2019 at 06:20:46PM +0200, Benjamin Block wrote:
> Hey Ming Lei,
> 
> On Sat, Jul 20, 2019 at 11:06:35AM +0800, Ming Lei wrote:
> > Hi,
> > 
> > When one request is dispatched to LLD via dm-rq, if the result is
> > BLK_STS_*RESOURCE, dm-rq will free the request. However, LLD may allocate
> > private data for this request, so this way will cause memory leak.
> 
> I am confused about this. Probably because I am not up-to-date with
> all of blk-mq. But if you free the LLD private data before the request
> is finished, what is the LLD doing if the request finishes afterwards?
> Would that not be an automatic use-after-free?

Wrt. this special use case, the underlying request is totally covered by
dm-rq after .queue_rq() returns BLK_STS_*RESOURCE. So the request won't
be re-dispatched by blk-mq at all.

thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
