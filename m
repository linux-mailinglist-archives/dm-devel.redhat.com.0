Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B9AF3226D2E
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 19:36:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-O-v45xf8NyCmM99C7Azvdw-1; Mon, 20 Jul 2020 13:36:00 -0400
X-MC-Unique: O-v45xf8NyCmM99C7Azvdw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 138BC100AA22;
	Mon, 20 Jul 2020 17:35:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A1F660E3E;
	Mon, 20 Jul 2020 17:35:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4892A1809554;
	Mon, 20 Jul 2020 17:35:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06KHZbYj021305 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 13:35:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BB345109095C; Mon, 20 Jul 2020 17:35:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B52F610CB289
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 17:35:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 957D280CC37
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 17:35:35 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-361-2gngkI6PNfiDBFcSgL0SdQ-1;
	Mon, 20 Jul 2020 13:35:32 -0400
X-MC-Unique: 2gngkI6PNfiDBFcSgL0SdQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 685336736F; Mon, 20 Jul 2020 19:35:30 +0200 (CEST)
Date: Mon, 20 Jul 2020 19:35:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20200720173530.GA21442@lst.de>
References: <20200720061251.652457-1-hch@lst.de>
	<dfe56cf2-db3d-3461-9834-be314f4080ef@kernel.dk>
MIME-Version: 1.0
In-Reply-To: <dfe56cf2-db3d-3461-9834-be314f4080ef@kernel.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Damien.LeMoal@wdc.com,
	Christoph Hellwig <hch@lst.de>, dm-devel@redhat.com
Subject: Re: [dm-devel] a fix and two cleanups around blk_stack_limits
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jul 20, 2020 at 10:56:23AM -0600, Jens Axboe wrote:
> On 7/20/20 12:12 AM, Christoph Hellwig wrote:
> > Hi Jens,
> > 
> > this series ensures that the zoned device limitations are properly
> > inherited in blk_stack_limits, and then cleanups up two rather
> > pointless wrappers around it.
> 
> We should probably make this against for-5.9/drivers instead, to avoid
> an unnecessary conflict when merging.

Then we'd also need a merge as my next series depends on this, and it
clearly is core material.  Not sure which one is more important.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

