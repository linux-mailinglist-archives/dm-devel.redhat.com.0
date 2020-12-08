Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9005C2D2783
	for <lists+dm-devel@lfdr.de>; Tue,  8 Dec 2020 10:26:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-2qrvLmvWOXa-Y31JVRx5gA-1; Tue, 08 Dec 2020 04:26:17 -0500
X-MC-Unique: 2qrvLmvWOXa-Y31JVRx5gA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66A0F10059A9;
	Tue,  8 Dec 2020 09:26:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 765A85D9DE;
	Tue,  8 Dec 2020 09:26:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CCCB0180954D;
	Tue,  8 Dec 2020 09:26:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B89PrA1026152 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 04:25:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BAA392166B2B; Tue,  8 Dec 2020 09:25:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5C5E2166B2A
	for <dm-devel@redhat.com>; Tue,  8 Dec 2020 09:25:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D0258001B8
	for <dm-devel@redhat.com>; Tue,  8 Dec 2020 09:25:51 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-246-rC7V5KKIPdu_AiBqt8xF9w-1;
	Tue, 08 Dec 2020 04:25:49 -0500
X-MC-Unique: rC7V5KKIPdu_AiBqt8xF9w-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 588796736F; Tue,  8 Dec 2020 10:25:45 +0100 (CET)
Date: Tue, 8 Dec 2020 10:25:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Message-ID: <20201208092545.GA13901@lst.de>
References: <20201207131918.2252553-1-hch@lst.de>
	<20201207131918.2252553-5-hch@lst.de>
	<yq1y2i8x42d.fsf@ca-mkp.ca.oracle.com>
MIME-Version: 1.0
In-Reply-To: <yq1y2i8x42d.fsf@ca-mkp.ca.oracle.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>,
	Mike Snitzer <snitzer@redhat.com>, Oleksii Kurochko <olkuroch@cisco.com>,
	ceph-devel@vger.kernel.org, Dongsheng Yang <dongsheng.yang@easystack.cn>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-nvme@lists.infradead.org, Ilya Dryomov <idryomov@gmail.com>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 4/6] block: propagate BLKROSET on the whole
 device to all partitions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 08, 2020 at 12:27:41AM -0500, Martin K. Petersen wrote:
> 
> Christoph,
> 
> > The existing behavior is inconsistent in the sense that doing:
> >
> > permits writes. But:
> >
> > <something triggers revalidate>
> >
> > doesn't.
> >
> > And a subsequent:
> 
> Looks like the command line pieces got zapped from the commit
> description.

Yeah.  It seems like git commit just removed them after I pasted them,
weird.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

