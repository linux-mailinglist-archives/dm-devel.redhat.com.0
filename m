Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E3A2A3F9ED3
	for <lists+dm-devel@lfdr.de>; Fri, 27 Aug 2021 20:30:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-NNySNszKNWmirdu2mji2Xw-1; Fri, 27 Aug 2021 14:30:01 -0400
X-MC-Unique: NNySNszKNWmirdu2mji2Xw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99C6FC298;
	Fri, 27 Aug 2021 18:29:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 435B4177C0;
	Fri, 27 Aug 2021 18:29:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 586364BB7C;
	Fri, 27 Aug 2021 18:29:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17RIS5Vr014717 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 14:28:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8606810BC2B3; Fri, 27 Aug 2021 18:28:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8223C1084485
	for <dm-devel@redhat.com>; Fri, 27 Aug 2021 18:28:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93A9D811E7A
	for <dm-devel@redhat.com>; Fri, 27 Aug 2021 18:28:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-51-XIqZmKdLPnaBf1qgYVkkuw-1; Fri, 27 Aug 2021 14:27:59 -0400
X-MC-Unique: XIqZmKdLPnaBf1qgYVkkuw-1
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mJgZk-00Cx8z-5d; Fri, 27 Aug 2021 18:27:36 +0000
Date: Fri, 27 Aug 2021 11:27:36 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YSkumJBTztoYdzC7@bombadil.infradead.org>
References: <20210823202930.137278-1-mcgrof@kernel.org>
	<20210823202930.137278-2-mcgrof@kernel.org>
	<YSSJNTxyLHu/LsNJ@infradead.org>
MIME-Version: 1.0
In-Reply-To: <YSSJNTxyLHu/LsNJ@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Subject: Re: [dm-devel] [PATCH 01/10] scsi/sd: use blk_cleanup_queue()
 insted of put_disk()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 24, 2021 at 06:52:53AM +0100, Christoph Hellwig wrote:
> On Mon, Aug 23, 2021 at 01:29:21PM -0700, Luis Chamberlain wrote:
> > The single put_disk() is useful if you know you're not doing
> > a cleanup after add_disk(), but since we want to add support
> > for that, just use the normal form of blk_cleanup_disk() to
> > cleanup the queue and put the disk.
> 
> Hmm, I don't think this is correct.  The request_queue is owned by the
> core SCSI code.

Alright, I'll drop this one. For the life of me I can't find the respective
probe call on the scsi layer.

  Luis

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

