Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8DD2772C8
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:41:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-_ts3TrftNQiGk3n4mIH3NQ-1; Thu, 24 Sep 2020 09:41:11 -0400
X-MC-Unique: _ts3TrftNQiGk3n4mIH3NQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4032100854A;
	Thu, 24 Sep 2020 13:41:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DAF75C1C7;
	Thu, 24 Sep 2020 13:41:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD6661826D2C;
	Thu, 24 Sep 2020 13:41:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODetiR026674 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:40:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EBB181140EA; Thu, 24 Sep 2020 13:40:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E271B1140FC
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:40:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF11C101A53F
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:40:48 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-402-mb9R0IgROhCnD51hReRFBw-1;
	Thu, 24 Sep 2020 09:40:44 -0400
X-MC-Unique: mb9R0IgROhCnD51hReRFBw-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6AE1A68B05; Thu, 24 Sep 2020 15:40:40 +0200 (CEST)
Date: Thu, 24 Sep 2020 15:40:39 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200924134039.GA4882@lst.de>
References: <20200923200652.11082-1-snitzer@redhat.com>
	<20200923200652.11082-2-snitzer@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200923200652.11082-2-snitzer@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	dm-devel@redhat.com, linux-block@vger.kernel.org, hch@lst.de
Subject: Re: [dm-devel] [PATCH 1/2] block: add QUEUE_FLAG_NOWAIT
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

On Wed, Sep 23, 2020 at 04:06:51PM -0400, Mike Snitzer wrote:
> Add QUEUE_FLAG_NOWAIT to allow a block device to advertise support for
> REQ_NOWAIT. Bio-based devices may set QUEUE_FLAG_NOWAIT where
> applicable.
> 
> Update QUEUE_FLAG_MQ_DEFAULT to include QUEUE_FLAG_NOWAIT.  Also
> update submit_bio_checks() to verify it is set for REQ_NOWAIT bios.
> 
> Reported-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Mike Snitzer <snitzer@redhat.com>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

