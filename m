Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6F732E2AFC
	for <lists+dm-devel@lfdr.de>; Thu, 24 Oct 2019 09:22:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571901744;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x21Slj4AmrxgJll1ApVkTllW3eKjqtwR2vwfIvigtj8=;
	b=FupsxXzdnfTOB2qHeiGr8GUNle0ykh8HE9SKOq/z9BofYH7njgEoEI+pjsEU8j/5A7u+ZX
	M1mmSL3M954prxizwlVk3YlCXNWzK6NtfLeqi2THsGSPmdmHPrD6dLatPrOourlvAiqahk
	qeAWmadBx3L7sLX/xooJ7sQinQscZKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-dCYJi15LN_O2pb_SDgsi5g-1; Thu, 24 Oct 2019 03:22:22 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 612891800DCB;
	Thu, 24 Oct 2019 07:22:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04E0260A97;
	Thu, 24 Oct 2019 07:22:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 10DDF4E58A;
	Thu, 24 Oct 2019 07:14:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9O7DiXM014649 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Oct 2019 03:13:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 35A2D60A97; Thu, 24 Oct 2019 07:13:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAA07608C1;
	Thu, 24 Oct 2019 07:13:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A55C958;
	Thu, 24 Oct 2019 07:13:38 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1iNXJR-0001xI-DA; Thu, 24 Oct 2019 07:13:37 +0000
Date: Thu, 24 Oct 2019 00:13:37 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Message-ID: <20191024071337.GC19572@infradead.org>
References: <20191024065006.8684-1-damien.lemoal@wdc.com>
	<20191024065006.8684-5-damien.lemoal@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20191024065006.8684-5-damien.lemoal@wdc.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Thu, 24 Oct 2019 07:13:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Thu, 24 Oct 2019 07:13:38 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+7d07f63deafc16831ef1+5905+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+7d07f63deafc16831ef1+5905+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, linux-scsi@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 4/4] block: Generically handle report zones
	buffer
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: dCYJi15LN_O2pb_SDgsi5g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Oct 24, 2019 at 03:50:06PM +0900, Damien Le Moal wrote:
> Instead of relying on a zoned block device driver to allocate a buffer
> for every execution of a report zones command execution, rely on the
> block layer use of the device zone report queue limits to allocate a
> buffer and keep it around when the device report_zones method is
> executed in a loop, e.g.  as in blk_revalidate_disk_zones().
> 
> This simplifies the code in the scsi sd_zbc driver as well as simplify
> the addition of zone supports for upcoming new zoned device drivers.

I wonder if we could just do away with the separate buffer entirely.
As the SCSI zone size (and also ATA even if we don't directly talk
to that) are intentionally the same size as the blk_zone (and the
same true is for the only upcoming standard I know of) we can just
rewrite each entry in-place(-ish) by reusing the same allocation.
Depending on the detailed formate we have to copy a field our two
onto the stack first, but it both avoids the extra allocation, and
the whole queue limits infrastructure in the previous patch and
should simply the code a lot.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

